import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Thanks for joining the Art X waiting list!',
              style: TextStyle(
                fontFamily: " Hind",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                decoration: TextDecoration.none,
              ),
            ),
            Text(
              'We will notify you via push notification as soon as registration is available or there is a change in your application status',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white.withOpacity(0.6),
                  height: 2,
                  decoration: TextDecoration.none,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w100,
                  fontSize: 15),
            ),
          ],
        ));
  }
}