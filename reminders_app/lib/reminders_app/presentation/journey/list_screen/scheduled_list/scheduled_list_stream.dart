import 'dart:async';

import 'package:reminders_app/reminders_app/presentation/model/reminder.dart';

import '../../reminders_list.dart';

class ScheduledListStream{
  List<String> dateList =[];
  Map<String,List<Reminder>> scheduledList= Map();
  StreamController dateListController= StreamController();
  StreamController scheduledListController= StreamController();
  Stream get dateListStream=>dateListController.stream;
  Stream get scheduledListStream=>scheduledListController.stream;

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
    for(int i=0;i<dateList.length-1;i++)
    {
      for(int j=i+1;j<dateList.length;j++)
      {
        if((dateList[i]).compareTo(dateList[j])>0)   {
          String tmp= dateList[i];
          dateList[i]=dateList[j];
          dateList[j]=tmp;
        }
      }
    }
    dateListController.sink.add(dateList);
    scheduledListController.sink.add(scheduledList);
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
    for(int i=0;i<dateList.length-1;i++)
    {
      for(int j=i+1;j<dateList.length;j++)
      {
        if((dateList[i]).compareTo(dateList[j])>0)
        {
          String tmp= dateList[i];
          dateList[i]=dateList[j];
          dateList[j]=tmp;
        }
      }
    }
    dateListController.sink.add(dateList);
    scheduledListController.sink.add(scheduledList);
  }
  void dispose()
  {
    dateListController.close();
    scheduledListController.close();
  }
}