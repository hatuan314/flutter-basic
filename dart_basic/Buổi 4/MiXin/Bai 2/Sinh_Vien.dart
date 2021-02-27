import 'dart:io';
import '../MiXin/Học_SInh.dart';

class SinhVien with hocSinh{
  String MaKhoa;
  void Nhap(){
    NhapMinXin();
    print('Ma khoa: ');
    MaKhoa = stdin.readLineSync();

  }
}