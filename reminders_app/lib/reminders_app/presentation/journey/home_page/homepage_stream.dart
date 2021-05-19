import 'dart:async';
import 'dart:developer';

import 'package:reminders_app/reminders_app/presentation/model/group.dart';

import '../reminders_list.dart';

class HomeStream {
  int l1 = 0, l2 = 0, l3 = 0;
  List<Group> MyLists = [];
  StreamController<int> todayListLengthController = StreamController();
  StreamController<int> scheduledListLengthController = StreamController();
  StreamController<int> allListLengthController = StreamController();
  StreamController<List<Group>> myListsController = StreamController<List<Group>>.broadcast();
  Stream get myLists => myListsController.stream;
  Stream get todayListLength=> todayListLengthController.stream;
  Stream get scheduledListLength => scheduledListLengthController.stream;
  Stream get allListLength => allListLengthController.stream;

  void update() {
    log('update');
    l1 = 0;
    l2 = 0;
    l3 = 0;
    if (RemindersList.allReminders?.length == null) {
      l1 = 0;
      l2 = 0;
      l3 = 0;
    } else {
      RemindersList.allReminders?.forEach((key, value) {
        String now =  DateTime.now().day<10?'0'+DateTime.now().day.toString():DateTime.now().day.toString() + "/" +((DateTime.now().month<10)?'0'+DateTime.now().month.toString():DateTime.now().month.toString()) + "/" +
            DateTime.now().year.toString();
        if (key == now) {
          l1 = RemindersList.allReminders[now].length;
        }
        if (key != ('Others')) {
          l2 += RemindersList.allReminders[key].length;
        }
        l3 += RemindersList.allReminders[key].length;
      });
    }
    RemindersList.addDefaultList();
    MyLists = RemindersList.MyLists;
    log(MyLists.length.toString());
    todayListLengthController.sink.add(l1);
    scheduledListLengthController.sink.add(l2);
    allListLengthController.sink.add(l3);
    myListsController.sink.add(MyLists);
  }

  void dispose(){
    todayListLengthController.close();
    scheduledListLengthController.close();
    allListLengthController.close();
    myListsController.close();
  }
}