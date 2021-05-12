import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ghi_chu/__mock__/costranisn.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:ghi_chu/model/reminder.dart';

class ProviderHomePage with ChangeNotifier, DiagnosticableTreeMixin {
  int leghtAll = 0;
  int leghtToDay = 0;
  int leghtSchedule = 0;
  bool edit = true;
  int index;
  bool buttonDelete = false;
  var data = ConstHomePage.list;
  Map<String, int> myListLeght = {'Reminder': 0};
  List<String> keyMyList = ['Reminder'];
  void update() {
    notifyListeners();
  }

  void setButtonDelete(int index) {
    this.index = index;
    notifyListeners();
  }

  void addList() {
    keyMyList.add(ModelListReminder.myList.keys
        .elementAt(ModelListReminder.myList.length - 1));
    notifyListeners();
  }

  void setLeght() {
    int all = 0;
    int leght = 0;
    ModelListReminder.listReminder.forEach((key, value) {
      value.forEach((key, value) {
        all = all + value.length;
        leght = leght + value.length;
      });
      if (key == "Reminder") {
        myListLeght['Reminder'] = leght;
      } else {
        myListLeght.addAll({key: leght});
      }
      leght = 0;
    });
    leghtAll = all;
    notifyListeners();
  }

  void setedit() {
    edit = !edit;
    if (edit == false) {
      index = null;
    }
    notifyListeners();
  }

  void setlist() {
    notifyListeners();
  }
}
