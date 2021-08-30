import 'package:flutter/material.dart';

import 'Orientation.dart';
import 'iCalculator.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return SimpleCalculator();
          } else {
            return MyHomePage();
          }
        },
      ),
    );
  }
}
