import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:ghichu/presentation/models/group.dart';
import 'package:ghichu/presentation/models/model_map.dart';

abstract class AddListEvent {}

class SelectColorEvent extends AddListEvent {
  final Color color;
  int indexSelect;
  SelectColorEvent({@required this.color, this.indexSelect});
}

class ActiveAddBtn extends AddListEvent {
  final String text;
  ActiveAddBtn({this.text});
  void addTodoGroup({String name, String color, int createAt, int lastUpdate}) {
    ModelListReminder.reminderApp['groups'].add(Groups(
            name: name,
            color: color,
            createAt: DateTime.fromMillisecondsSinceEpoch(createAt).toString(),
            lastUpdate:
                DateTime.fromMillisecondsSinceEpoch(lastUpdate).toString())
        .toJson());
  }
}
