import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/create_new_reminder.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/home_screen.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/reminder.dart';
import 'package:provider/provider.dart';

class Buoi10Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.b10HomeScreen: (context) =>
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => Reminder(),
              )
            ],
            child:B10HomeScreen(),
          ),
      RouteList.createNewScreen: (context) =>
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => Reminder(),
              )
            ],
            child:B10HomeScreen(),
          ),

    };
  }
}