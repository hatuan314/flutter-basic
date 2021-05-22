import 'package:ghichu/presentation/models/model_map.dart';
import 'package:ghichu/presentation/models/reminder.dart';

class AllReminderState{
  String group;
  String title;
  int indexGroup,indexTextFiled,indexReminder;
  String hedear;
  void setGroup(String group) {
    this.group = group;
  }
  void setIndex(int index,int indexReminder){
    this.indexTextFiled=index;
    this.indexReminder=indexReminder;
  }
  void addAll(String group, String title) {
    if (ModelListReminder.listReminder['${group}']['orther'] == null) {
      ModelListReminder.listReminder['${group}'].addAll({
        'orther': [
          Reminder(
              title,
              '',
              group,
              'none',
              null,
              DateTime.now().millisecondsSinceEpoch,
              DateTime.now().millisecondsSinceEpoch,
              false)
        ].toList()
      });
    } else {
      ModelListReminder.listReminder['${group}']['orther'].add(Reminder(
          title,
          '',
          group,
          'none',
          null,
          DateTime.now().millisecondsSinceEpoch,
          DateTime.now().millisecondsSinceEpoch,
          false));
    }

  }
}