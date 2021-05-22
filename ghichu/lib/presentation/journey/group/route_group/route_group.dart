
import 'package:flutter/cupertino.dart';
import 'package:ghichu/common/constants/route_constants.dart';
import 'package:ghichu/presentation/journey/group/add_list/add_list_screen.dart';

class RouteGroup{
  static Map<String,WidgetBuilder> getAll(){
    return {
      RouteList.addGroup:(context)=>AddGroupScreen(),
    };
  }
}