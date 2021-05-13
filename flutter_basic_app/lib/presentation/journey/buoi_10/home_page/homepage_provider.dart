import 'dart:developer';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/model/group.dart';

import 'package:flutter_basic_app/presentation/journey/buoi_10/reminders_list.dart';
import 'package:provider/provider.dart';

class HomePageProvider with ChangeNotifier,DiagnosticableTreeMixin {

  int l1=0 ,
      l2=0,
      l3 =0;
  Color listColor=Colors.blue;
//  bool addNew=false;
 // l4=0;
List<Group> MyLists=[];
//RemindersList RemindersList= RemindersList();
String now =  DateTime.now().day.toString() + "/" +DateTime.now().month.toString() + "/" +
    DateTime.now().year.toString();
void setColor(Color value)
{
  listColor=value;
  notifyListeners();
}
  void update() {
    l1=0;
    l2=0;
    l3=0;
    if(RemindersList.allReminders?.containsKey(now) == true) {
      log(RemindersList.allReminders?.containsKey(now).toString());
      l1 = RemindersList.allReminders[now].length;
    }else
      l1=0;
   // log('l1='+l1.toString());
    RemindersList.allReminders?.forEach((key, value) {
        if(key!=('Others'))
          {
           // log(key);
            //log(value.last.title);
            l2+=RemindersList.allReminders[key].length;
           // log('l2='+l2.toString());
          }
    });
   // log('l2='+l2.toString());
    if(RemindersList.allReminders?.length==null)
      l3=0;
    else
      {
        RemindersList.allReminders?.forEach((key, value) {
          log(key+"!!!!!!!!!!!!!!!"+value.length.toString());
            l3+=RemindersList.allReminders[key].length;

        });
      }
    RemindersList.addDefaultList();
    MyLists=RemindersList.MyLists;
   log(MyLists.length.toString()+"______________");

    log(RemindersList.MyLists[0].toString()+"______________");
   // log(value.toString());
    log(l3.toString() + "))))))))))))))))");
    notifyListeners();
  }
}