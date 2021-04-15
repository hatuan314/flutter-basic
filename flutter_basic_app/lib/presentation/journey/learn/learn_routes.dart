import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';


import 'list_screen.dart';

class LearnRoutes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.listScreen: (context) => ListScreen(),
   //   RouteList.homeScreen: (context) => MyHomePage(),
    };
  }
}