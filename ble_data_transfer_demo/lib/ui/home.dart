import 'dart:io';

import 'package:ble_data_transfer_demo/service/downloader.dart';
import 'package:ble_data_transfer_demo/service/isa_data_service.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final tcIsaDeviceName = TextEditingController();
  late IsaDataService dm;

  String deviceName = '';

  int mtu = 0;

  var connected = false;

  var progressDownload = 0.0;
  var progressUpdate = 0.0;

  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;
      deviceName = _prefs.getString('device_name') ?? 'dc00135';
      tcIsaDeviceName.text = deviceName;
    });

    tcIsaDeviceName.addListener(() {
      _prefs.setString('device_name', tcIsaDeviceName.text);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    tcIsaDeviceName.dispose();
    super.dispose();
  }

  void connect() {
    dm.connect(tcIsaDeviceName.text.toLowerCase()).then((value) {
      if (value) {
        debugPrint('Is connected to "${tcIsaDeviceName.text}".');
      } else {
        debugPrint('Not connected to "${tcIsaDeviceName.text}"!!!');
      }
    });
  }

  void disconnect() {
    dm.disconnect();
  }

  void sendShort() {
    final messages = dm.sender.sendString(1, 'The quick brown fox jumps over the lazy dog.');

    for (final m in messages) {
      dm.sendData(m);
    }
  }

  Future<void> sendLong() async {
    final messages = dm.sender.sendString(
        1,
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt '
        'ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea'
        ' rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor '
        'sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna '
        'aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd '
        'gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur '
        'sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam '
        'voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata '
        'sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse '
        'molestie consequat, vel illum dolore eu f');

    for (final m in messages) {
      await dm.sendData(m);
    }
  }

  void download() async {
    const fileToDownload =
        'https://download.microsoft.com/download/d/a/1/da12d1ed-c3ce-43a4-8af6-72182d2c2d4f/VMM2008_White_Paper_Draft3.6_FINAL[1].pdf';
    //final fileToDownload = 'https://az764295.vo.msecnd.net/stable/899d46d82c4c95423fb7e10e68eba52050e30ba3/VSCodeUserSetup-ia32-1.63.2.exe';

    final stream = downloadFile(
      url: fileToDownload,
      filename: 'update.pdf',
    );
    await for (final p in stream) {
      progressDownload = p;
      setState(() {});
    }
  }

  void sendFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    final fileBuffer = await File('$dir/update.pdf').readAsBytes();

    final messages = dm.sender.sendBuffer(2, fileBuffer);

    // TODO: Set progress bar!
    // TODO: Log speed and time!
    var currentChunk = 0.0;
    for (final m in messages) {
      progressUpdate = currentChunk / messages.length;
      setState(() {});
      await dm.sendData(m);
      currentChunk += 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    dm = Provider.of<IsaDataService>(context);

    dm.connected.then((value) {
      connected = value;
      setState(() {});
    });

    dm.getMTU().then((value) {
      mtu = value;
      setState(() {});
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  controller: tcIsaDeviceName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'ISA Device Name',
                    helperText: 'Name of ISA',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                createCommandButton('Connect', connect, connected),
                createCommandButton('Disconnect', disconnect, connected),
                const SizedBox(
                  height: 20,
                ),
                createCommandButton('Send short', sendShort, connected),
                createCommandButton('Send long', sendLong, connected),
                const SizedBox(
                  height: 20,
                ),
                createCommandButton('Download file', download, true),
                LinearProgressIndicator(
                  value: progressDownload,
                  semanticsLabel: 'Linear progress indicator',
                ),
                createCommandButton('Send file', sendFile, connected),
                LinearProgressIndicator(
                  value: progressUpdate,
                  semanticsLabel: 'Linear progress indicator',
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('MTU: $mtu'),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget createCommandButton(String name, Function? f, bool connected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  const Color(0xFF0D47A1),
                  const Color(0xFF2AC0A8),
                  connected ? const Color(0xFF5AF542) : const Color(0xFFE8031C),
                ],
              ),
            ),
            child: TextButton(
                onPressed: () {
                  debugPrint(name);
                  f != null ? f() : debugPrint('No function!');
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: Text(name))),
      ),
    );
  }
}
