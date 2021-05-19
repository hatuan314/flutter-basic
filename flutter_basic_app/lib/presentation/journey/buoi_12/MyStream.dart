import 'dart:async';

class MyStream{
  int count =0;
  StreamController streamController = StreamController();
  Stream get counterStream => streamController.stream;

  void increment(){
    count++;
    streamController.sink.add(count);
  }

  void dispose()
  {
    streamController.close();
  }
}