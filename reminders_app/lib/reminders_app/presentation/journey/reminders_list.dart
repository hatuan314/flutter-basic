import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reminders_app/reminders_app/presentation/model/group.dart';
import 'package:reminders_app/reminders_app/presentation/model/reminder.dart';

class RemindersList {
  //Map<String, List<Reminder>> remindersForToday;

  //pMap<String, List<Reminder>> scheduledReminders;

  static Map<String, List<Reminder>> allReminders = Map();

  static List<Group> MyLists = [];
  static List<Reminder> _list = [];
  static int i = 0;

  static void addDefaultList() {
    int f = 0;
    if (MyLists?.length == 0) {
      log('add default');
      addList('Reminders', Colors.blue);
    }
    if (allReminders?.isEmpty ?? true) allReminders?.addAll({'Others': _list});
  }

  static void addList(String name, Color color) {
    Group g = new Group(name:name,color: color,createAt: DateTime
        .now()
        .millisecondsSinceEpoch,
        lastUpdate:   DateTime
            .now()
            .millisecondsSinceEpoch);
    //log(g.name);
    MyLists.add(g);

    //  log(MyLists.toString());
    // notifyListeners();
  }

  static void addReminder(String title, String notes, String list,
      int dateAndTime, int priority) {
    Reminder r = new Reminder(
        i++,
        title,
        notes,
        list,
        dateAndTime,
        DateTime
            .now()
            .millisecondsSinceEpoch,
        DateTime
            .now()
            .millisecondsSinceEpoch,
        priority);
    r.priority = priority;
    for (int i = 0; i < MyLists.length; i++) {
      if (list == (MyLists[i].name)) {
        MyLists[i].list.add(r);
        //sắp xếp theo thứ tự ưu tiên
        for(int k=0;k<MyLists[i].list.length;k++)
          {
            for(int h=k+1;h<MyLists[i].list.length;h++)
              {
                if(MyLists[i].list[k]?.priority<= MyLists[i].list[h]?.priority)
                  {
                    Reminder a= MyLists[i].list[k];
                    MyLists[i].list[k]=MyLists[i].list[h];
                    MyLists[i].list[h]=a;
                  }
              }
          }
        //sắp xếp lại theo ngày
        for(int k=0;k<MyLists[i].list.length;k++)
        {
          for(int h=k+1;h<MyLists[i].list.length;h++)
          {
            if((MyLists[i].list[k]?.priority== MyLists[i].list[h]?.priority) && (MyLists[i].list[k]?.dateAndTime>=MyLists[i].list[h]?.dateAndTime ))
            {
              Reminder a= MyLists[i].list[k];
              MyLists[i].list[k]=MyLists[i].list[h];
              MyLists[i].list[h]=a;
            }
          }
        }
      }
    }
    if (dateAndTime != 0) {
      String date = DateFormat('dd/MM/yyyy').format(
          DateTime.fromMillisecondsSinceEpoch(dateAndTime));
      if (allReminders.containsKey(date)) {
        allReminders[date]?.add(r);
      } else {
        allReminders[date] = List();
        allReminders[date].add(r);
      }

      if (allReminders[date]?.length > 1) {
        for (int i = 0; i < allReminders[date]?.length - 1; i++)
          for (int j = i; j < allReminders[date]?.length; j++) {
            if (allReminders[date][i]?.priority <=
                allReminders[date][j]?.priority) {
              Reminder a = allReminders[date][i];
              allReminders[date][i] = allReminders[date][j];
              allReminders[date][j] = a;
            }
          }
        for(int k=0;k<allReminders[date]?.length;k++)
        {
          for(int h=k+1;h<allReminders[date]?.length;h++)
          {
            if((allReminders[date][k]?.priority== allReminders[date][h]?.priority) && (allReminders[date][k]?.dateAndTime>= allReminders[date][h]?.dateAndTime) )
            {
              Reminder a=  allReminders[date][k];
              allReminders[date][k]= allReminders[date][h];
              allReminders[date][h]=a;
            }
          }
        }
      }
    }
      else {
        // _list.add(r);
        //  log(_list[0].title);
        allReminders['Others']?.add(r);
        for (int i = 0; i < allReminders['Others']?.length - 1; i++) {
          for (int j = i; j < allReminders['Others']?.length; j++) {
            //   log(allReminders['Others'][i].priority.toString()+'lllllllllllllll');
            if (allReminders['Others'][i].priority <
                allReminders['Others'][j].priority) {
              Reminder a = allReminders['Others'][i];
              allReminders['Others'][i] = allReminders['Others'][j];
              allReminders['Others'][j] = a;
            }
          }
        }
      }
    }

}
