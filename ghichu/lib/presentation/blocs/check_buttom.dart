import 'dart:async';

class BlocCheckButton {
  StreamController _checkButtom = new StreamController.broadcast();
  StreamController batEvent = new StreamController();

  Stream get checkButtom => _checkButtom.stream;
  bool check = false;

  void setCheck() {
    check = !check;
    batEvent.sink.add('event');
  }

  void setButtom(String title) {
    if (title.trim().isNotEmpty) {
      check = true;
    } else {
      check = false;
    }
    batEvent.sink.add(check);
  }

  BlocCheckButton() {
    batEvent.sink.add(check);
    batEvent.stream.listen((event) {
      _checkButtom.sink.add(event);
    });
  }

  dispose() {
    _checkButtom.close();
    batEvent.close();
  }
}
