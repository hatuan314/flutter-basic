import 'package:flutter/cupertino.dart';
import 'package:ghichu/presentation/models/model_map.dart';
import 'package:ghichu/presentation/models/reminder.dart';

class ScheduleReminderState {
  List<String> key1;
  String title;
  String keyDate;
  int indexReminder, indexStickyReminder;
  List<TextEditingController> textEditing;
  int indexSticky;

  ScheduleReminderState(
      {this.key1,
      this.title,
      this.keyDate,
      this.indexReminder,
      this.indexStickyReminder,
      this.textEditing,
      this.indexSticky});

  void addTextEditing() {
    for (int i = 0; i < key1.length; i++) {
      textEditing.add(TextEditingController());
    }
  }

  void upDate() {}
  void setFoucs(int index) {
    this.indexSticky = index;
  }

  void setIndexReminder(int index, int indexSticky) {
    indexStickyReminder = indexSticky;
    indexReminder = index;
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

    return key1.length;
  }
}
