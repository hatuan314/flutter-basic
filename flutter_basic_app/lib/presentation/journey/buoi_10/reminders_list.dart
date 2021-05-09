import 'dart:developer';

class RemindersList {
  static List remindersForToday = [];
  static List scheduledReminders = [];
  static List allReminders = [];
  static List MyList = [];
  static void addDefaultList() {
    int f = 0;
    for (int i = 0; i < MyList.length; i++) {
      if (MyList[i]['name'] == 'Reminders') f++;
    }
    if (f == 0) {
      addList('Reminders');
    }
  }

  static void addList(String value) {
    MyList.add({'name': value, 'count': 0, 'list': List});
    log(MyList.toString());
    // notifyListeners();
  }

  void addReminder(String title, String notes, String list, String date,
      String time, String priority) {
    allReminders.add({
      'title': title,
      'notes': notes,
      'list': list,
      'date': date,
      'time': time,
      'priority': priority
    });
    log(title + '' + notes + '' + list);
    if (date != '') {
      scheduledReminders.add({
        'title': title,
        'notes': notes,
        'list': list,
        'date': date,
        'time': time,
        'priority': priority
      });
    }
    if (date == 'Today') {
      remindersForToday.add({
        'title': title,
        'notes': notes,
        'list': list,
        'date': date,
        'time': time,
        'priority': priority
      });
    }

    //log(allReminder.length.toString());
  }
}
