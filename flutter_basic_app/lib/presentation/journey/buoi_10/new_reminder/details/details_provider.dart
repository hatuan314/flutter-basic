import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailsProvider with ChangeNotifier,DiagnosticableTreeMixin{
  String date='';
  String time='';
  int priority=0;
  bool hasDate=false;
  bool hasTime=false;

  void setPriority(int value)
  {
    priority=value;
    notifyListeners();
  }
  void setTime(TimeOfDay timeOfDay, bool has_time)
  {

    hasTime=has_time;
    if(hasTime==true)
    {time=(timeOfDay.hour.toString()+':'+timeOfDay.minute.toString()) ;
    log(time);}
    else
      {
        time='';
      }
    notifyListeners();
  }
  void setDate(DateTime value, bool has_date)
  {
    hasDate=has_date;
    if(hasDate==true) {
        date =  value.day.toString() + "/" +value.month.toString() + "/" +
            value.year.toString();
    }
    else
    {
      date='';
    }
    log(hasDate.toString());
    log(date.toString());
    notifyListeners();
  }
}