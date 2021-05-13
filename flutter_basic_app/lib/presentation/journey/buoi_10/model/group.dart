import 'dart:ui';

import 'package:flutter_basic_app/presentation/journey/buoi_10/model/reminder.dart';

class Group{
  String name='';
  Color color;
 int createAt;
 int lastUpdate;
 List<Reminder> list=[];

  Group(String name, Color color, int createAt, int lastUpdate)
  {
    this.name=name;
    this.color=color;
    this.createAt=createAt;
    this.lastUpdate=lastUpdate;
  }
}