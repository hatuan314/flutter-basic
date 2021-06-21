import 'package:ghichu/domain/entities/group_entity.dart';
import 'package:ghichu/domain/entities/reminder_entity.dart';
import 'package:ghichu/domain/repositories/reminder_repository.dart';

class ReminderUseCase {
  final ReminderRepository reminderRepository;

  ReminderUseCase({this.reminderRepository});
  Future<int> addReminder(ReminderEntity reminderEntity) async {
    return await reminderRepository.setReminder(reminderEntity);
  }

  Future<Map<String, List<ReminderEntity>>> getReminderToGroup(
      List<GroupEntity> listGroup) async {
    Map<String, List<ReminderEntity>> listReminder = {};
    for (int i = 0; i < listGroup.length; i++) {
      List<ReminderEntity> reminder =
          await reminderRepository.getReminderToGroupLocal(listGroup[i].name);
      listReminder.addAll({listGroup[i].name:reminder});
    }
    return listReminder;
  }
}
