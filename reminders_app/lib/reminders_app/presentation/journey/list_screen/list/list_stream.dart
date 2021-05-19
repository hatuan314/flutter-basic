import 'dart:async';

import 'package:reminders_app/reminders_app/presentation/model/group.dart';
import 'package:reminders_app/reminders_app/presentation/model/reminder.dart';

import '../../reminders_list.dart';

class ListStream{
  List<Reminder> list=[];
  StreamController listController= StreamController<List<Reminder>>();
  Stream get listStream=>listController.stream;

  void update(int index)
  {
    list=RemindersList.MyLists[index].list;
 listController.sink.add(list);
  }
  void dispose()
  {
    listController.close();
  }
}