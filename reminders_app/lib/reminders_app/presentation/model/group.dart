import 'dart:ui';


import 'package:reminders_app/reminders_app/presentation/model/reminder.dart';

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