import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/screen_2.dart';

import 'screen_1.dart';

class Buoi6Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.b6Src1: (context) => B6Screen1(),
      RouteList.b6Src2: (context) => B6Screen2(),
    };
  }
}
