import 'package:reminders_app/reminders_app/domain/entities/reminder.dart';

class ScheduledListState{
  List<String> dateList =[];
  Map<String,List<Reminder>> scheduledList= Map();

  ScheduledListState({this.dateList, this.scheduledList});
  ScheduledListState update({List<String> dateList ,
  Map<String,List<Reminder>> scheduledList,}) => ScheduledListState(dateList:dateList?? this.dateList, scheduledList:scheduledList?? this.scheduledList);
}