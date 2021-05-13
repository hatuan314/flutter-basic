import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/home_page/homepage_provider.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/list_screen/list/list_screen.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/list_screen/scheduled_list/scheduled_list_provider.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/list_screen/scheduled_list/scheduled_list_screen.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/list_screen/today_list/today_provider.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/list_screen/today_list/todaylist_screen.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/new_reminder/create_new_reminder.dart';
import 'package:flutter_basic_app/presentation/journey/learn/list_screen.dart';
import 'package:provider/provider.dart';
import 'home_page/home_screen.dart';
import 'list_screen/all_reminders/all_list_provider.dart';
import 'list_screen/all_reminders/all_list_screen.dart';
import 'list_screen/list/list_provider.dart';
import 'new_list/create_new_list.dart';
import 'new_list/list_provider.dart';
import 'new_reminder/details/details_provider.dart';
import 'new_reminder/details/details_screen.dart';
import 'new_reminder/reminder_provider.dart';

class Buoi10Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.allListScreen: (_) =>
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => AllListProvider(),
              )
            ],
            child:AllRemindersList(),
          ),

      RouteList.todayListScreen: (_) =>
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => TodayProvider(),
              )
            ],
            child:TodayList(),
          ),
      RouteList.b10HomeScreen: (context) =>
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => HomePageProvider(),
              ),
            ],
            child:B10HomeScreen(),
          ),
      RouteList.scheduledListScreen: (_) =>
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ScheduledProvider(),
              )
            ],
            child:ScheduledList(),
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
      RouteList.createNewList: (_) =>
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => NewListProvider(),
              )
            ],
            child:NewList(),
          ),



    };
  }
}