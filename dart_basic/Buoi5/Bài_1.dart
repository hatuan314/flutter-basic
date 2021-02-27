import 'package:flutter/material.dart';

void main(){
  runApp(
  MyApp(),
  );
}
class MyApp extends StatelessWidget{
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('Bai 1 buoi 5'),
          ),
          body: Center(
            child: Text('Hello flutter!'),
          )
        ),
      ),
    );
  }
}