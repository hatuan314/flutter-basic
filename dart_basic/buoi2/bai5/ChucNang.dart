import 'dart:io';

import 'package:untitled8/buoi2/bai5/ThuocTinh.dart';

class Chucnang{
  int a,b,c;
  var t=new Thuoctinh();
  void nhap() {
    print('Tên sản Phẩm');
    t.tenSp = stdin.readLineSync();
    print('so Luong');
    t.soLuong = int.parse(stdin.readLineSync());
    print('Giá Nhập Vào');
    t.giaMua = double.parse(stdin.readLineSync());
    print('Giá Bán Ra');
    t.giaBan = double.parse(stdin.readLineSync());
    print('Ngày Nhâp');
    a = int.parse(stdin.readLineSync());
    print('Tháng Nhâpl');
    b = int.parse(stdin.readLineSync());
    print('năm Nhập');
    c = int.parse(stdin.readLineSync());
    print('Hạn Sủ Dụng(Tháng)');
    t.hanSd = int.parse(stdin.readLineSync());
  }
    void In(){
      print('Tên Sản Phẩm ${t.tenSp}');
      print('Số Lương ${t.soLuong}');
      print('Giá Nhập Vào ${t.giaMua}');
      print('Giá Bán Ra ${t.giaBan}');
      print('Ngày Nhập $a/$b/$c');
      print('Hạn Sủ Dụng ${t.hanSd} tháng');
    }
    double tongTienhang(){
      return t.giaMua*t.soLuong;
    }

}
void main(){
  Chucnang t=new Chucnang();
  t.nhap();
  t.In();
  print('Tổng Tiền hàng ${t.tongTienhang()}');
}