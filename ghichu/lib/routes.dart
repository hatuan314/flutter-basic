import 'package:flutter/material.dart';
import 'package:ghichu/common/constants/route_constants.dart';
import 'package:ghichu/presentation/journey/group/route_group/route_group.dart';
import 'package:ghichu/presentation/journey/home/route/route_home.dart';
import 'package:ghichu/presentation/journey/reminder/route_reminder.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      ...RouteGroup.getAll(),
      ...RouteHome.getAll(),
      ...RouteReminder.getAll(),
    };
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteList.todayPage:
      case RouteList.details:
      case RouteList.newReminder:
      case RouteList.listGroup:
        return MaterialPageRoute(
            builder:
                RouteReminder.getRoutesWithSettings(settings)[settings.name],
            settings: settings);
    }
  }
}
