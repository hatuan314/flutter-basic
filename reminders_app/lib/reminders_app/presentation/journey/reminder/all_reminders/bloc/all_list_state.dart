import 'package:equatable/equatable.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminders_list.dart';
import 'package:reminders_app/reminders_app/presentation/model/group.dart';

class AllReminderState extends Equatable { 
 final List<Group> myLists ;
  AllReminderState({this.myLists});

  AllReminderState update({  List<Group> myLists }) =>
      AllReminderState(
          myLists:  myLists //?? this.myLists
      );

  @override
  List<Object> get props => [
    this.myLists
  ];
}