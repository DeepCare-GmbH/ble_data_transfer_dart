import 'package:ble_data_transfer_demo/service/isa_data_service.dart';
import 'package:ble_data_transfer_demo/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => IsaDataService(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const Home(title: 'BLE Transfer Demo'),
      ),
    );
  }
}
