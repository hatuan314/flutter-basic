import 'package:flutter/material.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_state.dart';
import 'package:ghichu/presentation/models/group.dart';
import 'package:ghichu/common/extension/extension_datetime.dart';

class SettingNewReminder {
  final List<Groups> listGroup;
  final bool isEditReminder;
  SettingNewReminder({this.listGroup, this.isEditReminder});
}

class SettingListGroup {
  final List<Groups> listGroup;
  final Groups group;
  SettingListGroup({this.listGroup, this.group});
}

class SettingDetails {
  final InitDetailsState state;
  final String title, note, priorty;
  final TimeOfDay timeOfDay;
  final DateTime date;
  final bool isTime;
  int dateAndTime;
  SettingDetails(
      {this.isTime,
      this.state,
      this.title,
      this.note,
      this.timeOfDay,
      this.date,
      this.priorty}) {
    if (date != null) {
      if (timeOfDay != null) {
        dateAndTime =
            date.getTime(true, true, timeOfDay.hour, timeOfDay.minute);
      } else {
        dateAndTime = date.getTime(true, false, 0, 0);
      }
    } else {
      dateAndTime = null;
    }
  }
}

class SettingPriority {
  final String priority;
  final int indexSelect;
  SettingPriority({this.priority, this.indexSelect});
}
