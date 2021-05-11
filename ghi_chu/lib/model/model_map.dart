
import 'package:flutter/material.dart';
import 'package:ghi_chu/model/group.dart';
import 'package:ghi_chu/model/reminder.dart';

class ModelListReminder{
 static Map<String,Map<String,List<Reminder>>> listReminder={'Reminder':{}};
 static Map<String,Group> myList={'Reminder':Group('Reminder', Colors.blue.value.toString(), 0, 0)};
}