import 'dart:async';
import 'package:ghichu/presentation/journey/reminder/all_reminder/bloc/all_reminder_state.dart';

class AllReminderBloc {
  AllReminderState allReminderState = AllReminderState();
  StreamController _allController =
      StreamController<AllReminderState>.broadcast();

  Stream get allController => _allController.stream;
void addAll(String group,String title){
  allReminderState.addAll(group, title);
  _allController.sink.add(allReminderState);
}
void setIndexGroup(int index){
  allReminderState.indexGroup=index;
  _allController.sink.add(allReminderState);
}
void update(){
  _allController.sink.add(allReminderState);
}
void setIndexReminder(int index,int indexReminder){
  allReminderState.setIndex(index, indexReminder);
  _allController.sink.add(allReminderState);
}
  void dispose() {
    _allController.close();
  }
}
