import 'package:ghichu/presentation/models/model_map.dart';
import 'package:ghichu/presentation/models/reminder.dart';
import 'package:intl/intl.dart';

class NewReminderState {
  String title = '';
  String note = '';
  String group = 'Reminder';
  int index = 0;
  int valuesTime;
  DateTime nowDate = DateTime.now();
  bool button = false;
  bool isButtonDetails = false;
  bool isTimeDetails = false;

  NewReminderState(
      {this.title,
      this.note,
      this.group,
      this.index,
      this.valuesTime,
      this.nowDate,
      this.button,
      this.isButtonDetails,
      this.isTimeDetails});

  void setGroup(String title, int index) {
    this.index = index;
    group = title;
  }

  void bottonAdd(String title) {
    if (title.trim().isNotEmpty) {
      button = true;
    } else {
      button = false;
    }
  }

  void setTime(var values) {
    if (values == null) {
      valuesTime = null;
      isButtonDetails = false;
      isTimeDetails = false;
    } else {
      isButtonDetails = true;
      isTimeDetails = values[1];
      valuesTime = values[0];
    }
  }

  void setValues(String title, String node) {
    this.title = title;
    this.note = note;
  }

  void addTodoList(String title, String note, int date, String group,
      String priority, int createAt, int lastUpdate, bool time) {
    String keyDate;
    if (date != null) {
      keyDate = DateFormat('yyyy-MM-dd')
          .format(DateTime.fromMillisecondsSinceEpoch(date));
    } else {
      keyDate = 'orther';
    }
    if (ModelListReminder.listReminder['$group'].containsKey(keyDate)) {
      ModelListReminder.listReminder['$group']['$keyDate'].add(Reminder(
          title,
          note,
          group,
          priority,
          date,
          createAt,
          DateTime.now().millisecondsSinceEpoch,
          time));
    } else {
      ModelListReminder.listReminder['$group'].addAll({
        keyDate: [
          Reminder(title, note, group, priority, date, createAt,
              DateTime.now().millisecondsSinceEpoch, time)
        ].toList()
      });
    }
  }
}
