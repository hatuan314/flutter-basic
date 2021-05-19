import 'dart:async';
import 'dart:developer';

import 'package:reminders_app/reminders_app/presentation/model/reminder.dart';

import '../../reminders_list.dart';

class TodayStream{
  String now =  DateTime.now().day<10?'0'+DateTime.now().day.toString():DateTime.now().day.toString() + "/" +((DateTime.now().month<10)?'0'+DateTime.now().month.toString():DateTime.now().month.toString()) + "/" +
      DateTime.now().year.toString();
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