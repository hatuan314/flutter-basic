import 'dart:io';

mixin hocSinh{
  String HoTen;
  int namsinh;
  String QueQuan;

  void NhapMinXin(){
    print('Nhap ho ten: ');
    HoTen = stdin.readLineSync();
    print('Nhap nam sinh: ');
    namsinh = int.parse(stdin.readLineSync());
    print('Nhap que quan: ');
    QueQuan = stdin.readLineSync();
  }
}