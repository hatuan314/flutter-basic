import 'dart:ui';


import 'package:reminders_app/reminders_app/presentation/model/reminder.dart';

/*
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
}*/
class Group {
  String name;
  Color color;
  int createAt;
  int lastUpdate;

  Group({this.name, this.color, this.createAt, this.lastUpdate});

  List<Reminder> list=[];


  Group.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    color = json['color'];
    createAt = json['create_at'];
    lastUpdate = json['last_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['color'] = this.color;
    data['create_at'] = this.createAt;
    data['last_update'] = this.lastUpdate;
    return data;
  }
}