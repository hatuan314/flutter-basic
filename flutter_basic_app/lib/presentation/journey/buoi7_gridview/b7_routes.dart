import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7_gridview/learn_grid_view.dart';

class Buoi7Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.b7Scr1: (context) => LearnGridView(),
    };
  }
}
