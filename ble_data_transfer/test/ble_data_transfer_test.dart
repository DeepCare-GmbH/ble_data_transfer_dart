import 'dart:convert';
import 'package:ble_data_transfer/ble_data_transfer.dart';
import 'package:test/test.dart';
import '../../proto/transfer_data.pb.dart';


void main() {
  group('A group of tests', () {
    final awesome = Awesome();

    setUp(() {
      // Additional setup goes here.
      print('setup');
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);

      String foo = 'Hello world';
      List<int> bytes = utf8.encode(foo);
      print(bytes);
    });

    test('First PB Test', () {
      expect(awesome.isAwesome, isTrue);

      var data = TransferData();
      data.address = 655550050;
      data.hash = [255,255];
      data.currentChunk = 655550050;
      data.overallChunks = 655007880;
      var buffer = data.writeToBuffer();
      print('Length: ${buffer.length}');

    });


  });
}
