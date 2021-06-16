import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class DetailsState extends Equatable {}

// ignore: must_be_immutable
class InitDetailsState extends DetailsState {
  final bool isDateSwitch, isTimeSwitch, isDateTableCanlender, isTimeTable;
  DateTime selectDate;
  String priority;
  int indexSelect;
  TimeOfDay timeOfDay;
  InitDetailsState(
      {this.isDateSwitch,
      this.isTimeSwitch,
      this.indexSelect,
      this.priority,
      this.selectDate,
      this.timeOfDay,
      this.isDateTableCanlender,
      this.isTimeTable});
  InitDetailsState update(
          {bool isDateSwitch,
          bool isTimeSwitch,
          bool isDateTableCanlender,
          int indexSelect,
          String priority,
          DateTime selectDate,
          TimeOfDay timeOfDay,
          bool isTimeTable}) =>
      InitDetailsState(
          indexSelect: indexSelect ?? this.indexSelect,
          priority: priority ?? this.priority,
          timeOfDay: timeOfDay ?? this.timeOfDay,
          selectDate: selectDate ?? this.selectDate,
          isDateSwitch: isDateSwitch ?? this.isDateSwitch,
          isTimeSwitch: isTimeSwitch ?? this.isTimeSwitch,
          isDateTableCanlender:
              isDateTableCanlender ?? this.isDateTableCanlender,
          isTimeTable: isTimeTable ?? this.isTimeTable);

  @override
  List<Object> get props => [
        this.indexSelect,
        this.isDateSwitch,
        this.isTimeSwitch,
        this.isDateTableCanlender,
        this.isTimeTable,
        this.selectDate,
        this.timeOfDay,
        this.priority,
      ];
}

class PushPrioritiesState extends DetailsState {
  final int indexSelect;
  PushPrioritiesState({this.indexSelect});
  @override
  List<Object> get props => [];
}
