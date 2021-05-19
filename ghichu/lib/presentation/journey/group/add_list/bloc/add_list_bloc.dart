import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:ghichu/presentation/journey/group/add_list/bloc/add_list_state.dart';
import 'package:ghichu/presentation/models/group.dart';
import 'package:ghichu/presentation/models/model_map.dart';

import '../add_list_constaner.dart';

class AddListBloc {
  AddListState addListState =
      AddListState(index: 4, color: AddListConstants.listColors[4]);
  StreamController _selectColor =
      new StreamController<AddListState>.broadcast();

  StreamTransformer addListTranformer =
      StreamTransformer<AddListState, AddListState>.fromHandlers(
          handleData: (data, sink) {
    sink.add(data);
  });

  Stream get selectColor => _selectColor.stream.transform(addListTranformer);

  void setColor(int index, Color color) {
    _selectColor.sink.add(AddListState(index: index, color: color));
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
