import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:reminders_app/reminders_app/presentation/model/group.dart';

/*
class HomeState {
  int l1 = 0, l2 = 0, l3 = 0;
  List<Group> MyLists = [];

  HomeState({this.l1, this.l2, this.l3, this.MyLists});
  HomeState update({int l1 , l2  , l3 ,
  List<Group> MyLists})=> HomeState(l1:l1?? this.l1, l2:l2?? this.l2, l3:l3?? this.l3, MyLists:MyLists?? this.MyLists);
}*/
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