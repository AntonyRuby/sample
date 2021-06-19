import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Result extends StatelessWidget {
  Result(this.scanData);
  Barcode scanData;

  // final String scanData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     // Padding(
        //     //   padding: const EdgeInsets.all(48.0),
        //     //   child: Center(
        //     //     child: Icon(Icons.check_circle, color: Colors.green, size: 216.0),
        //     //   ),
        //     // ),
        //     // Padding(
        //     //   padding: const EdgeInsets.all(16.0),
        //     //   child: Center(
        //     //     child: (scanData != null)
        //     //         // ? Text(
        //     //         //     'Barcode Type: ${describeEnum(scanData.format)}   Data: ${scanData.code}')
        //     //         // : Text(
        //     //         //     'Scan a code',
        //     //         //     style: TextStyle(fontSize: 32),
        //     //         //   ),

        //     //   ),
        //     // ),
        //   ],
        // ),

        );
  }
}
