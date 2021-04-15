import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_9/page/home_screen.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_9/todo_item.dart';
import 'package:provider/provider.dart';
import 'page/create_to_do.dart';
import 'page/schedule_screen.dart';

class Buoi9Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.b9Src1: (context) =>
      MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) =>  TodoItem('','',TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day)),
              )
            ],
            child:HomeScreen(),
          ),
      RouteList.b9Src2: (context) =>
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) =>   TodoItem('','',TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day)),
              ),
            ],
            child:CreateToDo(),
          ),
      RouteList.b9Src3: (context) =>
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) =>   TodoItem('','',TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day)),
              ),
            ],
            child:ScheduleScreen(),
          ),

    };
  }
}
