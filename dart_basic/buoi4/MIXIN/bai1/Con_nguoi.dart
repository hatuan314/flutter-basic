import 'dart:io';

import '../Hoc_Sinh.dart';

class conNguoi with hocSinh{
  String gioiTinh;
 void nhap(){
   nhapMixin();
   print('Nhap Gioi Tinh');
   gioiTinh=stdin.readLineSync();
  }
  @override
  String toString() {
    return 'Ho Ten:$hoTen,Nam Sinh:$namSinh,Que Quan:$queQuan ,gioiTinh: $gioiTinh';
  }
}