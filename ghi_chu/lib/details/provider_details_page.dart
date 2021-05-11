import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class ProviderDetailsPage with ChangeNotifier, DiagnosticableTreeMixin {
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
  void timeHour(int hour, int minute) {
    this.hour = hour;
    this.minuner = minute;
    notifyListeners();
  }
  void upDateTime() {
    notifyListeners();
  }

  void removePage(BuildContext context) {
    int h=hour*60*60*1000+minuner*60*1000;
// print('${DateFormat('yyyy-MM-dd HH-mm').format(DateTime.fromMillisecondsSinceEpoch(a))}');
    if (date) {
      if (time) {
        int a=DateTime.parse(DateFormat('yyyy-MM-dd').format(dateTime)).millisecondsSinceEpoch+h;
        Navigator.pop(
            context,
        [a,true].toList()
        );
      } else {
        int a=DateTime.parse(DateFormat('yyyy-MM-dd').format(dateTime)).millisecondsSinceEpoch;
        Navigator.pop(
            context,
              [a,false].toList()
        );
      }
    } else {
      Navigator.pop(context, null);
    }
  }

  void tableCanLender() {
    if (date == true) {
      tableCalender = !tableCalender;
    }
    notifyListeners();
  }

  void tableTimePicker() {
    if (time == true) {
      timePicker = !timePicker;
    }
    notifyListeners();
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

    notifyListeners();
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
    notifyListeners();
  }

  void dateScheldul(DateTime a) {
    this.dateTime = a;
    if (dateTime.weekday == 1) {
      thu = 'Thứ Hai';
    }
    if (dateTime.weekday == 2) {
      thu = 'Thứ Ba';
    }
    if (dateTime.weekday == 3) {
      thu = 'Thứ Tư';
    }
    if (dateTime.weekday == 4) {
      thu = 'Thứ Năm';
    }
    if (dateTime.weekday == 5) {
      thu = 'Thứ Sáu';
    }
    if (dateTime.weekday == 6) {
      thu = 'Thứ Bảy';
    }
    if (dateTime.weekday == 7) {
      thu = 'Chủ Nhật';
    }
    if (a.day == nowTime.day &&
        a.month == nowTime.month &&
        a.year == nowTime.year) {
      timeDate = 'Hôm Nay';
    } else if (a.day == nowTime.day + 1 &&
        a.month == nowTime.month &&
        a.year == nowTime.year) {
      timeDate = 'Ngày Mai';
    } else if (a.day == nowTime.day + 2 &&
        a.month == nowTime.month &&
        a.year == nowTime.year) {
      timeDate = 'Ngày Kia';
    } else {
      timeDate = thu +
          ',ngày ${dateTime.day} tháng ${dateTime.month}, ${dateTime.year}';
    }
    notifyListeners();
  }
}
