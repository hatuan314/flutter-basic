import 'package:flutter/foundation.dart';
import 'package:ghi_chu/model/reminder.dart';

class providerhomePage with ChangeNotifier, DiagnosticableTreeMixin{
  int leghtAll=0;
  int leghttoday=0;
  int leghtSchedule=0;
void update(){
  leghtAll=reminder.listAll.length;
  leghttoday=reminder.todaylist.length;
  leghtSchedule=reminder.Scheduletest.length;
  notifyListeners();
}
}