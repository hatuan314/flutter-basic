
import 'package:flutter/material.dart';
import 'package:ghichu/presentation/journey/group/route_group/route_group.dart';
import 'package:ghichu/presentation/journey/home/route/route_home.dart';
import 'package:ghichu/presentation/journey/reminder/route/route_reminder.dart';
class Routes {
  static Map<String, WidgetBuilder> getAll(){
    return {
      ...RouteGroup.getAll(),
      ...RouteHome.getAll(),
      ...RouteReminder.getAll(),
      ...RouteReminder.getRoutesWithSettings(),
    };
  }
  }