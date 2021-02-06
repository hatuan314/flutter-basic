import 'dart:io';

import 'bai4.dart';


void main()
{
  while(true)
  {
    inMenu();
    var chon=int.parse(stdin.readLineSync());
    SinhVien sv = SinhVien();
    switch(chon)
    {
      case 1:
        sv.nhap();
        if(sv.du20())
          print('Đủ 20+');
        else
          print('Không đủ 20+');
        break;
      case 2:
        sv.nhap();

        if(sv.laNu())
          print('Là nữ');
        else
          print('Không là nữ');
        break;
      case 3:
        sv.nhap();
        print('Học khoa ${sv.tenKhoa()}');
        break;
    }
  }
}
void inMenu()
{
  print('1.Nhập thông tin sinh viên và kiểm tra xem tuổi đủ 20+ chưa');
  print('2.Nhập thông tin sinh viên và kiểm tra có là nữ không');
  print('3.Nhập thông tin sinh viên và kiểm tra xem học khoa gì');
  print('Chọn chức năng cần sử dụng');
}