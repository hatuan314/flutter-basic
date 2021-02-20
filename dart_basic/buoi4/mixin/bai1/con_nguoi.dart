import 'dart:io';

mixin ConNguoi {
  String hoTen;
  String namSinh;
  String queQuan;
  String gioiTinh;



  void nhap() {
    print("nhap ho ten: ");
    hoTen = stdin.readLineSync();
    print('nhap nam sinh: ');
    namSinh = stdin.readLineSync();
    print('nhap que quan: ');
    queQuan = stdin.readLineSync();
    print('nhap gioi tinh: ');
    gioiTinh = stdin.readLineSync();
  }
}