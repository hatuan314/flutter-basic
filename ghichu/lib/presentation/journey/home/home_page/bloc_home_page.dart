import 'dart:async';

import 'package:ghichu/presentation/models/model_map.dart';

class BlocHomePage {
  StreamController batEvent = new StreamController();
  StreamController _groupController = new StreamController();

  Stream get groupController => _groupController.stream;
  List<String> keyMyList=['Reminder'];
  void update(){
    batEvent.sink.add('event');
  }
  void getKey() {
    keyMyList = ModelListReminder.myList.keys.toList();
    batEvent.sink.add('event');
  }

  BlocHomePage() {
    batEvent.stream.listen((event) {
      _groupController.sink.add(event);
    });
  }

  void disploy() {
    batEvent.close();
    _groupController.close();
  }
}
