import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:ghichu/presentation/journey/group/add_list/add_list_constaner.dart';
import 'package:ghichu/presentation/models/group.dart';
import 'package:ghichu/presentation/models/model_map.dart';

class BlocAddList{
  int index=4;
  Color color=AddListConstants.listColors[4];
  StreamController _selectColor=new StreamController.broadcast();
  Stream get selectColor => _selectColor.stream;
  StreamController batEvent=new StreamController();
  void setColor(int index,Color color){
    this.index=index;
    this.color=color;
    batEvent.sink.add('event');
  }
  void addToDoGroup(String title, String color, int createAt, int lastUpdate) {
    ModelListReminder.myList
        .addAll({'$title+$createAt': Group(title, color, createAt, lastUpdate)});
    ModelListReminder.listReminder.addAll({'$title+$createAt': {}});
  }
BlocAddList(){
    batEvent.stream.listen((event) {
      _selectColor.sink.add(event);
    });
  }

  disploy() {
   batEvent.close();
    _selectColor.close();
  }
}