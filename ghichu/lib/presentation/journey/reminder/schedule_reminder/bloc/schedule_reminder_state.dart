import 'package:flutter/cupertino.dart';
import 'package:ghichu/presentation/models/model_map.dart';
import 'package:ghichu/presentation/models/reminder.dart';

class ScheduleReminderState {
  Map<String, List<Reminder>> reminderSchedule;
  String title;
  String keyDate;
  int indexReminder, indexStickyReminder;
  List<TextEditingController> textEditing;
  int indexGroup;

  ScheduleReminderState(
      {this.reminderSchedule,
      this.title,
      this.keyDate,
      this.indexReminder,
      this.indexStickyReminder,
      this.textEditing,
      this.indexGroup});

  void addTextEditing() {
    for (int i = 0; i < reminderSchedule.length; i++) {
      textEditing.add(TextEditingController());
    }
  }

  void setGroup(int index) {
    this.indexGroup = index;
  }

  void setIndexReminder(int index) {
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

  int getReminder() {
    reminderSchedule.clear();
    ModelListReminder.listReminder.values.forEach((element) {
      element.forEach((key, value) {
        if (key != 'orther') {
          if (reminderSchedule.containsKey(key)) {
          } else {
            reminderSchedule.addAll({key: value});
          }
        }
      });
    });
    return reminderSchedule.keys.length;
  }
}
