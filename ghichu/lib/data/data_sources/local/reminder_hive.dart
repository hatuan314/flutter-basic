import 'package:ghichu/common/configs/local_db_setup.dart';
import 'package:ghichu/domain/entities/reminder_entity.dart';

class ReminderLocalDataSource {
  final LocalDbSetup localDbSetup;

  ReminderLocalDataSource({this.localDbSetup});
  Future<int> setReminder(ReminderEntity reminderEntity) async {
    return await localDbSetup.reminderBox.add(reminderEntity);
  }

  Future<List<ReminderEntity>> getReminderGroupLocal(String group) async {
    List<ReminderEntity> listReminder = [];
    for (int i = 0; i < localDbSetup.reminderBox.length; i++) {
      ReminderEntity reminderEntity = localDbSetup.reminderBox.getAt(i);
      if (group == reminderEntity.list) {
        listReminder.add(reminderEntity);
      }
    }
    return listReminder;
  }
}
