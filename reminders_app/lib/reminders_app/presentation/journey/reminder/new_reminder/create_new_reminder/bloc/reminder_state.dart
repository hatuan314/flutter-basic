/*
class ReminderState{
  String title;
  String notes;
  String list = 'Reminders';
  var details;

  ReminderState({this.title, this.notes, this.list, this.details});
  ReminderState update({
    String title,
    String notes,
    String list,
    var details,
}) => ReminderState(title:title?? this.title, notes:notes?? this.notes, list:list?? this.list, details:details?? this.details);
}*/
import 'package:equatable/equatable.dart';
import 'package:reminders_app/common/enums/view_state.dart';

 
class NewReminderState extends Equatable {
  String title;
  String notes;
  String list  ;
  Map<String,int> details;
  final ViewState viewState;

  NewReminderState({this.title, this.notes, this.list, this.details,this.viewState});

  NewReminderState update({String title,
  String notes,
  String list,
  Map<String,int> details, ViewState viewState}) =>
      NewReminderState(
       title: title?? this.title,
        notes: notes?? this.notes,
        list: list?? this.list,
        details: details??this.details,
          viewState: viewState?? this.viewState
      );

  @override
  List<Object> get props => [this.viewState,
    this.title,
      this.notes,
     this.list,
     this.details
  ];
}