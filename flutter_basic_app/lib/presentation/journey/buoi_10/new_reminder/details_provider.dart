import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailsProvider with ChangeNotifier,DiagnosticableTreeMixin{
  String date='';
  String time='';
  String priority='None';
  bool hasDate=false;
  bool hasTime=false;
  void setPriority(String value)
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
      if (value.year==DateTime.now().year && value.month==DateTime.now().month && value.day==DateTime.now().day)
        date = 'Today';
      else
        date = value.month.toString() + "/" + value.day.toString() + "/" +
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