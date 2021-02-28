import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/home_screen.dart';
import 'package:flutter_basic_app/presentation/journey/buoi5/screen_1.dart';
import 'package:flutter_basic_app/presentation/journey/buoi5/screen_2.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Screen2(),
    );
  }
}

