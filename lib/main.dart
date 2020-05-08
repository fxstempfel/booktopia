import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'barcode.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booktopia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Booktopia'),
      routes: <String, WidgetBuilder>{
        "/$BarcodeScanner": (context) => BarcodeScanner(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Text(
            'Ta bibliothèque',
          ),
        ),
        floatingActionButton: SpeedDial(
          // TODO custom icons
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(child: Icon(Icons.search), label: 'Rechercher'),
            SpeedDialChild(
                child: Icon(Icons.camera_alt),
                label: 'Scanner code-barres',
                onTap: () => Navigator.pushNamed(context, '/$BarcodeScanner')),
            SpeedDialChild(child: Icon(Icons.file_upload), label: 'Importer')
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
