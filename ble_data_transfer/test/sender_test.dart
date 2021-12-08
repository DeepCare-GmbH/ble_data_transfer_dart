import 'dart:convert';
import 'package:ble_data_transfer/ble_data_transfer.dart';
import 'package:ble_data_transfer/src/sender.dart';
import 'package:test/test.dart';
import '../../proto/transfer_data.pb.dart';


void main() {
  group('Sender tests', () {

    final sender = Sender();

    setUp(() {
      // Additional setup goes here.
      print('setup');
    });

    test('First Test', () {

      sender.sendString(2, 'The quick brown fox jumps over the lazy dog.');

    });

    test('First PB Test', () {




    });


  });
}
