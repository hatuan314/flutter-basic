import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:ghi_chu/model/reminder.dart';

class ProviderSchedule with ChangeNotifier, DiagnosticableTreeMixin {
  List<String> key1 = [];
  String title;
  String keyDate;
  int indexReminder,indexStickyReminder;
  int indexSticky = null;

  void setFoucs(int index) {
    this.indexSticky = index;
    notifyListeners();
  }
void setIndexReminder(int index,int indexSticky){
    indexStickyReminder=indexSticky;
    indexReminder=index;
    notifyListeners();
}
  void setTitle(String title) {
    this.title = title;
  }

  void addReminder(
      TextEditingController controller, String title, String group) {
    if (title.trim().isNotEmpty) {
      if (ModelListReminder.listReminder['${group}']['${this.keyDate}'] ==
          null) {
        ModelListReminder.listReminder['${group}'].addAll({
          this.keyDate: [
            Reminder(
                title,
                '',
                group,
                'none',
                DateTime.parse(this.keyDate).millisecondsSinceEpoch,
                DateTime.now().millisecondsSinceEpoch,
                DateTime.now().millisecondsSinceEpoch,
                false)
          ].toList()
        });
      } else {
        ModelListReminder.listReminder['${group}']['${this.keyDate}'].add(
            Reminder(
                title,
                '',
                group,
                'none',
                DateTime.parse(this.keyDate).millisecondsSinceEpoch,
                DateTime.now().millisecondsSinceEpoch,
                DateTime.now().millisecondsSinceEpoch,
                false));
      }
    }
    controller.text = '';
    notifyListeners();
  }

  int getKey() {
    ModelListReminder.listReminder.forEach((key, value) {
      value.forEach((key, value) {
        if (key != 'orther') {
          if (key1.length == 0) {
            key1.add(key);
          } else if (key1[key1.length - 1] != key) {
            key1.add(key);
          }
        }
      });
    });

    notifyListeners();
    return key1.length;
  }
}
