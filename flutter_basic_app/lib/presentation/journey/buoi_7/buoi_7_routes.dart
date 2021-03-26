import 'package:flutter/cupertino.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_7/bai_2.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_7/bai_1/pages/bai_1_screen_2.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_7/example/grid_view_ex.dart';

import 'bai_1/pages/bai_1_screen_1.dart';
import 'bai_3.dart';

class Buoi7Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.b7Src1: (context) => GridViewEx(),
      RouteList.b7Src2: (context) => B1Screen1(),
    RouteList.b7Src3: (context) => B1Screen2(),
   RouteList.b7Src4: (context) => B7Bai2(),
    RouteList.b7Src5: (context) => B7Bai3(),
  };
  }
}