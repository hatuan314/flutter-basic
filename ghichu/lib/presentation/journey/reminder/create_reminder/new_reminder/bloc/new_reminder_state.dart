import 'package:equatable/equatable.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_state.dart';
import 'package:ghichu/presentation/models/group.dart';

abstract class NewReminderState extends Equatable {}

class InitialNewReminderState extends NewReminderState {
  final bool isDateDetails, isTime;
  final bool activeBtn;
  final Groups groups;
  final int date;
  final InitDetailsState initDetailsState;
  final String timeDateDetails;
  InitialNewReminderState(
      {this.date,
      this.initDetailsState,
      this.timeDateDetails,
      this.isTime,
      this.isDateDetails,
      this.activeBtn,
      this.groups});
  InitialNewReminderState update({
    bool isDateDetails,
    InitDetailsState initDetailsState,
    String timeDateDetails,
    Groups groups,
    bool isTime,
    bool activeBtn,
    int date,
  }) =>
      InitialNewReminderState(
          timeDateDetails: timeDateDetails ?? this.timeDateDetails,
          initDetailsState: initDetailsState ?? this.initDetailsState,
          isTime: isTime ?? this.isTime,
          date: date ?? this.date,
          groups: groups ?? this.groups,
          isDateDetails: isDateDetails ?? this.isDateDetails,
          activeBtn: activeBtn ?? this.activeBtn);

  @override
  List<Object> get props => [
        this.timeDateDetails,
        this.initDetailsState,
        this.date,
        this.activeBtn,
        this.isDateDetails,
        this.groups,
        this.isTime
      ];
}

class PushToDetailState extends NewReminderState {
  final InitDetailsState initDetailsState;

  PushToDetailState({this.initDetailsState});
  @override
  List<Object> get props => [this.initDetailsState];
}

class PushToListGroupState extends NewReminderState {
  final Groups groups;

  PushToListGroupState({this.groups});
  @override
  // TODO: implement props
  List<Object> get props => [];
}
