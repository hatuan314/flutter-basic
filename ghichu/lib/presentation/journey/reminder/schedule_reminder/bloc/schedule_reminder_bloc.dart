import 'dart:async';

import 'package:ghichu/presentation/journey/reminder/schedule_reminder/bloc/schedule_reminder_state.dart';

class ScheduleReminderBloc {
  ScheduleReminderState scheduleReminderState =
      ScheduleReminderState(reminderSchedule: {}, textEditing: []);
  StreamController _streamController =
      StreamController<ScheduleReminderState>.broadcast();

  Stream get streamController => _streamController.stream;
  void addTextEditing() {
    scheduleReminderState.addTextEditing();
    _streamController.sink.add(scheduleReminderState);
  }

  void setIndexReminder(int index) {
    scheduleReminderState.setIndexReminder(index);
    _streamController.sink.add(scheduleReminderState);
  }

  void setIndexGroup(int index) {
    scheduleReminderState.setGroup(index);
    _streamController.sink.add(scheduleReminderState);
  }

  void getKey() {
    scheduleReminderState.getReminder();
    _streamController.sink.add(scheduleReminderState);
  }

  void update() {
    _streamController.sink.add(scheduleReminderState);
  }

  void dispose() {
    _streamController.close();
  }
}
