import 'dart:async';

import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_state.dart';

class NewReminderBloc {
  NewReminderState newReminderState = NewReminderState(
    title: '',
    note: '',
    index: 0,
    nowDate: DateTime.now(),
    button: false,
    isButtonDetails: false,
    isTimeDetails: false,
  );
  StreamController _listGroupController =
      StreamController<NewReminderState>.broadcast();

  Stream get listGroupController => _listGroupController.stream;

  void setGroup(String group, int index) {
    newReminderState.setGroup(group, index);
    _listGroupController.sink.add(newReminderState);
  }

  void setTime(var time) {
    newReminderState.setTime(time);
    _listGroupController.sink.add(newReminderState);
  }

  void update() {
    _listGroupController.sink.add(newReminderState);
  }

  void dispose() {
    _listGroupController.close();
  }
}
