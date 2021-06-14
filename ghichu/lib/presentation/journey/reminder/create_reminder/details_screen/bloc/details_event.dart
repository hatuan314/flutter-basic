import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class DetailsEvent {}

class DateSwitchEvent extends DetailsEvent {
  final bool isDateSwitch;
  DateSwitchEvent({@required this.isDateSwitch});
}

class IsShowDateTableCanlenderEvent extends DetailsEvent {
  final bool isShowDateTableCanlender;

  IsShowDateTableCanlenderEvent({this.isShowDateTableCanlender});
}

class TimeSwitchEvent extends DetailsEvent {
  final bool isTimeSwitch;
  TimeSwitchEvent({@required this.isTimeSwitch});
}

class IsShowTimeTableEvent extends DetailsEvent {
  final bool isShowTimeTable;
  IsShowTimeTableEvent({this.isShowTimeTable});
}

class SelectDate extends DetailsEvent {
  final DateTime selectDate;
  SelectDate(this.selectDate);
}
class SelectTime extends DetailsEvent{
  final TimeOfDay timeOfDay;

  SelectTime(this.timeOfDay);
}
