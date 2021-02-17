import 'dart:io';

class TacGia{
  String maTacGia;
  String tenTacGia;


  TacGia(this.maTacGia, this.tenTacGia);

  void nhap(){
    print('nhap ma tac gia: '); maTacGia = stdin.readLineSync();
    print('nhap ten tac gia: '); tenTacGia = stdin.readLineSync();
  }

  @override
  String toString() {
    return 'TacGia{maTacGia: $maTacGia, tenTacGia: $tenTacGia}';
  }
}