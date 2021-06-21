import 'package:equatable/equatable.dart';
import 'package:reminders_app/reminders_app/domain/entities/group.dart';


class AllRemindersState extends Equatable {
 final List<Group> myLists ;
  AllRemindersState({this.myLists});

  AllRemindersState update({  List<Group> myLists }) =>
      AllRemindersState(
          myLists:  myLists //?? this.myLists
      );

  @override
  List<Object> get props => [
    this.myLists
  ];
}