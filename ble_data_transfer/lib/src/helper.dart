import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

class Helper {
  static final Hash _hashGenerator = md5;

  static List<int> hashString(String s) {
    return _hashGenerator.convert(utf8.encode(s)).bytes.sublist(0, 2);
  }

  static List<int> hashList(List<int> list) {
    return _hashGenerator.convert(list).bytes.sublist(0, 2);
  }

  static List<List<int>> splitBuffer(List<int> buffer, int length) {
    List<List<int>> ret = [];

    for (var i = 0; i < buffer.length; i += length) {
      ret.add(buffer.sublist(i, min(i + length, buffer.length)));
    }
    return ret;
  }

  static List<int> mergeBuffer(List<List<int>> list) {
    // TODO: Slow!
    List<int> ret = [];

    for (var l in list) {
      for (var i in l) {
        ret.add(i);
      }
    }
    return ret;
  }
}
