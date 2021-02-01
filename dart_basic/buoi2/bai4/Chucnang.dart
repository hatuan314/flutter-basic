import 'dart:io';

import 'package:untitled8/buoi2/bai4/ThuocTinh.dart';

class Chucnang {
  var t = new thuocTinh();

  void nhap() {
    print('Họ và Tên');
    t.hoTen = stdin.readLineSync();
    print('Quê Quán');
    t.queQuan = stdin.readLineSync();
    print('Năm Sinh');
    t.namSinh = int.parse(stdin.readLineSync());
    print('Mã Khoa');
    t.maKhoa = stdin.readLineSync();
  }

  void tuoi() {
    if (2021 - t.namSinh < 20) {
      print('Thanh niên Chủa đủ tuổi 20');
    }
    else {
      print('Đã đủ 20 tuổi');
    }
  }

  String gioiTinh() {
    if (t.hoTen.toLowerCase().contains("thi")) {
      return "nữ";
    }
    else {
      return 'Nam';
    }
  }
  void khoa(){
    if(t.maKhoa.toLowerCase().contains("at")){
      print('AN toàn Thông tin');
    }
    if(t.maKhoa.toLowerCase().contains("dt")){
      print('Điện Tủ Viễn Thông');
    }
    if(t.maKhoa.toLowerCase().contains("ct")){
      print('công nghệ Thông tin');
    }
  }
}
void main(){
  Chucnang t=new Chucnang();
  t.nhap();
  print('${t.gioiTinh()}');
  t.tuoi();
  t.khoa();
}