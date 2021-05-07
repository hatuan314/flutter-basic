
import 'package:flutter/cupertino.dart';
import 'package:ghi_chu/All_Page/All_Page.dart';
import 'package:ghi_chu/Details/details_Page.dart';
import 'package:ghi_chu/New_Reminder/ProviderReminder.dart';
import 'package:ghi_chu/Schedule_Page/scheduled_Page.dart';
import 'package:ghi_chu/home_Page/ProviderHomePage.dart';
import 'package:ghi_chu/todayPage/Today_Page.dart';
import 'package:provider/provider.dart';

import 'Details/Provider.dart';
import 'New_Reminder/new_ReminderPage.dart';
import 'Reminders/ReminderPage.dart';
import 'common/constants/route_constants.dart';
import 'home_Page/home_page.dart';

class Routes{
  static Map<String,WidgetBuilder> getAll(){
    return {
      RouteList.homePage:(context)=>MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>providerhomePage(),)
          ],
          child: homePagebuoi10()),
      RouteList.allPage:(context)=>allPage(),
      RouteList.scheduled:(context)=>scheduledPage(),
      RouteList.todayPage:(context)=>todayPage(),
      RouteList.reminders:(context)=>RemindersPage(),
      RouteList.newReminder:(context)=>MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>providerReminder(),)
          ],
          child: newReminderPage()),
      RouteList.details:(context)=>MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=>switchdate(),)
      ],
        child: detailsPage(),
      )
    };
  }
}