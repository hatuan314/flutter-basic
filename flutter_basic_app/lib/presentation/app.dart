import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/routes.dart';

class MyApp extends StatelessWidget {
  String get initialRoute {
    return RouteList.b7Scr1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'MS'
      ),
      // home: Screen2(),
      routes: Routes.getAll(),
      initialRoute: initialRoute,
    );
  }
}

