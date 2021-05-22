import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:reminders_app/reminders_app/presentation/model/group.dart';

import '../../reminders_list.dart';


class AllListProvider with ChangeNotifier,DiagnosticableTreeMixin{
  List<Group> MyLists=[];

  void update()
  {
    MyLists=RemindersList.MyLists;
    notifyListeners();
  }
}