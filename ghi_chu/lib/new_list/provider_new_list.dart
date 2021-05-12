import 'package:flutter/foundation.dart';
import 'package:ghi_chu/__mock__/costranisn.dart';
import 'package:ghi_chu/model/group.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ProviderNewList with ChangeNotifier, DiagnosticableTreeMixin {
  Color color = ConstHomePage.listColors[4];
  String title;
  bool button = false;
  int indexColor = 4;
  void setButton(String title) {
    this.title = title;
    if (title.trim().isNotEmpty) {
      button = true;
    } else {
      button = false;
    }
    notifyListeners();
  }

  void setIndex(int index) {
    this.indexColor = index;
    notifyListeners();
  }

  void setColor(Color color) {
    this.color = color;
    notifyListeners();
  }

  void addToDoMyList(String title, String color, int createAt, int lastUpdate) {
    ModelListReminder.myList
        .addAll({title: Group(title, color, createAt, lastUpdate)});
    ModelListReminder.listReminder.addAll({title: {}});
  }
}
