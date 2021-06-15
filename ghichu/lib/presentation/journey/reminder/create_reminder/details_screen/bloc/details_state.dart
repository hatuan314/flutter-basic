import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class DetailsState extends Equatable {}

// ignore: must_be_immutable
class InitDetailsState extends DetailsState {
  final bool isDateSwitch, isTimeSwitch, isDateTableCanlender, isTimeTable;
  DateTime selectDate;
  TimeOfDay timeOfDay;
  InitDetailsState(
      {this.isDateSwitch,
      this.isTimeSwitch,
      this.selectDate,
      this.timeOfDay,
      this.isDateTableCanlender,
      this.isTimeTable});
  InitDetailsState update(
          {bool isDateSwitch,
          bool isTimeSwitch,
          bool isDateTableCanlender,
          DateTime selectDate,
          TimeOfDay timeOfDay,
          bool isTimeTable}) =>
      InitDetailsState(
          timeOfDay: timeOfDay ?? this.timeOfDay,
          selectDate: selectDate ?? this.selectDate,
          isDateSwitch: isDateSwitch ?? this.isDateSwitch,
          isTimeSwitch: isTimeSwitch ?? this.isTimeSwitch,
          isDateTableCanlender:
              isDateTableCanlender ?? this.isDateTableCanlender,
          isTimeTable: isTimeTable ?? this.isTimeTable);

  @override
  List<Object> get props => [
        this.isDateSwitch,
        this.isTimeSwitch,
        this.isDateTableCanlender,
        this.isTimeTable,
        this.selectDate,
        this.timeOfDay
      ];
}

class PushPrioritiesState extends DetailsState {
  @override

  List<Object> get props => [];
}
