import 'dart:io';

import 'con_nguoi.dart';

class GiangVien with ConNguoi {
  String khoa;
  String monHoc;
  int namKN;

  @override
  void nhap() {
    print('nhap thong tin giang vien');
    // TODO: implement nhap
    super.nhap();
    print('nhap khoa: ');
    khoa = stdin.readLineSync();
    print('nhap mon hoc: ');
    monHoc = stdin.readLineSync();
    print('nhap nam kinh nghiem: ');
    namKN = int.parse(stdin.readLineSync());
  }

  @override
  String toString() {
    return 'GiangVien{hoTen: $hoTen, namSinh: $namSinh, queQuan: $queQuan, gioiTinh: $gioiTinh, khoa: $khoa, monHoc: $monHoc, namKN: $namKN}';
  }
}