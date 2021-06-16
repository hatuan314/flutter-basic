import 'package:flutter/cupertino.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_state.dart';
import 'package:ghichu/presentation/models/group.dart';
import 'package:ghichu/presentation/models/reminder.dart';

abstract class NewReminderEvent {}

class UpDateNewReminderDetailsEvent extends NewReminderEvent {
  final Details details;
  final bool isDateDetails;
  final InitDetailsState initDetailsState;
  UpDateNewReminderDetailsEvent(
      {this.initDetailsState, this.details, this.isDateDetails});
}

class UpDateNewReminderListGroupEvent extends NewReminderEvent {
  final Groups groups;
  UpDateNewReminderListGroupEvent({this.groups});
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
