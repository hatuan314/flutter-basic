import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reminders_app/reminders_app/presentation/journey/new_list/bloc/create_list_state.dart';

class ListStream {
  Color listColor = Colors.blue;
  String name;
  bool clearButton = false;
  CreateListState createListState =
  CreateListState(listColor: Colors.blue, clearButton: false);

  StreamController createListController = StreamController<CreateListState>();

  Stream get createListStream => createListController.stream;

  void setClearButton(bool value) {
    clearButton = value;
    log(clearButton.toString());
    createListController.sink.add(
        createListState.update(clearButton: clearButton));
  }

  void setColor(Color value) {
    listColor = value;
    createListController.sink.add(createListState.update(
        listColor: listColor));
    }

  void setName(String value) {
    name = value;
    log(name);
    createListController.sink.add(createListState.update(name: name));
    }

  void dispose() {
    createListController.close();
  }
}
