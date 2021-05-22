import 'dart:async';

class CheckButtonBloc {
  StreamController checkButtom = new StreamController.broadcast();
  Stream get checkButton => checkButtom.stream;
  bool check = false;
  void setCheck() {
    check = !check;
    checkButtom.sink.add(check);
  }

  void setButtom(String title) {
    if (title.trim().isNotEmpty) {
      check = true;
    } else {
      check = false;
    }
    checkButtom.sink.add(check);
  }

  dispose() {
    checkButtom.close();
  }
}
