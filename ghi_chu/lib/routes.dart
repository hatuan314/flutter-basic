
import 'package:flutter/material.dart';
import 'package:ghi_chu/all_page/all_page.dart';
import 'package:ghi_chu/common/constants/route_constants.dart';
import 'package:ghi_chu/details/details_page.dart';
import 'package:ghi_chu/details/provider_details_page.dart';
import 'package:ghi_chu/home_page/home_page.dart';
import 'package:ghi_chu/home_page/provider_home_page.dart';
import 'package:ghi_chu/list_reminder/list_reminder.dart';
import 'package:ghi_chu/list_reminder/prrovider_list_reminder_page.dart';
import 'package:ghi_chu/my_list_page/my_list_page.dart';
import 'package:ghi_chu/new_list/new_list.dart';
import 'package:ghi_chu/new_list/provider_new_list.dart';
import 'package:ghi_chu/new_reminder/new_reminder_page.dart';
import 'package:ghi_chu/new_reminder/provider_reminder.dart';
import 'package:ghi_chu/reminders/reminder_page.dart';
import 'package:ghi_chu/schedule_page/provider_scheduled.dart';
import 'package:ghi_chu/schedule_page/schedule_page.dart';
import 'package:ghi_chu/to_day_page/provider_to_day.dart';
import 'package:ghi_chu/to_day_page/today_page.dart';

import 'package:provider/provider.dart';
class Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.homePage: (context) {
        return MultiProvider(providers: [
          ChangeNotifierProvider(
            create: (_) => ProviderHomePage(),
          ),
        ], child: HomePage(),
        );
      },
      RouteList.allPage: (context) => AllPage(),
      RouteList.scheduled: (context) => MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=>ProviderSchedule())
      ],
        child: SchedulePage(),
      ),
      RouteList.todayPage: (context) => MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=>ProviderToday())
      ],
      child: TodayPage(),
      ),
      RouteList.reminders: (context) => RemindersPage(),
      RouteList.newReminder: (context) => MultiProvider(providers: [
            ChangeNotifierProvider(
              create: (_) => ProviderReminder(),
            ),
          ], child: NewReminderPage()),
      RouteList.details: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ProviderDetailsPage(),
              )
            ],
            child: DetailsPage(),
          ),
      RouteList.newList:(context)=>MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>ProviderNewList())
          ],
        child: NewListPage(),
      ),
      RouteList.listReminderPage:(context)=>MultiProvider(
          providers:[
            ChangeNotifierProvider(create: (_)=>ProviderListReminderPage())
          ],
        child: ListReminderPage(),
      ),
      RouteList.myListPage:(context)=>MyListPage()
    };
  }
}
