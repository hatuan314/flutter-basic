import 'package:flutter/cupertino.dart';

abstract class NewReminderEvent {}

class UpDateNewReminderEvent extends NewReminderEvent {
  final String nameGroup;
  final Color colorGroup;
  final bool isDateDetails;
  UpDateNewReminderEvent({this.isDateDetails, this.nameGroup, this.colorGroup});
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
