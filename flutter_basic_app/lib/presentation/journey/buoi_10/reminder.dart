import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Reminder with ChangeNotifier,DiagnosticableTreeMixin{
  String title;
  String notes;
  DateTime date;
  String time;
  List<Reminder> reminderForToday=[];
  List<Reminder> scheduledReminder=[];
  List<Reminder> allReminder=[];
  int l1=0,l2=0,l3=0;
  void update()
  {
    l1=reminderForToday.length;
    l2=scheduledReminder.length;
    l3=allReminder.length;
    log(l3.toString()+"))))))))))))))))");
    notifyListeners();
  }
  void addReminder()
  {
    Reminder r = new Reminder();
  //  allReminder.clear();
    r.title= this.title;
  //  log(allReminder[0].time);
    r.notes=this.notes;
    r.time= this.time;
    r.date= this.date;
    allReminder.add(r);

    log(allReminder[0].title);
    log(allReminder.length.toString());
    if(r.date!=null)
      {
        scheduledReminder.add(r);
      }
    if(r.date== DateTime.now())
      {
        reminderForToday.add(r);
      }
    notifyListeners();
  }
  void setDate(DateTime value)
  {
    date=value;
    log(date.toString());
    notifyListeners();
  }

  void setTitle(String value)
  {
    title=value;
    log(title);
    notifyListeners();
  }
  void setNote(String value)
  {
    notes=value;
    log(notes);
    notifyListeners();
  }
  void setTime(TimeOfDay timeOfDay)
  {
    time=(timeOfDay.hour.toString()+':'+timeOfDay.minute.toString()) ;
    log(time);
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }


}