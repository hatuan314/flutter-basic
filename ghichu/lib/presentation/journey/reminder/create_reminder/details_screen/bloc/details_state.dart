import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ghichu/common/extension/extensin_datetime.dart';

class DetailsState {
  bool date = false;
  bool time = false;
  bool tableCalender = false;
  bool timePicker = false;
  DateTime dateTime = DateTime.now();
  DateTime nowTime = DateTime.now();
  String timeDate = 'Hôm Nay';
  String thu = '';
  int hour = DateTime.now().hour;
  int minuner = DateTime.now().minute;

  DetailsState(
      {this.date,
      this.time,
      this.tableCalender,
      this.timePicker,
      this.dateTime,
      this.nowTime,
      this.timeDate,
      this.thu,
      this.hour,
      this.minuner});

  void timeHour(int hour, int minute) {
    this.hour = hour;
    this.minuner = minute;
  }

  void removePage(BuildContext context) {
    int h = hour * 60 * 60 * 1000 + minuner * 60 * 1000;
// print('${DateFormat('yyyy-MM-dd HH-mm').format(DateTime.fromMillisecondsSinceEpoch(a))}');
    if (date) {
      if (time) {
        int a = DateTime.parse(DateFormat('yyyy-MM-dd').format(dateTime))
                .millisecondsSinceEpoch +
            h;
        Navigator.pop(context, [a, true].toList());
      } else {
        int a = DateTime.parse(DateFormat('yyyy-MM-dd').format(dateTime))
            .millisecondsSinceEpoch;
        Navigator.pop(context, [a, false].toList());
      }
    } else {
      Navigator.pop(context, null);
    }
  }

  void tableCanLender() {
    if (date == true) {
      tableCalender = !tableCalender;
    }
  }

  void tableTimePicker() {
    if (time == true) {
      timePicker = !timePicker;
    }
  }

  void dateSwitch(bool values) {
    date = values;
    tableCalender = true;
    if (date == false) {
      tableCalender = false;
      time = false;
      timePicker = false;
      // dateTime = nowTime;
      hour = DateTime.now().hour;
      minuner = DateTime.now().minute;
      timeDate = 'Hôm Nay';
    }
  }

  void timeSwitch(bool values) {
    time = values;
    if (time == true) {
      timePicker = true;
      date = true;
    } else {
      hour = DateTime.now().hour;
      minuner = DateTime.now().minute;
      timePicker = false;
    }
  }

  void dateScheldul(DateTime a) {
    this.dateTime = a;
    timeDate = dateTime.now;
  }
}
