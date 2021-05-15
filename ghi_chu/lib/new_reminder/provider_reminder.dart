import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:ghi_chu/model/reminder.dart';
import 'package:intl/intl.dart';

class ProviderReminder with ChangeNotifier, DiagnosticableTreeMixin {
  String title = '';
  String note = '';
  String group = 'Reminder';
  int index = 0;
  int valuesTime;
  bool date = false;
  bool time = false;
  DateTime nowDate = DateTime.now();
  bool button = false;
  bool buttonDetails = false;
  bool timeDetails = false;
  void setGroup(String title, int index) {
    this.index = index;
    group = title;
    notifyListeners();
  }

  void bottonAdd(String title) {
    if (title.trim().isNotEmpty) {
      button = true;
    } else {
      button = false;
    }
    notifyListeners();
  }

  void setTime(var values) {
    if (values == null) {
      buttonDetails = false;
    } else {
      buttonDetails = true;
      timeDetails = values[1];
      valuesTime = values[0];
    }
    notifyListeners();
  }

  void setValues(String title, String node) {
    this.title = title;
    this.note = note;
  }

  void initializationTimes(
      String title,
      String note,
      int date,
      String group,
      String priority,
      int createAt,
      int lastUpdate,
      bool time,
      String keyDate) {
    // lần đầu khởi tạo
    if (date == null) {
      ModelListReminder.listReminder['${group}'].addAll({
        'orther': [
          Reminder(
              title, note, group, priority, date, createAt, lastUpdate, time)
        ].toList()
      });
    } else {
      ModelListReminder.listReminder['${group}'].addAll({
        keyDate: [
          Reminder(
              title, note, group, priority, date, createAt, lastUpdate, time)
        ].toList()
      });
    }
  }

  void newGroup(
      String title,
      String note,
      int date,
      String group,
      String priority,
      int createAt,
      int lastUpdate,
      bool time,
      String keyDate) {
    if (date == null) {
      ModelListReminder.listReminder.addAll({
        group: {
          'orther': [
            Reminder(
                title, note, group, priority, date, createAt, lastUpdate, time)
          ].toList()
        }
      });
    } else {
      ModelListReminder.listReminder.addAll({
        group: {
          keyDate: [
            Reminder(
                title, note, group, priority, date, createAt, lastUpdate, time)
          ].toList()
        }
      });
    }
  }

  void newReminder(
      String title,
      String note,
      int date,
      String group,
      String priority,
      int createAt,
      int lastUpdate,
      bool time,
      String keyDate) {
    if (date == null) {
      //taoj reminder
      try {
        //tạo nhóm nếu orther chưa có
        ModelListReminder.listReminder['${group}']['orther'].add(Reminder(
            title, note, group, priority, date, createAt, lastUpdate, time));
      } catch (_) {
        ModelListReminder.listReminder['${group}'].addAll({
          'orther': [
            Reminder(
                title, note, group, priority, date, createAt, lastUpdate, time)
          ].toList()
        });
      }
    } else {
      if (ModelListReminder.listReminder['${group}'].containsKey(keyDate)) {
        //kiem tra key Map của nhóm
        ModelListReminder.listReminder['${group}'][keyDate].add(Reminder(
            title, note, group, priority, date, createAt, lastUpdate, time));
      } else {
        ModelListReminder.listReminder['${group}'].addAll({
          keyDate: [
            Reminder(
                title, note, group, priority, date, createAt, lastUpdate, time)
          ].toList()
        });
      }
    }
  }

  void addTodoList(BuildContext context, String title, String note, int date,
      String group, String priority, int createAt, int lastUpdate, bool time) {
    String keyDate;
    if (date != null) {
      keyDate = DateFormat('yyyy-MM-dd')
          .format(DateTime.fromMillisecondsSinceEpoch(date));
    } else {
      keyDate = 'orther';
    }
    if (ModelListReminder.listReminder['${group}'].containsKey(keyDate)) {
      ModelListReminder.listReminder['${group}']['${keyDate}'].add(Reminder(
          title,
          note,
          group,
          priority,
          date,
          createAt,
          DateTime.now().millisecondsSinceEpoch,
          time));
    } else {
      ModelListReminder.listReminder['${group}'].addAll({
        keyDate: [
          Reminder(title, note, group, priority, date, createAt,
              DateTime.now().millisecondsSinceEpoch, time)
        ].toList()
      });
    }
    // if (date != null) {
    //   keyDate = DateFormat('yyyy-MM-dd')
    //       .format(DateTime.fromMillisecondsSinceEpoch(date));
    // }
    // if (ModelListReminder.listReminder.containsKey(group)) {
    //   if (ModelListReminder.listReminder['${group}'].length == 0) {
    //     initializationTimes(title, note, date, group, priority, createAt,
    //         lastUpdate, time, keyDate);
    //   } else {
    //     newReminder(title, note, date, group, priority, createAt, lastUpdate,
    //         time, keyDate);
    //   }
    // } else {
    //   //tạo group Mới
    //   newGroup(title, note, date, group, priority, createAt, lastUpdate, time,
    //       keyDate);
    // }

    Navigator.pop(context);
  }
}
