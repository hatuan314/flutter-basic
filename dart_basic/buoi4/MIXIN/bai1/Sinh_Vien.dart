import 'dart:io';

import 'Con_nguoi.dart';



class sinhVien extends conNguoi{
  String maLop;
  String nganhHoc;
  String khoa;
  void nhap(){
    super.nhap();
    print('Ma Lop');
    maLop=stdin.readLineSync();
    print('Nganh Hoc');
    nganhHoc=stdin.readLineSync();
    print('Khoa ');
    khoa=stdin.readLineSync();
  }

  @override
  String toString() {
    return 'sinhVien{${super.toString()},maLop: $maLop, nganhHoc: $nganhHoc, khoa: $khoa}';
  }
  void xuat(){
    print(toString());
  }
}
