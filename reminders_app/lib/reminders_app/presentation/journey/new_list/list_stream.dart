import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class ListStream {
  Color listColor=Colors.blue;
  String name;
  bool clearButton=false;
  StreamController nameController = new StreamController();
  StreamController colorController = new StreamController.broadcast();
  StreamController clearButtonController = new StreamController.broadcast();
  Stream get colorStream => colorController.stream;
  Stream get clearButtonStream => clearButtonController.stream;
  void setClearButton(bool value)
  {
    clearButton=value;
    log(clearButton.toString());
    clearButtonController.sink.add(clearButton);

  }
  void setColor(Color value)
  {
    listColor=value;
   // log(listColor.toString());
    colorController.sink.add(listColor);
  }

  void setName(String value)
  {
    name=value;
    log(name);
    nameController.sink.add(name);
  }
  void dispose() {
    colorController.close();
    clearButtonController.close();
  }
}