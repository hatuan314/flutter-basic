import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghichu/presentation/journey/group/add_list/add_list_constaner.dart';
import 'package:ghichu/presentation/journey/group/add_list/bloc/add_list_state.dart';
import 'package:ghichu/presentation/models/group.dart';
import 'package:ghichu/presentation/models/model_map.dart';

class AddListBloc {
  AddListState addListState = AddListState(index: 4,color: AddListConstants.listColors[4]);
  StreamController _selectColor =
      new StreamController<AddListState>.broadcast();
  Stream get selectColor => _selectColor.stream;
  void setColor(int index, Color color) {
          addListState.upDate(index: index,color: color);
    _selectColor.sink.add(addListState);
  }
  void addToDoGroup(String title, String color, int createAt, int lastUpdate) {
    ModelListReminder.myList.addAll(
        {'$title+$createAt': Group(title, color, createAt, lastUpdate)});
    ModelListReminder.listReminder.addAll({'$title+$createAt': {}});
  }

  dispose() {
    _selectColor.close();
  }
}
