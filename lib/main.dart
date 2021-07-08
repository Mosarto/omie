import 'package:api/Screen/HomeScreen.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  doWhenWindowReady(() {
    var initialsize = Size(1000, 650);
    appWindow.size = initialsize;
    appWindow.minSize = initialsize;
    appWindow.title = "Omie";
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Omie',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomeScreen(),
    );
  }
}
