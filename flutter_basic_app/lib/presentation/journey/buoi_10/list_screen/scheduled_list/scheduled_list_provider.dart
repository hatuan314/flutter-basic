import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/model/reminder.dart';

import '../../reminders_list.dart';

class ScheduledProvider with ChangeNotifier,DiagnosticableTreeMixin{
  List<String> dateList =[];
  Map<String,List<Reminder>> scheduledList= Map();

  void setDefault()
  {
    int i=0;
    RemindersList.allReminders.forEach((key, value) {
      if(key!='Others') {
        dateList.add(key);
        scheduledList.addAll({key:value});
        i++;
      }
    });
  }
  void update()
  {
    dateList.clear();
    scheduledList.clear();
    RemindersList.allReminders.forEach((key, value) {
      if(key!='Others') {
        if(value.length!=0) {
          dateList.add(key);
          scheduledList.addAll({key: value});
        }

      }
    });
    notifyListeners();
  }
}