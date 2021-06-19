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
  static const _url = 'https://flutter.dev';

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

        launch(_url);
      }
    });
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_linkify/flutter_linkify.dart';
// import 'package:url_launcher/url_launcher.dart';

// class QrcodeScannerScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return QrcodeScannerScreenState();
//   }
// }

// class QrcodeScannerScreenState extends State<QrcodeScannerScreen> {
//   String _barcode = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Scanner'),
//       ),
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Image.asset(
//               'assets/barcode.png',
//               height: 150,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
//               child: RaisedButton(
//                 color: Colors.lightBlue[700],
//                 textColor: Colors.black,
//                 splashColor: Colors.blueGrey,
//                 onPressed: scan,
//                 child: const Text('Scansiona il codice QR.'),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//               child: Linkify(
//                 onOpen: (link) async {
//                   if (await canLaunch(link.url)) {
//                     await launch(link.url);
//                   } else {
//                     throw 'Could not launch $link';
//                   }
//                 },
//                 text: _barcode,
//                 style: TextStyle(color: Colors.yellow),
//                 linkStyle: TextStyle(color: Colors.blue),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future scan() async {
//     try {
//       String barcode = await BarcodeScanner.scan();
//       setState(() => this._barcode = barcode);
//     } on PlatformException catch (e) {
//       if (e.code == BarcodeScanner.CameraAccessDenied) {
//         setState(() {
//           this._barcode = 'Scusami, mi dai il permesso di usare la fotocamera?';
//         });
//       } else {
//         setState(() => this._barcode = 'Errore sconosciuto $e');
//       }
//     } on FormatException {
//       setState(() => this._barcode =
//           'null, hai premuto il pulsante per tornare indietro prima di scansionare     qualcosa');
//     } catch (e) {
//       setState(() => this._barcode = 'Errore sconosciuto : $e');
//     }
//   }
// }
