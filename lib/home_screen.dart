import 'package:flutter/material.dart';
import 'package:sample/qr_scan_screen/qr_scan_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
          actions: [
            IconButton(
                icon: Icon(Icons.forward),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QrcodeScannerScreen()));
                })
          ],
        ),
        body: Column());
  }
}
