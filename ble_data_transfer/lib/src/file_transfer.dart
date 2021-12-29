import 'dart:io';

import '../generated/proto/transfer_data.pb.dart';

class FileTransfer {
  List<List<TransferData>> sendFile(String path) {
    final fileBuffer = readFile(path);
  }

  Future<List<int>> readFile(String path) async {
    final file = File('file.txt');
    return await file.readAsBytes();
  }
}
