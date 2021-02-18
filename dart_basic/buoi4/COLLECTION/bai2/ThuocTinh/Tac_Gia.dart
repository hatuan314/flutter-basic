import 'dart:io';

class Tacgia{
  String maTacgia;
  String tenTacgia;
void nhap(){
  print('ma Tac Gia');
  maTacgia=stdin.readLineSync();
  print('Ten Tac Gia');
  tenTacgia=stdin.readLineSync();
  }

  @override
  String toString() {
    return 'Tacgia{maTacgia: $maTacgia, tenTacgia: $tenTacgia}';
  }
}