
import 'package:flutter/material.dart';
import 'package:ghichu/presentation/models/reminder.dart';

import 'group.dart';


class ModelListReminder{
 static Map<String,Map<String,List<Reminder>>> listReminder={'Reminder':{}};
 static Map<String,Group> myList={'Reminder':Group('Reminder', Colors.blue.value.toString(), 0, 0)};
}