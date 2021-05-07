import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ghi_chu/model/reminder.dart';
import 'package:intl/intl.dart';

class providerReminder with ChangeNotifier, DiagnosticableTreeMixin {
  String title = '';
  String note = '';
  static String getnode = '';
  static String gettitle = '';
  var valuestime;
  static bool date = false;
  static bool time = false;
  DateTime nowdate = DateTime.now();
  static var getluestime;
  bool butoon = false;
  void bottonAdd(String title) {
    String kiemtranull;
    if (title.length > 0) {
      kiemtranull = title.replaceAll(' ', '');
      if (kiemtranull.length > 0) {
        butoon = true;
      } else {
        butoon = false;
      }
    } else {
      butoon = false;
    }
    notifyListeners();
  }

  void getvaluetime(var values) {
    valuestime = values;
    getluestime = valuestime;
    notifyListeners();
  }

  void getvalue(String title, String node) {
    this.title = title;
    this.note = note;
  }

  void addTodoList(
      BuildContext context, String titleControler, String nodeController) {
    List data = providerReminder.getluestime as List;
    reminder.listAll
        .add({'title': titleControler, 'note': nodeController, 'time': data});
    try {
      if (data[0]['date'].day == nowdate.day &&
          nowdate.month == data[0]['date'].month &&
          nowdate.year == data[0]['date'].year) {
        reminder.todaylist.add(
            {'title': titleControler, 'note': nodeController, 'time': data});
      }
    } catch (e) {}
    if (data != null) {
      bool kiemtra = true;
      for (int i = 0; i < reminder.Scheduletest.length; i++) {
        for (int j = 0; j < reminder.Scheduletest[i].length; j++) {
          if (DateFormat('dd-MM-yyyy')
                  .format(reminder.Scheduletest[i][j]['time'][0]['date']) ==
              DateFormat('dd-MM-yyyy').format(data[0]['date'])) {
            kiemtra = false;
            reminder.Scheduletest[i].add({
              'title': titleControler,
              'note': nodeController,
              'time': data
            });
            break;
          }
        }
      }
      if (kiemtra) {
        reminder.Scheduletest.add([]);
        reminder.Scheduletest[reminder.Scheduletest.length - 1].add(
            {'title': titleControler, 'note': nodeController, 'time': data});
      }
      // reminder.Scheduletest.sort((a, b) {
      //   var adate = a[0]['time'][0]['date']; //before -> var adate = a.expiry;
      //   var bdate = b[0]['time'][0]['date']; //var bdate = b.expiry;
      //   return adate.compareTo(bdate);
      // });
      // reminder.scheduled.add({'title': titleControler, 'note': nodeController, 'time': data});
    }
    Navigator.pop(context);
  }
}
