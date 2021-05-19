import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:reminders_app/reminders_app/common/constants/route_constants.dart';

import 'home_page/home_screen.dart';
import 'home_page/homepage_provider.dart';
import 'list_screen/all_reminders/all_list_provider.dart';
import 'list_screen/all_reminders/all_list_screen.dart';
import 'list_screen/scheduled_list/scheduled_list_provider.dart';
import 'list_screen/scheduled_list/scheduled_list_screen.dart';
import 'list_screen/today_list/today_provider.dart';
import 'list_screen/today_list/todaylist_screen.dart';
import 'new_list/create_new_list.dart';
import 'new_list/list_provider.dart';
import 'new_reminder/create_new_reminder/create_new_reminder.dart';
import 'new_reminder/details/details_provider.dart';
import 'new_reminder/details/details_screen.dart';
import 'new_reminder/create_new_reminder/reminder_provider.dart';


class AppRoutes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.allListScreen: (_) =>AllRemindersList(),

      RouteList.todayListScreen: (_) =>TodayList(),

      RouteList.b10HomeScreen:(_)=> B10HomeScreen(),

      RouteList.scheduledListScreen: (_) =>ScheduledList(),

      RouteList.createNewScreen: (_) =>CreateNewReminder(),

      RouteList.detailsScreen: (_) => DetailsScreen(),

      RouteList.createNewList: (_) =>NewList(),
        //  ),



    };
  }
}