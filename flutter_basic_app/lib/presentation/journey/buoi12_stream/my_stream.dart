import 'dart:async';

class MyStream {
  int counter = 0;
  StreamController counterController = new StreamController<int>();
  Stream get counterStream => counterController.stream;

  void increment() {
    counter += 1;
    counterController.sink.add(counter);
  }

  void dispose() {
    counterController.close();
  }
}