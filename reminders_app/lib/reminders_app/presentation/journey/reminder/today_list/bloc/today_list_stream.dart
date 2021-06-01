import 'dart:async';
import 'dart:developer';

import 'package:reminders_app/reminders_app/presentation/model/reminder.dart';

import '../../../reminders_list.dart';
import 'package:reminders_app/reminders_app/common/extensions/date_extensions.dart';
class TodayStream{
  String now =  DateTime.now().dateDdMMyyyy;
  List<Reminder> todayList=[];
  StreamController todayListController= StreamController();
  Stream get todayListStream=>todayListController.stream;

  void dispose()
  {
  todayListController.close();
  }
  void update()
  {
    log(now);
    if(RemindersList.allReminders[now]!=0)
    {  todayList=RemindersList.allReminders[now];
   todayListController.sink.add(todayList);
  }}
}