import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class BluetoothDeviceService {
  Future<BluetoothDevice> connectDevice(String deviceName);
  Future<bool> disconnect();

  Future<String?> readStringCharacteristic(String serviceUuid, String characteristicUuid);

  Future<List<int>?> readRawCharacteristic(String serviceUuid, String characteristicUuid);

  Future<bool> writeRawCharacteristic(String serviceUuid, String characteristicUuid, List<int> data);

  Future<bool> isIsaConnected();

  bool get connected;
}

class BluetoothDeviceServiceImpl extends BluetoothDeviceService {
  BluetoothDeviceServiceImpl({required this.flutterBlue});

  final FlutterBlue flutterBlue;
  BluetoothDevice? device;

  bool connectedInternal = false;

  // TODO: Added delays to avoid following error. Maybe only needed for Android!
  // PlatformException(read_characteristic_error, unknown reason, may occur if
  // readCharacteristic was called before last read finished
  final int waitTimeWrite = 5; // TODO: Not needed?
  final int waitTimeRead = 5; // TODO: Not needed?
  var bleBlocked = true; // Mutex to avoid reading and writing at same time.

  Map characteristicMap = <String, BluetoothCharacteristic>{};

  BluetoothDeviceState blueToothState = BluetoothDeviceState.disconnected;

  // TODO: Create custom logger
  final logger = Logger(
    printer: PrettyPrinter(),
  );
  final loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  @override
  bool get connected {
    return connectedInternal;
  }

  @override
  Future<BluetoothDevice> connectDevice(String deviceName) async {
    Completer<BluetoothDevice> _completer = Completer();

    // Check whether all needed rights are granted:
    await checkRights();

    var foundDevice = false;

    // Start scanning
    await flutterBlue.startScan(timeout: const Duration(seconds: 5));

    // Listen to scan results
    flutterBlue.scanResults.listen((results) async {
      // do something with scan results
      for (ScanResult r in results) {
        debugPrint('"${r.device.name}" (${r.device.id})');
        if (r.device.name == deviceName &&
            ((r.device.state.toString()) != BluetoothDeviceState.connected.toString() ||
                r.device.state.toString() != BluetoothDeviceState.connecting.toString())) {
          // Device found: TODO: Async
          loggerNoStack.i('Found device "$deviceName" in scan.');
          foundDevice = true;
          flutterBlue.stopScan();
          device = r.device;
          break;
        }
      }

      if (!foundDevice) {
        loggerNoStack.w('Device "$deviceName" not found during scan!');
      }

      // Connect to device:
      await device?.connect(autoConnect: false);

      // Subscribe state scream:
      device?.state.listen((event) {
        blueToothState = event;
        debugPrint('State: $event');
        connectedInternal = event == BluetoothDeviceState.connected;
      });

      // TODO: Check but should be as big as possible:
      // if (Platform.isAndroid) {
      //   await device?.requestMtu(185);
      // }

      if (device != null) {
        loggerNoStack.i('ISA connected.');

        // Detect all services and store in map:
        List<BluetoothService> services = await device!.discoverServices();
        discoverServices(services);

        bleBlocked = false;

        _completer.complete(device);
      } else {
        logger.e('Failed to connect to ISA!');
        _completer.completeError('Failed to connect!');
      }
    });

    return _completer.future;
  }

  @override
  Future<bool> disconnect() async {
    if (device != null) {
      device!.disconnect();
      return true;
    }

    logger.w('No device connected!');
    // TODO: Return real error!
    return Future.value(false);
  }

  @override
  Future<String?> readStringCharacteristic(String serviceUuid, String characteristicUuid) async {
    Completer<String> _completer = Completer();

    if (bleBlocked) {
      logger.e('Device blocked READ!');
      return null;
    }

    if (device != null) {
      bleBlocked = true;
      try {
        await Future.delayed(Duration(milliseconds: waitTimeRead));

        final start = DateTime.now();
        List<int> value = await characteristicMap[characteristicUuid].read();
        debugPrint('Characteristic reading took ${DateTime.now().difference(start).inMilliseconds}ms.');
        _completer.complete(String.fromCharCodes(value));
        return _completer.future;
      } catch (e) {
        logger.e(e);
        bleBlocked = false;
        return null;
      }
    } else {
      logger.e('Device is null!');
      return null;
    }
  }

  @override
  Future<List<int>?> readRawCharacteristic(String serviceUuid, String characteristicUuid) async {
    Completer<List<int>> _completer = Completer();

    if (bleBlocked) {
      // logger.e('Device blocked READ RAW!');
      return null;
    }

    if (device != null) {
      if (characteristicMap.containsKey(characteristicUuid)) {
        bleBlocked = true;
        try {
          await Future.delayed(Duration(milliseconds: waitTimeRead));
          final start = DateTime.now();
          List<int> value = await characteristicMap[characteristicUuid].read();
          debugPrint('Characteristic reading took ${DateTime.now().difference(start).inMilliseconds}ms.');
          bleBlocked = false;
          _completer.complete(value);
        } catch (e) {
          logger.e(e);
          bleBlocked = false;
        }
      } else {
        logger.e('Bluetooth characteristic "$characteristicUuid" not found!');
      }
      return _completer.future;
    } else {
      //logger.e('Device is null!');
      return null;
    }
  }

  @override
  Future<bool> writeRawCharacteristic(String serviceUuid, String characteristicUuid, List<int> data) async {
    // TODO: Service not needed!

    if (bleBlocked) {
      logger.e('Device blocked WRITE!');
      return false;
    }

    try {
      bleBlocked = true;
      await Future.delayed(Duration(milliseconds: waitTimeWrite)); // TODO: Needed?
      final start = DateTime.now();
      if (characteristicMap.containsKey(characteristicUuid)) {
        await characteristicMap[characteristicUuid].write(data);
        debugPrint('Characteristic writing took ${DateTime.now().difference(start).inMilliseconds}ms.');
      } else {
        logger.e('Characteristic "$characteristicUuid" not found!');
        return false;
      }

      bleBlocked = false;
      return true;
    } catch (e) {
      logger.e(e);
      bleBlocked = false;
      return false;
    }
  }

  void discoverServices(List<BluetoothService> services) {
    /// Discover services from BLE device and store the in a map.
    /// TODO: Service ID is ignored!

    // Ignore old services and characteristics:
    characteristicMap.clear();
    for (var service in services) {
      for (var characteristic in service.characteristics) {
        characteristicMap[characteristic.uuid.toString()] = characteristic;
      }
    }
  }

  Future<bool> checkRights() async {
    var status = await Permission.camera.status;
    _checkState('Camera', status);

    // ACCESS_COARSE_LOCATION
    status = await Permission.location.status;
    _checkState('Location', status);

    status = await Permission.bluetooth.status;
    _checkState('Bluetooth', status);

    status = await Permission.bluetoothConnect.status;
    _checkState('Bluetooth Connect', status);

    status = await Permission.bluetoothScan.status;
    _checkState('Bluetooth scan', status);

    status = await Permission.storage.status;
    _checkState('Storage', status);

    status = await Permission.locationAlways.status;
    _checkState('Location always', status);

    status = await Permission.locationWhenInUse.status;
    _checkState('Location when in use', status);

    return true;
  }

  bool _checkState(String right, PermissionStatus status) {
    if (status.isDenied) {
      // Double output to show also in release mode:
      debugPrint('$right permission is denied!!!');
      logger.e('$right permission is denied!');
    } else if (status.isGranted) {
      debugPrint('$right permission is granted.');
      return true;
    } else if (status.isLimited) {
      debugPrint('$right permission is limited.');
      logger.e('$right permission is limited.');
    } else if (status.isPermanentlyDenied) {
      debugPrint('$right permission is permanently denied!!!');
      logger.e('$right permission is permanently denied!');
    } else if (status.isRestricted) {
      debugPrint('$right permission is restricted!!!');
      logger.e('$right permission is restricted!');
    } else {
      logger.e('Unknown status!');
    }
    return false;
  }

  // TODO Remove me!
  @override
  Future<bool> isIsaConnected() async {
    return await device?.state.last == BluetoothDeviceState.connected;
  }
}
