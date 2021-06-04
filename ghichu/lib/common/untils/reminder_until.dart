import 'package:flutter/cupertino.dart';
import 'package:ghichu/common/enums/reminder_enum.dart';
import 'package:ghichu/presentation/journey/reminder/all_reminder/bloc/all_reminder_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/schedule_reminder/bloc/schedule_reminder_bloc.dart';

void reminderUntil(
    {ReminderEnum type,
    ScheduleReminderBloc scheduleReminderBloc,
    AllReminderBloc allReminderBloc,
    String keyGroup,
    List<TextEditingController> controller,
    String keyDate}) {
  switch (type) {
    case ReminderEnum.All:
      for (int i = 0; i < controller.length; i++) {
        if (controller[i].text.isNotEmpty) {
          allReminderBloc.addAll(keyGroup, controller[i].text);
        }
        controller[i].text = '';
      }
      break;
    case ReminderEnum.Schedule:
      for (int i = 0; i < controller.length; i++) {
        if (controller[i].text.isNotEmpty) {
          scheduleReminderBloc.addReminder(
              title: controller[i].text, group: keyGroup, keyDate: keyDate);
        }
        controller[i].text = '';
      }
      break;
    case ReminderEnum.Today:
      break;
  }
}
