
import 'package:flutter/material.dart';
import 'package:ghichu/common/constants/route_constants.dart';
import 'package:ghichu/presentation/journey/group/add_list/add_list_screen.dart';
import 'package:ghichu/presentation/journey/home/home_page/home_page.dart';
class Routes {
  static Map<String, WidgetBuilder> getAll(){
    return {
      RouteList.homePage:(context)=>HomePage(),
      RouteList.addList:(context)=>AddListScreen(),
    };
  }
  }