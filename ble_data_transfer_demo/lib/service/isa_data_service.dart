import 'package:ble_data_transfer_demo/generated/screen_saver.pb.dart';
import 'package:ble_data_transfer_demo/generated/stats.pb.dart';
import 'package:ble_data_transfer_demo/models/device_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:logger/logger.dart';
import 'ble_uuid.dart';
import 'bluetooth_device_service.dart';

class IsaDataService {
  // Bluetooth service instance, got from DI as singleton:
  late BluetoothDeviceService bluetoothDevice;

  late String deviceName; // Device name like "dc00112"

  final flutterBlue = FlutterBlue.instance;
  Sender s = Sender();

  DeviceStatistics? deviceStatistics; // Last statistic received via Bluetooth.
  DateTime lastUpdate = DateTime.now(); // Timestamp of last update.

  bool connectionOngoing = false;

  // TODO: Create custom logger
  final logger = Logger(
    printer: PrettyPrinter(),
  );
  final loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  /// Is Bluetooth connected?
  Future<bool> get connected async {
    return bluetoothDevice.connected;
  }

  IsaDataService() {
    // Bluetooth handler:
    bluetoothDevice = BluetoothDeviceServiceImpl(flutterBlue: flutterBlue);
  }

  /// Connect cell phone to ISA.
  Future<bool> connect(deviceName) async {
    connectionOngoing = true;
    try {
      await bluetoothDevice.connectDevice(deviceName);
      connectionOngoing = false;

      await sendUsername();

      return true;
    } catch (e) {
      // loggerNoStack.w('Could not connect to ISA!');
      connectionOngoing = false;
      return false;
    }
  }

  Future<bool> disconnect() async {
    return await bluetoothDevice.disconnect();
  }

  /// Send user name to ISA via Bluetooth.
  Future<void> sendUsername() async {
    // TODO: Write username to key value store.
    // TODO: Send also on change of the username!

    final data = ScreenSaver();
    var current = ScreenSaver();

    data.username = 'BLE Test';

    do {
      // Retry till username was written:
      debugPrint('Try to write username!');
      await bluetoothDevice.writeRawCharacteristic(BleUuid.baseService, BleUuid.screenSettings, data.writeToBuffer());
      await Future.delayed(const Duration(milliseconds: 5)); // TODO: Needed?
      final currentState = await bluetoothDevice.readRawCharacteristic(BleUuid.baseService, BleUuid.screenSettings);
      if (currentState != null) {
        current = ScreenSaver.fromBuffer(currentState);
      }
    } while (data.username != current.username);
  }

  /// Read current statistics data.
  Future<DeviceStatistics> readStatisticData() async {
    // Delta time since last update:
    final dt = DateTime.now().difference(lastUpdate).inMilliseconds;

    // Fast repeated calls served from cache:
    if (deviceStatistics != null && dt < 1000) {
      // TODO: Checked for null before but code check complaining;
      return deviceStatistics ?? DeviceStatistics.empty();
    }

    if (!bluetoothDevice.connected) {
      // Connection already started, do nothing:
      if (connectionOngoing == true) {
        return DeviceStatistics.empty();
      } else {
        debugPrint('Read but not yet connected, try to connect.');
        await connect(deviceName);
        // Avoid to fast connection tries:
        await Future.delayed(const Duration(milliseconds: 1000));
      }
    }

    final message = await bluetoothDevice.readRawCharacteristic(BleUuid.baseService, BleUuid.statics);

    if (message == null) {
      // logger.e('readRawCharacteristic returned null!');
      // Return current value or the last valid one.
      return deviceStatistics ?? DeviceStatistics.empty();
    } else if (message.isEmpty) {
      // TODO: return error!
      logger.e('readRawCharacteristic returned is empty!');
      return DeviceStatistics.empty();
    } else {
      debugPrint('Protobuf message length: ${message.length}');
      try {
        var stats = Statistics.fromBuffer(message);
        final statsProto = DeviceStatistics.fromProto(stats);
        debugPrint(statsProto.toString());

        deviceStatistics = statsProto;
        lastUpdate = DateTime.now();

        return (statsProto);
      } catch (e) {
        // TODO: return error!
        logger.e('Error, could not parse protobuf!\n$e');
        return DeviceStatistics.empty();
      }
    }
  }
}
