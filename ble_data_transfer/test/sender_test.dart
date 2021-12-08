import 'dart:convert';
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

    final s1000 = 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt '
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

    test('Test merge and split', () {
      // Long message:
      var split = sender.splitBuffer(utf8.encode(s1000));
      var merged = sender.mergeBuffer(split);
      expect(s1000, utf8.decode(merged), reason: 'Merge/split failed!');

      // Check hash equal:
      var h1 = sender.hashString(s1000);
      var h2 = sender.hashString(utf8.decode(merged));
      expect(h1, h2);

      // Short message:
      split = sender.splitBuffer(utf8.encode('Hallo'));
      merged = sender.mergeBuffer(split);
      expect('Hallo', utf8.decode(merged), reason: 'Merge/split failed!');

      // Check hash equal:
      h1 = sender.hashString('Hallo');
      h2 = sender.hashString(utf8.decode(merged));
      expect(h1, h2);
    });

    test('Full round, tests also the buffer', () {
      for (var s in ['', s1, s250, s1000]) {
        final m = sender.sendString(2, s);
        expect(s, sender.receiveString(m));
      }
    });
  });
}
