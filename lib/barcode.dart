import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// TODO this could be a single function (scanBarcodeStream()) instead of a full page

class BarcodeScanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarcodeScannerState();
}

class BarcodeScannerState extends State<BarcodeScanner> {
  var barcodes = <String>[];

  void scanBarcodeStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            "#ff6666", "Cancel", false, ScanMode.BARCODE)
        .listen((barcode) {
      setState(() {
        barcodes.add(barcode);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Scanner code barres')),
            body: Builder(builder: (BuildContext context) {
              return Column(children: [
                Text('${barcodes.join(', ')}'),
                Container(
                    alignment: Alignment.center,
                    child: FlatButton(
                      child: Text('Scanner'),
                      onPressed: scanBarcodeStream,
                    ))
              ]);
            })));
  }
}
