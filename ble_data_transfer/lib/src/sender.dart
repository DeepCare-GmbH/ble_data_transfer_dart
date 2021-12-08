import 'dart:convert';
import 'dart:math';
import '../generated/proto/transfer_data.pb.dart';
import 'package:crypto/crypto.dart';

class Sender {
  Hash hashGenerator = md5;
  final mtu = 185; // TODO: Read from Bluetooth;
  final payload = 185 - 22; // TODO: Calc!

  List<TransferData> sendString(int address, String s) {
    final buffer = utf8.encode(s);
    return sendBuffer(address, buffer);
  }

  List<TransferData> sendBuffer(int address, List<int> b) {
    List<TransferData> messages = [];

    final parts = splitBuffer(b);
    int currentChunk = 0;

    final hash = hashList(b);

    // Send all chunks:
    if (parts.isNotEmpty) {
      for (var part in parts) {
        final data = TransferData();

        data.address = address;
        data.hash = hash;
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
      data.hash = hash;
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

    for (var i = 0; i < buffer.length; i += payload) {
      ret.add(buffer.sublist(i, min(i + payload, buffer.length)));
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
    return mergeBuffer(list);
  }
}
