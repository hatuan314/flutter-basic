import 'dart:io';

import 'package:untitled8/buoi2/bai1/ChucNang.dart';
import 'package:untitled8/buoi2/bai2/Thuoc_Tinh.dart';

class Nhap{
  var t=new Thuoctinh();
  void nhapSv(){
    print('Ma Sinh Vien');
       t.maSv=stdin.readLineSync();
    print('Ten Sinh vien');
    t.tenSv=stdin.readLineSync();
    print('Que Quan');
    t.tenSv=stdin.readLineSync();
    print('Toán A1');
    t.toanA1=double.parse(stdin.readLineSync());
    print('Toán A3');
    t.toanA3=double.parse(stdin.readLineSync());
    print('Nguyen Li 1');
    t.nguyenLi1=double.parse(stdin.readLineSync());
  }
  double diemTb(){
    return (t.nguyenLi1+t.toanA3+t.toanA1)/3;
  }
  int tinhTien(){
    int kiemtra=0;
    for(int i=0;i<1;i++){
  if(t.toanA1<4){
    kiemtra++;
  }
  if(t.toanA3<4){
    kiemtra++;
  }
  if(t.nguyenLi1<4){
    kiemtra++;
  }
    }
    return kiemtra*90;
  }
}
void main(){
  Nhap t=new Nhap();
  t.nhapSv();
  print('Điểm Trung Bình ${t.diemTb()}');
  print('Tiền Thi Lại ${t.tinhTien()}');
}