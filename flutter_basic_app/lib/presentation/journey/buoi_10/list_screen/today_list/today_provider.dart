import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/model/reminder.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/reminders_list.dart';

class TodayProvider with ChangeNotifier,DiagnosticableTreeMixin{
  String now =  DateTime.now().day.toString() + "/" +DateTime.now().month.toString() + "/" +
      DateTime.now().year.toString();
  List<Reminder> todayList=[];
  void update()
  {
    if(RemindersList.allReminders[now]!=0)
    todayList=RemindersList.allReminders[now];
    notifyListeners();
  }
}