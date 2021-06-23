import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sample/qr_scan_screen/result.dart';
import 'package:url_launcher/url_launcher.dart';

class QrcodeScannerScreen extends StatefulWidget {
  @override
  _QrcodeScannerScreenState createState() => _QrcodeScannerScreenState();
}

class _QrcodeScannerScreenState extends State<QrcodeScannerScreen> {
  GlobalKey qrKey = GlobalKey();
  var qrText = "";
  QRViewController controller;
  // static const _url = 'https://flutter.dev';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(
      //     child: Text(
      //       "Qr Code Scanner",
      //       style: TextStyle(color: Colors.white, fontSize: 20),
      //     ),
      //   ),
      //   backgroundColor: Colors.blue,
      //   elevation: 0,
      // ),
      body: QRView(
          key: qrKey,
          overlay: QrScannerOverlayShape(
              borderColor: Colors.blue,
              borderRadius: 20.0,
              borderLength: 50,
              cutOutSize: 300),
          onQRViewCreated: _onQRViewCreate),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreate(QRViewController controller) {
    this.controller = controller;
    bool scanned = false;
    controller.scannedDataStream.listen((scanData) {
      if (!scanned) {
        scanned = true;

        launch(scanData.code);
        print(scanData.code);
      }
    });
  }
}
