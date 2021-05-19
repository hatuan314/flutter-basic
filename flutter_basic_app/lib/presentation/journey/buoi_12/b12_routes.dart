import 'package:flutter/cupertino.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_12/example.dart';

class Buoi12Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.b12Example: (context) => B12MyHomePage(),
    };
  }
}