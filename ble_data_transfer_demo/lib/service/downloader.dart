import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

Stream<double> downloadFile(
    {required String url, required String filename}) async* {
  var httpClient = http.Client();
  var request = http.Request('GET', Uri.parse(url));
  var response = httpClient.send(request);
  String dir = (await getApplicationDocumentsDirectory()).path;

  List<List<int>> chunks = [];
  int downloaded = 0;
  double progress = 0.0;
  bool finished = false;

  final f = NumberFormat("####0.0");

  final start = DateTime.now();

  await checkConnectionType();

  response.asStream().listen((http.StreamedResponse r) {
    r.stream.listen((List<int> chunk) {
      // Display percentage of completion
      progress = downloaded / (r.contentLength ?? 0.0);
      // debugPrint('downloadPercentage: ${downloaded / (r.contentLength ?? 0.0) * 100}');
      chunks.add(chunk);
      downloaded += chunk.length;
    }, onDone: () async {
      // Display percentage of completion
      // debugPrint('downloadPercentage: ${downloaded / (r.contentLength ?? 0.0) * 100}');
      progress = downloaded / (r.contentLength ?? 0.0);

      // Save the file
      File file = File('$dir/$filename');
      debugPrint('Filepath: "${file.path}".');
      final Uint8List bytes = Uint8List(r.contentLength ?? 0);
      int offset = 0;
      for (List<int> chunk in chunks) {
        bytes.setRange(offset, offset + chunk.length, chunk);
        offset += chunk.length;
      }
      await file.writeAsBytes(bytes).then((value) {
        final duration = (DateTime.now().difference(start)).inMilliseconds;
        debugPrint('Download took ${f.format(duration / 1000)}s');
        debugPrint('Size: ${f.format(downloaded / 1024.0 / 1024)} MB');
        debugPrint(
            'Speed: ${f.format(downloaded / 1024.0 / 1024 / duration * 1000)} MB/s');
        finished = true;
        return;
      }).catchError((e) {
        debugPrint('Download failed!!! $e');
        finished = true;
        return;
      });
    });
  });

  while (!finished) {
    await Future.delayed(const Duration(milliseconds: 200));

    if (progress == double.infinity || progress == double.nan) {
      yield 0.0;
    } else {
      debugPrint('${f.format(progress * 100)}%');
      yield progress;
    }
  }
}

Future<void> checkConnectionType() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    debugPrint('I am connected to a mobile network.');
  } else if (connectivityResult == ConnectivityResult.wifi) {
    debugPrint('I am connected to a wifi network.');
  }
}
