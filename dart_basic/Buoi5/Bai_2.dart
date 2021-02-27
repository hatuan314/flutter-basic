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
            backgroundColor: Colors.yellow,
            title: Text('Bai 2 buoi 5'),
          ),
        body: Column(
          children: [
            Text('HELLO, there!'),
            Text("Hello there welcome to our app, "
                "you can easily discover communities and tores about bike around you!"),
          Row(
            children: [
              FlatButton(
                child: Text('Next ------'),
                color: Colors.blue,
                onPressed: (){},
              )
            ],
          )
          ],
        )
        ),
      ),
    );
  }
}