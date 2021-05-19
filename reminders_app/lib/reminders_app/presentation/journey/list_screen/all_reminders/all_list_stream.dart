import 'dart:async';

import 'package:reminders_app/reminders_app/presentation/model/group.dart';

import '../../reminders_list.dart';

class AllListStream{
  List<Group> MyLists=[];
StreamController myListsController= StreamController<List<Group>>();
Stream get myListsStream=>myListsController.stream;
  void update()
  {
    MyLists=RemindersList.MyLists;
myListsController.sink.add(MyLists);
  }
  void dispose()
  {
    myListsController.close();
  }
}