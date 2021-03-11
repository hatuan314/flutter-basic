import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';

import 'bai_1.dart';
import 'bai_2.dart';
import 'bai_3_screen_1.dart';
import 'bai_3_screen_2.dart';
import 'bai_3_screen_3.dart';


class Buoi6Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.b6Src1: (context) => Bai1(),
      RouteList.b6Src2: (context) => Bai2(),
      RouteList.b6Src3: (context) => B3Screen1(),
      RouteList.b6Src4: (context) => B3Screen2(),
      RouteList.b6Src5: (context) => B3Screen3(),
    };
  }
}
