import 'dart:convert';
import 'package:ble_data_transfer/src/helper.dart';
import 'package:collection/collection.dart';
import '../generated/proto/transfer_data.pb.dart';
import './helper.dart';

class Sender {
  late int _payload;

  Sender({mtu = 512}) {
    _mtu = mtu;
    _payload = _mtu - 22;
  }

  int _mtu = 512; // TODO: Read from Bluetooth;

  int get mtu {
    return _mtu;
  }

  set mtu(mtu) {
    _mtu = mtu;
    _payload = _mtu - 22;
  }

  List<TransferData> sendString(int address, String s) {
    final buffer = utf8.encode(s);
    return sendBuffer(address, buffer);
  }

  List<TransferData> sendBuffer(int address, List<int> b) {
    List<TransferData> messages = [];

    final parts = Helper.splitBuffer(b, _payload);
    int currentChunk = 0;

    // Send all chunks:
    if (parts.isNotEmpty) {
      for (var part in parts) {
        final data = TransferData();

        data.address = address;
        data.hash = Helper.hashList(part);
        data.currentChunk = currentChunk;
        data.overallChunks = parts.length;

        currentChunk += 1; // Next chunk.

        data.data = part;
        final buffer = data.writeToBuffer();
        //print('Buffer length: ${buffer.length}');
        //print('Payload: ${data.data.length / buffer.length * 100}%');

        if (buffer.length > mtu) {
          throw Exception('Message exceeds MTU of $mtu!');
        }
        messages.add(data);
      }
    } else {
      final data = TransferData();

      data.address = address;
      data.hash = Helper.hashList([]);
      data.currentChunk = 0;
      data.overallChunks = 1;
      messages.add(data);
    }

    // Check string equals after split and merge:
    //final merged = mergeBuffer(parts);
    //String again = utf8.decode(merged);
    //print('Org: ${hashString(s)}');
    //print('New: ${hashString(again)}');

    // TODO: Unit test for split and merge.

    return messages;
  }

  String receiveString(List<TransferData> messages) {
    return utf8.decode(receiveBuffer(messages));
  }

  List<int> receiveBuffer(List<TransferData> messages) {
    List<List<int>> list = [];

    var chunk = 0;
    var overallChunks = -1;

    for (var m in messages) {
      // Check hash values:
      if (!IterableEquality().equals(Helper.hashList(m.data), m.hash)) {
        print('Hash wrong!');
        print('Calculated hash: ${Helper.hashList(m.data)}');
        print('Message hash:    ${m.hash}');
        throw Exception('Hash not correct!');
      }

      list.add(m.data);
      if (m.currentChunk != chunk) {
        throw Exception('Wrong chunk order!');
      }
      chunk += 1;
      overallChunks = m.overallChunks;
    }

    if (overallChunks != chunk) {
      throw Exception('Not all chunks found!');
    }

    final fullBuffer = Helper.mergeBuffer(list);
    return fullBuffer;
  }
}
