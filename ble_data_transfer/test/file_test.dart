import 'package:ble_data_transfer/src/file_transfer.dart';
import 'package:test/test.dart';

void main() {
  group('File tests', () {
    final sender = FileTransfer();

    setUp(() {
      // Additional setup goes here.
    });

    test('One way', () async {
      await sender.setFileToSend('./assets/design.pdf');
      final startMessage = sender.getStartMessage('design.pdf');

      // Little more then one MB:
      expect(startMessage.chunks, 11);

      for (var i = 0; i < 11; i++) {
        final chunk = sender.getNextChunk();
        print('Length: ${chunk?.length}');
      }

      // When done return null:
      final chunk = sender.getNextChunk();
      expect(chunk, null);
    });

    // test('Raw message', () {
    //   final testArray = [1, 2, 3, 4];
    //   final h1 = sender.sendBuffer(10, testArray);
    //   final merged = sender.receiveBuffer(h1);
    //   expect(merged, testArray);
    // });
    //
    // test('Test merge and split', () {
    //   // Long message:
    //   var split = Helper.splitBuffer(utf8.encode(s1000), 200);
    //   var merged = Helper.mergeBuffer(split);
    //   expect(s1000, utf8.decode(merged), reason: 'Merge/split failed!');
    //
    //   // Check hash equal:
    //   var h1 = Helper.hashString(s1000);
    //   var h2 = Helper.hashString(utf8.decode(merged));
    //   expect(h1, h2);
    //
    //   // Short message:
    //   split = Helper.splitBuffer(utf8.encode('Hallo'), 300);
    //   merged = Helper.mergeBuffer(split);
    //   expect('Hallo', utf8.decode(merged), reason: 'Merge/split failed!');
    //
    //   // Check hash equal:
    //   h1 = Helper.hashString('Hallo');
    //   h2 = Helper.hashString(utf8.decode(merged));
    //   expect(h1, h2);
    // });
    //
    // test('Full round, tests also the buffer', () {
    //   for (var s in ['', s1, s250, s1000]) {
    //     final m = sender.sendString(2, s);
    //     expect(s, sender.receiveString(m));
    //   }
    // });
    //
    // test('Hash', () {
    //   final h = Helper.hashList([1, 2, 3, 4]);
    //   expect([8, 214], h);
    // });
  });
}
