import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AddListState extends Equatable {
  final Color selectColor;
  final bool activeAddBtn;

  AddListState({
    @required this.selectColor,
    this.activeAddBtn,
  });

  AddListState update({Color selectColor, bool activeAddBtn}) =>
      AddListState(
        selectColor: selectColor ?? this.selectColor,
        activeAddBtn: activeAddBtn ?? this.activeAddBtn,
      );

  @override
  List<Object> get props => [
        this.selectColor,
        this.activeAddBtn,
      ];
}
