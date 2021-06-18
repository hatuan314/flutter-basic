import 'package:equatable/equatable.dart';
import 'package:reminders_app/reminders_app/domain/entities/group.dart';


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