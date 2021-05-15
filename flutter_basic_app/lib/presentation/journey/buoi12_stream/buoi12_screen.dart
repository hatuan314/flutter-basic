import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi8_state/counter_provider.dart';
import 'package:provider/provider.dart';

import 'my_stream.dart';

class Buoi12Screen extends StatefulWidget {
  @override
  _Buoi12ScreenState createState() => _Buoi12ScreenState();

}

class _Buoi12ScreenState extends State<Buoi12Screen> {
  MyStream myStream = new MyStream();

  @override
  void dispose() {
    myStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream and Sink'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: myStream.counterStream,
              builder: (context, snapshot) => Text(
                snapshot.hasData ? snapshot.data.toString() : "0",
                style: Theme.of(context).textTheme.headline4,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myStream.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
