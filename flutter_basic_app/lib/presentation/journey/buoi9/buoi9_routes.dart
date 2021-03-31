import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'screen.dart';
import 'screen_1.dart';
class Buoi9Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.b9Src1: (context) => B9Screen1(),
      RouteList.b9Src2: (context) => B9Screen2(),
    };
  }
}
