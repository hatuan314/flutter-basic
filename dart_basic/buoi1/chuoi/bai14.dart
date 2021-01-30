import 'dart:io';

void main(){
  String chuoi1;
  print('nhập Chuỗi 1');
  chuoi1=stdin.readLineSync();
  String chuoi2;
  print('Nhap chuoi 2');
  chuoi2=stdin.readLineSync();
  print('Chuỗi Mới:${noiChuoi(chuoi1, chuoi2)}');
}
String noiChuoi(String chuoi1,String chuoi2){
  return chuoi1+chuoi2;
}