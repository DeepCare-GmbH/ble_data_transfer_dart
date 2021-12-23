import 'package:ble_data_transfer_demo/service/isa_data_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final tcIsaDeviceName = TextEditingController();
  late IsaDataService dm;

  @override
  void initState() {
    super.initState();

    tcIsaDeviceName.text = 'dc00135';
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    tcIsaDeviceName.dispose();
    super.dispose();
  }

  void connect() {
    dm.connect(tcIsaDeviceName.text).then((value) {
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

  @override
  Widget build(BuildContext context) {
    dm = Provider.of<IsaDataService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tcIsaDeviceName,
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'ISA Device Name'),
              ),
            ),
            createCommandButton('Connect', connect),
            createCommandButton('Disconnect', disconnect),
            createCommandButton('Send short', null),
            createCommandButton('Send long', null),
            createCommandButton('Download file', null),
            createCommandButton('Send file', null),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget createCommandButton(String name, Function? f) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF0D47A1),
                  Color(0xFF1976D2),
                  Color(0xFF42A5F5),
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
