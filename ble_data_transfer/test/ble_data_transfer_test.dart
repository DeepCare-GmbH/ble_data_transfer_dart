import 'package:test/test.dart';
import 'package:ble_data_transfer/generated/proto/transfer_data.pb.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Test hash', () {
      var data = TransferData();
      data.address = 655550050;
      data.hash = [255, 255];
      data.currentChunk = 655550050;
      data.overallChunks = 655007880;
      //var buffer = data.writeToBuffer();
      //print('Length: ${buffer.length}');
    });

    test('First PB Test', () {
      var data = TransferData();
      data.address = 655550050;
      data.hash = [255, 255];
      data.currentChunk = 655550050;
      data.overallChunks = 655007880;
      //var buffer = data.writeToBuffer();
      //print('Length: ${buffer.length}');
    });
  });
}
