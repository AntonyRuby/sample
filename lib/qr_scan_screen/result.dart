import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result(this.scanData);

  final String scanData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: Center(
              child: Icon(Icons.check_circle, color: Colors.green, size: 216.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                scanData,
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
