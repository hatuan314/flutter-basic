import 'dart:io';

import 'con_nguoi.dart';

class SinhVien with ConNguoi {
  String maLop;
  String nganhHoc;
  String khoa;


  @override
  void nhap() {
    // TODO: + nhap
    print('nhap thong tin sinh vien');
    super.nhap();
    print('nhap ma lop: ');
    maLop = stdin.readLineSync();
    print('nhap nghanh hoc: ');
    nganhHoc = stdin.readLineSync();
    print('nhap khoa: ');
    khoa = stdin.readLineSync();
  }

  @override
  String toString() {
    return 'SinhVien{hoTen: $hoTen, namSinh: $namSinh, queQuan: $queQuan,'
        ' gioiTinh: $gioiTinh, maLop: $maLop, nganhHoc: $nganhHoc, khoa: $khoa}';
  }
}
