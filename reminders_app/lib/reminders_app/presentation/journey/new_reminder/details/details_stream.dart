import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsStream{
  int date=0;
  int time=0;
  int priority=0;
  bool hasDate=false;
  bool hasTime=false;
StreamController dateController = StreamController<int>.broadcast();
  StreamController timeController = StreamController<int>.broadcast();
  StreamController priorityController = StreamController<int>.broadcast();
  StreamController hasDateController = StreamController<bool>.broadcast();
  StreamController hasTimeController = StreamController<bool>.broadcast();
  Stream get dateStream => dateController.stream;
  Stream get timeStream => timeController.stream;
  Stream get priorityStream => priorityController.stream;
  Stream get hasDateStream => hasDateController.stream;
  Stream get hasTimeStream => hasTimeController.stream;
  void setDefault()
  {
    dateController.sink.add(0);
    timeController.sink.add(0);
    hasDateController.sink.add(false);
    hasTimeController.sink.add(false);
    priorityController.sink.add(0);
  }
  void setPriority(int value)
  {
    priority=value;
    log(priority.toString());
   priorityController.sink.add(priority);
  }
  void setTime(TimeOfDay timeOfDay, bool has_time)
  {
    hasTime=has_time;
    if(hasTime==true)
    {
      log(timeOfDay.toString());
      time=(timeOfDay.hour*60*60+timeOfDay.minute*60)*1000+1;
      log(DateFormat('HH:mm dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(date+time)));
      log(time.toString());}

    else
    {
      time=0;
    }
    hasTimeController.sink.add(hasTime);
    timeController.sink.add(time);
  }
  void setDate(DateTime value, bool has_date)
  {
    hasDate=has_date;
    if(hasDate==true) {

      date = DateTime.parse(DateFormat('yyyy-MM-dd').format(value))
          .millisecondsSinceEpoch;
    }
    else
    {
      date=0;
    }
    log(hasDate.toString());
    log(date.toString());
hasDateController.sink.add(hasDate);
dateController.sink.add(date);
  }
  void dispose()
  {
    timeController.close();
    dateController.close();
    hasTimeController.close();
    hasDateController.close();
    priorityController.close();
  }
}