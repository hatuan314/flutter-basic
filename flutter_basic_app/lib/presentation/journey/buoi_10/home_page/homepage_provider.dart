import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/reminder_provider.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/reminders_list.dart';
import 'package:provider/provider.dart';

class HomePageProvider with ChangeNotifier,DiagnosticableTreeMixin {

  int l1=0 ,
      l2=0,
      l3 =0;
 // l4=0;
List MyList=[];




  void update() {
 //   final item = Provider.of<ReminderProvider>(_);
    l1 = RemindersList.remindersForToday.length;
    l2 = RemindersList.scheduledReminders.length;
    l3 = RemindersList.allReminders.length;
    MyList=RemindersList.MyList;
    log(MyList.length.toString()+"______________");
    for (int j=0;j<RemindersList.MyList.length;j++)
    {
        MyList[j]['count']=0;
    }
    for(int i=0;i<RemindersList.allReminders.length;i++)
      {
        for (int j=0;j<RemindersList.MyList.length;j++)
          {
            if(RemindersList.allReminders[i]['list']==MyList[j]['name'])
              {
                MyList[j]['count']++;
              }
          }
      }
   // log(value.toString());
    log(l3.toString() + "))))))))))))))))");
    notifyListeners();
  }
}