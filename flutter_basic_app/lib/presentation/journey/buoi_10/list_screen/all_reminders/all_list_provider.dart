import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/model/group.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/model/reminder.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/reminders_list.dart';

class AllListProvider with ChangeNotifier,DiagnosticableTreeMixin{
  List<Group> MyLists=[];

  void update()
  {
    MyLists=RemindersList.MyLists;

    notifyListeners();
  }
}