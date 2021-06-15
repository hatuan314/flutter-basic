import 'dart:ui';

import 'package:equatable/equatable.dart';

abstract class NewReminderState extends Equatable {}

class InitialNewReminderState extends NewReminderState {
  final bool isDateDetails;
  final bool activeBtn;
  final String nameGroup;
  final Color colorsGroup;
  InitialNewReminderState(
      {this.isDateDetails, this.activeBtn, this.colorsGroup, this.nameGroup});
  InitialNewReminderState update(
          {bool isDateDetails,
          bool activeBtn,
          String nameGroup,
          Color colorsGroup}) =>
      InitialNewReminderState(
          colorsGroup: colorsGroup ?? this.colorsGroup,
          nameGroup: nameGroup ?? this.nameGroup,
          isDateDetails: isDateDetails ?? this.isDateDetails,
          activeBtn: activeBtn ?? this.activeBtn);

  @override
  List<Object> get props =>
      [this.activeBtn, this.isDateDetails, this.nameGroup, this.colorsGroup];
}

class PushToDetailState extends NewReminderState {
  @override
  List<Object> get props => [];
}

class PushToListGroupState extends NewReminderState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
