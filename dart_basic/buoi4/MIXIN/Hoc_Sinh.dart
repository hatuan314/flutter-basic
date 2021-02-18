import 'dart:io';

mixin hocSinh{
  String hoTen;
  int namSinh;
  String queQuan;
  void nhapMixin(){
    print('Nhap Ho Ten');
    hoTen=stdin.readLineSync();
    print('Nhap Nam Sinh');
    namSinh=int.parse(stdin.readLineSync());
    print('Nhap Que Quan');
    queQuan=stdin.readLineSync();
  }
}