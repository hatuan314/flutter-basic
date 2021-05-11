import 'package:flutter/foundation.dart';
import 'package:ghi_chu/__mock__/costranisn.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:ghi_chu/model/reminder.dart';

class ProviderHomePage with ChangeNotifier, DiagnosticableTreeMixin {
  int leghtAll = 0;
  int leghtToDay = 0;
  int leghtSchedule = 0;
  bool edit = true;
  var data = ConstHomePage.list;

  void update() {
    notifyListeners();
  }

  void setLeght() {
    int all = 0;
    ModelListReminder.listReminder.forEach((key, value) {
      value.forEach((key, value) {
        all = all + value.length;
      });
    });
    leghtAll = all;
    notifyListeners();
  }

  void setedit() {
    edit = !edit;
    notifyListeners();
  }

  void setlist() {
    notifyListeners();
  }
}
