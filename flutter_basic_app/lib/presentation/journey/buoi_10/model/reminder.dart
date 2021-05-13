import 'dart:developer';

class Reminder {
  int id;
  String title;
  String notes;
  String list='Reminders';
  String date;
  String time;
  int createAt;
  int lastUpdate;
  int priority=0;
  bool isDeleted=false;

  Reminder(int id,String title, String notes, String list, String date, String time, int createAt,
  int lastUpdate, int priority){
    this.id=id;
    this.title=title;
    this.notes=notes;
    this.list=list;
    this.date=date;
    this.time=time;
    this.createAt=createAt;
    this.lastUpdate=lastUpdate;
    this.priority=priority;
    log(this.priority.toString()+'pppppppppp');
  }
}