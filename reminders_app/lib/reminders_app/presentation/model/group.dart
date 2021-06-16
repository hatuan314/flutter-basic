import 'dart:ui';
import 'package:hive/hive.dart';
import 'package:reminders_app/reminders_app/presentation/model/reminder.dart';
part 'group.g.dart';
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
@HiveType(typeId: 1)
class Group extends HiveObject {
  Group({this.name, this.color, this.createAt, this.lastUpdate});
  @HiveField(0)
  String name;
  @HiveField(1)
  Color color;
  @HiveField(2)
  String createAt;
  @HiveField(3)
  String lastUpdate;



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