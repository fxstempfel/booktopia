import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class BarcodeScanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarcodeScannerState();
}

class BarcodeScannerState extends State<BarcodeScanner> {
  void scanBarcodeStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        "#ff6666", "Cancel", true, ScanMode.BARCODE)
        .listen((barcode) => print(barcode));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Barcode scan')),
            body: Builder(builder: (BuildContext context) {
              return Container(
                  alignment: Alignment.center,
                  child: FlatButton(
                    child: Text('Scanner'),
                    onPressed: scanBarcodeStream,
                  ));
            })));
  }
}
