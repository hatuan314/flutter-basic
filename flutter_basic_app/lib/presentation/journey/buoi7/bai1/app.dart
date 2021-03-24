import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/bai1/constrants/route_constantsbuoi7bai1.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/buoi7_routers.dart';
class buoi7bai1 extends StatelessWidget {
  String init() {
    return Routebai1.home_page;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.blue,
      ),
      initialRoute: init(),
      routes: Buoi7Routes.getAll(),
    );
  }
}
