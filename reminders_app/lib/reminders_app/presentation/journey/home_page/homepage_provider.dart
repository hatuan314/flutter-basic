import 'dart:developer';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminders_app/reminders_app/presentation/model/group.dart';

import '../reminders_list.dart';

class HomePageProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int l1 = 0, l2 = 0, l3 = 0;
  Color listColor = Colors.blue;
//  bool addNew=false;
  // l4=0;
  List<Group> MyLists = [];
//RemindersList RemindersList= RemindersList();

  void setColor(Color value) {
    listColor = value;
    notifyListeners();
  }

  void update() {
    l1 = 0;
    l2 = 0;
    l3 = 0;
    if (RemindersList.allReminders?.length == null) {
      l1 = 0;
      l2 = 0;
      l3 = 0;
    } else {
      RemindersList.allReminders?.forEach((key, value) {
        String now =  DateTime.now().day<10?'0'+DateTime.now().day.toString():DateTime.now().day.toString() + "/" +((DateTime.now().month<10)?'0'+DateTime.now().month.toString():DateTime.now().month.toString()) + "/" +
            DateTime.now().year.toString();
        if (key == now) {
          l1 = RemindersList.allReminders[now].length;
        }
        if (key != ('Others')) {
          l2 += RemindersList.allReminders[key].length;
        }
        l3 += RemindersList.allReminders[key].length;
      });
    }
    RemindersList.addDefaultList();
    MyLists = RemindersList.MyLists;

    notifyListeners();
  }
}
