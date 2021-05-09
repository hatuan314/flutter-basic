import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';

import 'package:flutter_basic_app/presentation/journey/buoi_10/home_page/homepage_provider.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/new_reminder/create_new_reminder.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/new_reminder/details_provider.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/new_reminder/details_screen.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/reminder_provider.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_9/page/schedule_screen.dart';
import 'package:provider/provider.dart';

import 'home_page/home_screen.dart';

class Buoi10Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
    //  RouteList.allListScreen:(context)=> AllRemindersList(),
   //   RouteList.todayListScreen:(_)=> TodayList(),
    //  RouteList.scheduledListScreen:(_)=> ScheduledList(),
      RouteList.b10HomeScreen: (context) =>
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => HomePageProvider(),
              ),

            ],
            child:B10HomeScreen(),
          ),
      RouteList.createNewScreen: (_) =>
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ReminderProvider(),
              )
            ],
            child:CreateNewReminder(),
          ),
      RouteList.detailsScreen: (_) =>
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => DetailsProvider(),
              )
            ],
            child:DetailsScreen(),
          ),

    };
  }
}