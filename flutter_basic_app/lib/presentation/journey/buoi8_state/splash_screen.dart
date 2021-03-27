import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.pushNamed(context, RouteList.b8Scr1),
          child: Text('State Screen'),
        ),
      ),
    );
  }

}