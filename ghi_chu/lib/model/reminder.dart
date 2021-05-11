import 'dart:core';

class Reminder{
  String title,note,priority,group;
  int date;
  int createAt,lastUpdate;
  bool time;
  Reminder(this.title, this.note,this.group,this.priority, this.date,
      this.createAt,this.lastUpdate,this.time);
}