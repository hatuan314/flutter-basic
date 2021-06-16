import 'package:flutter/cupertino.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_state.dart';
import 'package:ghichu/presentation/models/group.dart';
import 'package:ghichu/presentation/models/reminder.dart';

abstract class NewReminderEvent {}

class UpDateNewReminderEvent extends NewReminderEvent {
  final Details details;
  final Groups groups;
  final bool isDateDetails,isTime;
final int date;
final InitDetailsState initDetailsState;
  UpDateNewReminderEvent({this.initDetailsState,this.details,this.isDateDetails, this.groups,this.date,this.isTime});
}

class ActiveBtn extends NewReminderEvent {
  final String title;
  bool activeBtn;
  ActiveBtn({this.title}) {
    if (title.trim().isNotEmpty) {
      this.activeBtn = true;
    } else {
      this.activeBtn = false;
    }
  }
}

class PushDetailEvent extends NewReminderEvent {}

class PushListGroupEvent extends NewReminderEvent {}
