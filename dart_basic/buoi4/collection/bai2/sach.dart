import 'dart:io';

class Sach{
  String maSach;
  String tenSach;
  String maTacGia;
  String maNXB;


  Sach(this.maSach, this.tenSach, this.maTacGia, this.maNXB);


  void nhap(){
    print('nhap ma sach: '); maSach = stdin.readLineSync();
    print('nhap ten sach: '); tenSach = stdin.readLineSync();
    print('nhap ma tac gia: '); maTacGia = stdin.readLineSync();
    print('nhap ma NXB: '); maNXB = stdin.readLineSync();
  }

  @override
  String toString() {
    return 'Sach{maSach: $maSach, tenSach: $tenSach, maTacGia: $maTacGia, maNXB: $maNXB}';
  }
}