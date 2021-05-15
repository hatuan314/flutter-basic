import 'package:ghi_chu/model/model_map.dart';
import 'package:ghi_chu/model/reminder.dart';
import 'package:intl/intl.dart';

class EditReminder {
  void editReminder(String title, String note, String group, String priority,
      int date, int createAt, lastUpdate, bool time, Map moDel) {
    String keyDate;
    String oldKeyDate;
    if (date == null) {
      keyDate = 'orther';
    } else {
      keyDate = DateFormat('yyyy-MM-dd')
          .format(DateTime.fromMillisecondsSinceEpoch(date));
    }
    if (moDel['date'] == null) {
      oldKeyDate = 'orther';
    } else {
      oldKeyDate = DateFormat('yyyy-MM-dd')
          .format(DateTime.fromMillisecondsSinceEpoch(moDel['date']));
    }
    if (moDel['reminder'] != 'none') {
      ModelListReminder.listReminder['${moDel['group']}'][oldKeyDate]
          .remove(moDel['reminder']);
      if (ModelListReminder
              .listReminder['${moDel['group']}'][oldKeyDate].length ==
          0) {
        ModelListReminder.listReminder['${moDel['group']}'].remove(oldKeyDate);
      }
    }

    if (ModelListReminder.listReminder['${group}'].containsKey(keyDate)) {
      ModelListReminder.listReminder['${group}']['${keyDate}'].add(Reminder(
          title,
          note,
          group,
          priority,
          date,
          moDel['createAt'],
          DateTime.now().millisecondsSinceEpoch,
          time));
    } else {
      ModelListReminder.listReminder['${group}'].addAll({
        keyDate: [
          Reminder(title, note, group, priority, date, moDel['createAt'],
              DateTime.now().millisecondsSinceEpoch, time)
        ].toList()
      });
    }
  }
}
