import 'dart:io';

import 'Con_nguoi.dart';



class giangVien extends conNguoi{
  String khoa;
  String monHoc;
  int namKn;
void nhap(){
  super.nhap();
  print('Khoa ');
  khoa=stdin.readLineSync();
  print('Mon Hoc');
  monHoc=stdin.readLineSync();
  print('Nam Kinh Nghiem');
  namKn=int.parse(stdin.readLineSync());
  }
  @override
  String toString() {
    return 'GiangVien{${super.toString()},khoa: $khoa, monHoc: $monHoc, namKn: $namKn}';
  }
  void xuat(){
    print(toString());
  }
}