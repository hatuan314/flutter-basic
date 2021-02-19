import 'dart:io';

import '../Học_SInh.dart';

class conNguoi with hocSinh{
  String GioTinh;

  void Nhap(){
    NhapMinXin();
    print('Nhap gioi tinh: ');
    GioTinh = stdin.readLineSync();
  }

  @override
  String toString() {
    return 'Ho ten: $HoTen, Nam sinh: $namsinh, Que quan: $QueQuan, Gioi tinh: $GioTinh';
  }
}