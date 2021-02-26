import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hi Lautaro Nicolás!',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                backgroundColor: Colors.pinkAccent,
                fontSize: 40
              ),
            ),

          ],
        ),
      ),

    );
  }
}
