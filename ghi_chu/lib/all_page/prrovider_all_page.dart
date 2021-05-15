import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:ghi_chu/model/reminder.dart';

class ProviderAllPage with ChangeNotifier, DiagnosticableTreeMixin {
  String group;
  String title;
  int indexGroup,indexTextFiled,indexReminder;
  String hedear;
  void upDate(){
    notifyListeners();
  }
  void setGroup(String group) {
    this.group = group;
    notifyListeners();
  }
  void setIndex(int index,int indexReminder){
    this.indexTextFiled=index;
    this.indexReminder=indexReminder;
    notifyListeners();
  }
  void addAll(String group, String title) {
    if (ModelListReminder.listReminder['${group}']['orther'] == null) {
      ModelListReminder.listReminder['${group}'].addAll({
        'orther': [
          Reminder(
              title,
              '',
              group,
              'none',
              null,
              DateTime.now().millisecondsSinceEpoch,
              DateTime.now().millisecondsSinceEpoch,
              false)
        ].toList()
      });
    } else {
      ModelListReminder.listReminder['${group}']['orther'].add(Reminder(
          title,
          '',
          group,
          'none',
          null,
          DateTime.now().millisecondsSinceEpoch,
          DateTime.now().millisecondsSinceEpoch,
          false));
    }
    notifyListeners();
  }
}
