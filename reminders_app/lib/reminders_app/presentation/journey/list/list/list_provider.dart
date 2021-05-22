import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:reminders_app/reminders_app/presentation/model/reminder.dart';
import '../../reminders_list.dart';
class ListProvider with ChangeNotifier,DiagnosticableTreeMixin{
  List<Reminder> list=[];

  void update(int index)
  {
    list=RemindersList.MyLists[index].list;
    notifyListeners();
  }
}