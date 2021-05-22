
import 'package:flutter/cupertino.dart';
import 'package:ghichu/common/constants/route_constants.dart';
import 'package:ghichu/presentation/journey/reminder/all_reminder/all_reminder_screen.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/details_screen.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/list_group/list_group.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/new_reminder.dart';
import 'package:ghichu/presentation/journey/reminder/edit_reminder/edit_reminder_page.dart';
import 'package:ghichu/presentation/journey/reminder/schedule_reminder/schedule_reminder_screen.dart';
import 'package:ghichu/presentation/journey/reminder/today_reminder/today_reminder_screen.dart';

class RouteReminder{
  static Map<String,WidgetBuilder> getAll(){
    return {
      RouteList.newReminder:(context)=>NewReminderPage(),
      RouteList.listGroup:(context)=>ListGroupScreen(),
      RouteList.details:(context)=>DetailsPage(),
      RouteList.allPage:(context)=>AllPage(),
      RouteList.scheduled:(context)=>SchedulePage(),
      RouteList.todayPage:(context)=>TodayPage(),
      RouteList.editReminder:(context)=>EditReminderPage(),
    };
  }
}