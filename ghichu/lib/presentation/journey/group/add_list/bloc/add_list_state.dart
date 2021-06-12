import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class AddListState extends Equatable {}

class InitialAddListState extends AddListState {
  final Color color;
  final bool activeAddBtn;
  final int index;

  InitialAddListState({@required this.color, this.activeAddBtn, this.index});

  InitialAddListState update(
          {Color selectColor, bool activeAddBtn, int index}) =>
      InitialAddListState(
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

class SuccessAddListState extends AddListState {
  final bool isCreate;

  SuccessAddListState({@required this.isCreate});

  @override
  List<Object> get props => [this.isCreate];
}
