import 'dart:convert';
import 'dart:math';
import 'package:collection/collection.dart';

import '../generated/proto/transfer_data.pb.dart';
import 'package:crypto/crypto.dart';

class Sender {
  Hash hashGenerator = md5;

  int _mtu = 512; // TODO: Read from Bluetooth;
  late int _payload;

  Sender() {
    _payload = _mtu - 22;
  }

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

    final parts = splitBuffer(b);
    int currentChunk = 0;

    // Send all chunks:
    if (parts.isNotEmpty) {
      for (var part in parts) {
        final data = TransferData();

        data.address = address;
        data.hash = hashList(part);
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
      data.hash = hashList([]);
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

  List<int> hashString(String s) {
    return hashGenerator.convert(utf8.encode(s)).bytes.sublist(0, 2);
  }

  List<int> hashList(List<int> list) {
    return hashGenerator.convert(list).bytes.sublist(0, 2);
  }

  List<List<int>> splitBuffer(List<int> buffer) {
    List<List<int>> ret = [];

    for (var i = 0; i < buffer.length; i += _payload) {
      ret.add(buffer.sublist(i, min(i + _payload, buffer.length)));
    }
    return ret;
  }

  List<int> mergeBuffer(List<List<int>> list) {
    // TODO: Slow!
    List<int> ret = [];

    for (var l in list) {
      for (var i in l) {
        ret.add(i);
      }
    }
    return ret;
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
      if (!IterableEquality().equals(hashList(m.data), m.hash)) {
        print('Hash wrong!');
        print('Calculated hash: ${hashList(m.data)}');
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

    final fullBuffer = mergeBuffer(list);
    return fullBuffer;
  }
}
