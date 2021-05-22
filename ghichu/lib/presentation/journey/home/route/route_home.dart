

import 'package:flutter/cupertino.dart';
import 'package:ghichu/common/constants/route_constants.dart';
import 'package:ghichu/presentation/journey/home/home_page/home_page.dart';

class RouteHome{
  static Map<String,WidgetBuilder> getAll(){
    return {
      RouteList.homePage:(context)=>HomePage(),
    };
  }
}