
import 'dart:convert';

import '../generated/proto/transfer_data.pb.dart';


class Sender {

  Future<bool> sendString(int address, String s) async {

    final data = TransferData();
    data.address = address;
    data.currentChunk = 0;
    data.data = utf8.encode(s);

    final buffer = data.writeToBuffer();

    print('Buffer length: ${buffer.length}');
    print('Payload: ${data.data.length / buffer.length * 100}%');

    return true;
  }

}