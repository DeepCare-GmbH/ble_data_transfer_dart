import 'dart:convert';
import 'package:ble_data_transfer/src/helper.dart';
import 'package:ble_data_transfer/src/sender.dart';
import 'package:test/test.dart';

void main() {
  group('Sender tests', () {
    final sender = Sender();

    final s1 = 'The quick brown fox jumps over the lazy dog.';

    final s250 =
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et '
        'dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. '
        'Stet clita kasd gubergren, no sea tak';

    final s1000 =
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt '
        'ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea'
        ' rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor '
        'sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna '
        'aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd '
        'gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur '
        'sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam '
        'voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata '
        'sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse '
        'molestie consequat, vel illum dolore eu f';

    setUp(() {
      // Additional setup goes here.
    });

    test('One way', () {
      sender.sendString(2, s1);

      sender.sendString(4545, s250);
      sender.sendString(65465, s1000);
    });

    test('Raw message', () {
      final testArray = [1, 2, 3, 4];
      final h1 = sender.sendBuffer(10, testArray);
      final merged = sender.receiveBuffer(h1);
      expect(merged, testArray);
    });

    test('Test merge and split', () {
      // Long message:
      var split = Helper.splitBuffer(utf8.encode(s1000), 200);
      var merged = Helper.mergeBuffer(split);
      expect(s1000, utf8.decode(merged), reason: 'Merge/split failed!');

      // Check hash equal:
      var h1 = Helper.hashString(s1000);
      var h2 = Helper.hashString(utf8.decode(merged));
      expect(h1, h2);

      // Short message:
      split = Helper.splitBuffer(utf8.encode('Hallo'), 300);
      merged = Helper.mergeBuffer(split);
      expect('Hallo', utf8.decode(merged), reason: 'Merge/split failed!');

      // Check hash equal:
      h1 = Helper.hashString('Hallo');
      h2 = Helper.hashString(utf8.decode(merged));
      expect(h1, h2);
    });

    test('Full round, tests also the buffer', () {
      for (var s in ['', s1, s250, s1000]) {
        final m = sender.sendString(2, s);
        expect(s, sender.receiveString(m));
      }
    });

    test('Hash', () {
      final h = Helper.hashList([1, 2, 3, 4]);
      expect([8, 214], h);
    });
  });
}
