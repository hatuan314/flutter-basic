import 'package:flutter/material.dart';

class CreateListState {
  Color listColor;
  String name;
  bool clearButton;

  CreateListState({this.listColor, this.name, this.clearButton});

  CreateListState update({
    Color listColor,
    String name,
    bool clearButton,
  }) =>
      CreateListState(
        listColor: listColor ?? this.listColor,
        name: name ?? this.name,
        clearButton: clearButton ?? this.clearButton,
      );
}
