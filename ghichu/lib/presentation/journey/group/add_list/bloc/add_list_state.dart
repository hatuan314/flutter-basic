import 'package:flutter/material.dart';

// class AddListState {
//   int index;
//   Color color;
//
//   AddListState({this.index, this.color});
//  void upDate({int index,Color color}){
//    this.index=index??this.index;
//    this.color=color??this.color;
//  }
// }
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AddListState extends Equatable {
  final Color color;
  final bool activeAddBtn;
  final int index;
  AddListState({@required this.color, this.activeAddBtn, this.index});
  AddListState update({Color selectColor, bool activeAddBtn, int index}) =>
      AddListState(
          color: selectColor ?? this.color,
          activeAddBtn: activeAddBtn ?? this.activeAddBtn,
          index: index ?? this.index);

  @override
  List<Object> get props => [
        this.color,
        this.index,
        this.activeAddBtn,
      ];
}
