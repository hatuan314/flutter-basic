import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_8/bai_1/number_of_items.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_8/bai_2/b8_bai_2.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_8/bai_2/like_post.dart';
import 'package:provider/provider.dart';

import 'bai_1/b8_bai_1.dart';

class Buoi8Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.b8Src1: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => ItemCounter(),
              )
            ],
            child: B8Bai1(),
          ),
      RouteList.b8Src2: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => Like(),
              )
            ],
            child: B8Bai2(),
          ),
    };
  }
}
