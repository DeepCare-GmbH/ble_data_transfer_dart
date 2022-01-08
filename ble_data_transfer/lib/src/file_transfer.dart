import 'dart:io';
import 'package:ble_data_transfer/src/sender.dart';
import '../generated/proto/transfer_data.pb.dart';
import '../generated/proto/messages.pb.dart';
import 'helper.dart';

class FileTransfer {
  FileTransfer({this.chunkSize = 100, mtu = 512});

  Sender sender = Sender(mtu: 512);

  StartTransferRequest? startMessage;
  List<List<TransferData>> fileData = [];
  List<int> _fileHash = [];
  int _currentChunk = 0;
  int chunkSize;

  int get currentChunk => _currentChunk;

  set currentChunk(int currentChunk) {
    if (currentChunk < fileData.length) {
      _currentChunk = currentChunk;
    } else {
      throw Exception('Chunk out of range!');
    }
  }

  int get totalChunks => fileData.length;

  Future<bool> setFileToSend(String path) async {
    fileData.clear();
    _currentChunk = 0;

    final fileBuffer = await readFile(path);
    _fileHash = Helper.hashListFull(fileBuffer);
    final fileChunks = Helper.splitBuffer(fileBuffer, 100 * 1024); // 100kB

    for (final c in fileChunks) {
      fileData.add(sender.sendBuffer(1, c));
    }
    return true;
  }

  StartTransferRequest getStartMessage(String filename) {
    final start = StartTransferRequest();
    start.filename = filename;
    start.hash = _fileHash;
    start.chunks = fileData.length;

    // Enum via <Message>_<Enum>:
    start.target = Target.PLAIN_FILE;
    start.direction = StartTransferRequest_Direction.MAIN;

    return start;
  }

  List<TransferData>? getNextChunk() {
    if (_currentChunk < fileData.length) {
      print('Chunk #$_currentChunk');
      return fileData[_currentChunk++];
    } else {
      return null;
    }
  }

  Future<List<int>> readFile(String path) async {
    final file = File(path);
    return await file.readAsBytes();
  }
}
