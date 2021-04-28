import 'package:flutter/foundation.dart';

class switchdate with ChangeNotifier, DiagnosticableTreeMixin {
  bool date = false;
  bool time = false;
  static bool getdate = false;
  static bool gettime = false;
  bool tablecalender = false;
  bool timepicker = false;
  DateTime dateTime = DateTime.now();
  DateTime nowTime = DateTime.now();
  String timedate = 'Hôm Nay';
  String thu = '';
  static DateTime getdataTime;
  static int gethour = DateTime.now().hour;
  static int getminuner = DateTime.now().minute;
  int hour = DateTime.now().hour;
  int minuner = DateTime.now().minute;
  void timehuor(int hour, int minute) {
    this.hour = hour;
    this.minuner = minute;
    gethour = hour;
    getminuner = minute;
    notifyListeners();
  }

  void tablecanlender() {
    if (date == true) {
      tablecalender = !tablecalender;
    }
    notifyListeners();
  }

  void timepicke() {
    if (time == true) {
      timepicker = !timepicker;
    }
    notifyListeners();
  }

  void dateswitch(bool values) {
    date = values;
    tablecalender = true;
    if (date == false) {
      tablecalender = false;
      time = false;
      timepicker = false;
      dateTime = nowTime;
      timedate = 'Hôm Nay';
    }
    getdate = date;
    gettime = time;
    notifyListeners();
  }

  void timeswitch(bool values) {
    time = values;
    if (time == true) {
      timepicker = true;
      date = true;
    } else {
      timepicker = false;
    }
    getdate = date;
    gettime = time;
    notifyListeners();
  }

  void dateScheldul(DateTime a) {
    dateTime = a;
    getdataTime = a;
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
      timedate = 'Hôm Nay';
    } else if (a.day == nowTime.day + 1 &&
        a.month == nowTime.month &&
        a.year == nowTime.year) {
      timedate = 'Ngày Mai';
    } else if (a.day == nowTime.day + 2 &&
        a.month == nowTime.month &&
        a.year == nowTime.year) {
      timedate = 'Ngày Kia';
    } else {
      timedate = thu +
          ',ngày ${dateTime.day} tháng ${dateTime.month}, ${dateTime.year}';
    }
    notifyListeners();
  }
}
