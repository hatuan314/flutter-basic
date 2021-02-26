import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

          crossAxisAlignment: CrossAxisAlignment.center, // Căn lề trái - phải
          mainAxisAlignment: MainAxisAlignment.center, // Căn lề trên - dưới
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Bike',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                )
              ),
                Text('.me',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),)
              ],
            ),

            Text('Everyday bike!',
              style: TextStyle(
              color: Colors.black,
              fontSize: 10,
              height: 2
              )
            )

          ],
        ),
      ),

      );

  }
}
