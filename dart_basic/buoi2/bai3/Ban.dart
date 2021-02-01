import 'dart:io';

import 'package:untitled8/buoi2/bai3/ThuocTinh.dart';

class Ban{
  Thuoctinh t=new Thuoctinh();
  void nhap(){
    print('Ma San Pham');
    t.maSp=stdin.readLineSync();
    print('Ten San Pham');
    t.tenSp=stdin.readLineSync();
    print('giá Mua Vào');
    t.giaMua=double.parse(stdin.readLineSync());
    print('Giá Bán Ra');
    t.giaBan=double.parse(stdin.readLineSync());
    print('Số Lượng');
    t.soSp=int.parse(stdin.readLineSync());
  }
  double banHet(){
    return (t.giaBan-t.giaMua)*t.soSp;
  }
  double ban23(){
    double a=(t.giaBan-t.giaMua)*((t.soSp)*(2/3));
    double b=t.soSp*(1/3)*t.giaMua;
    return a-b;
  }
}
void main(){
  Ban t=new Ban();
  t.nhap();
  print('Bán Hết lãi ${t.banHet()}');
  if(t.ban23()>0){
    print('Bán 2/3 lãi  ${t.ban23()}');
  }
  else if(t.ban23()==0){
    print('hòa');
  }
  else{
    print('Lỗ ${t.ban23()}');
  }
}