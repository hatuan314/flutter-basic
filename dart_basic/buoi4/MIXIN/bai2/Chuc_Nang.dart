import 'dart:io';

import 'Sinh_Vien.dart';



class Chucnang{
  Sinhvien sv=new Sinhvien();
  void nhap(){
    sv.nhap();
  }
  void kiemTra(){
    if(2021-sv.namSinh>20){
      print('Da du tuoi');
    }
    else{
      print('chua du tuoi');
    }
  }
  void kiemTragt(){
    if(sv.hoTen.toLowerCase().contains(" thi ")){
      print('La Nu');
    }
    else{
      print('La Nam');
    }
  }
  void kiemTrakhoa(){
    if(sv.maKhoa.toLowerCase().startsWith('at')){
      print('An Toan Thong Tin');
    }
    if(sv.maKhoa.toLowerCase().startsWith('dt')){
      print('Dien tu Vien Thong');
    }
    if(sv.maKhoa.toLowerCase().startsWith('ct')){
      print('Cong Nghe Thong Tin');
    }
  }
  void menu(){
    print('1. Nhập vào từ bàn phím thông tin của 1 sinh viên KMA. Kiểm tra xem sinh viên đó đã đủ 20+ hay chưa? ');
    print('2. Nhập vào từ bàn phím thông tin của 1 sinh viên KMA. Kiểm tra xem sinh viên đó có phải là nữ hay không (Biết rằng nếu là nữ sẽ có từ "Thị" ở trong thuộc tính họ và tên)? ');
    print('3. Nhập vào từ bàn phím thông tin của 1 sinh viên KMA. Kiểm tra xem sinh viên đó học khoa gì (Biết rằng An toàn thông tin có mã khoa là AT, Điện tử viễn thông là ĐT, Công nghệ thông tin là CT) ?');
    int chon;
    chon=int.parse(stdin.readLineSync());
    switch(chon){
      case 1:
        nhap();
        kiemTra();
        break;
      case 2:
        nhap();
        kiemTragt();
        break;
      case 3:
        nhap();
        kiemTrakhoa();
        break;
    }
  }
}
