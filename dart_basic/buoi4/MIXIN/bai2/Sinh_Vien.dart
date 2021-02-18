import 'dart:io';

import '../Hoc_Sinh.dart';



class Sinhvien with hocSinh{
  String maKhoa;
  void nhap(){
    nhapMixin();
    print('ma Khoa');
    maKhoa=stdin.readLineSync();

  }

}