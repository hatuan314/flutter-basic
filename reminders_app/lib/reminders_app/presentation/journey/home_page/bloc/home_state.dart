import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:reminders_app/reminders_app/domain/entities/group.dart';


class HomeState extends Equatable {
  final int todayListLength;
  final int scheduledListLength;
  final int allListLength;
  final List<Group> myLists;


  HomeState({
    @required this.todayListLength,@required this.scheduledListLength,@required this.allListLength,
  @required this.myLists
});

  HomeState update({int todayListLength,
  int scheduledListLength,
  int allListLength,
    List myLists }) =>
      HomeState(
         todayListLength: todayListLength ?? this.todayListLength,
        scheduledListLength: scheduledListLength ?? this.scheduledListLength,
        allListLength: allListLength ?? this.allListLength,
        myLists: myLists //?? this.myLists,
      );

  @override
  List<Object> get props => [
   this.todayListLength, this.scheduledListLength,  this.allListLength,
    this.myLists
  ];
}