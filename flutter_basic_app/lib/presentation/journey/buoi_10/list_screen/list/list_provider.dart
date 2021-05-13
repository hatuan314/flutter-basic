import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/model/reminder.dart';

import '../../reminders_list.dart';

class ListProvider with ChangeNotifier,DiagnosticableTreeMixin{
  List<Reminder> list=[];

  void update(int index)
  {
    list=RemindersList.MyLists[index].list;
    notifyListeners();
  }
}