import 'package:flutter/material.dart';

class AddListState {
  int index;
  Color color;

  AddListState({this.index, this.color});
 void upDate({int index,Color color}){
   this.index=index??this.index;
   this.color=color??this.color;
 }
}
