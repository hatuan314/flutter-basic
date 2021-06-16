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

 
class NewReminderState extends Equatable {
  String title;
  String notes;
  String list  ;
  Map<String,int> details;


  NewReminderState({this.title, this.notes, this.list, this.details});

  NewReminderState update({String title,
  String notes,
  String list,
  Map<String,int> details, }) =>
      NewReminderState(
       title: title?? this.title,
        notes: notes?? this.notes,
        list: list?? this.list,
        details: details??this.details
      );

  @override
  List<Object> get props => [
    this.title,
      this.notes,
     this.list,
     this.details
  ];
}