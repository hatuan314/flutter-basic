

import 'dart:io';
void kiemTra(String chuoi,String kitu){
  int dem=0;
  
 var arr=chuoi.split("").elementAt(2);
  for(int i=0;i<chuoi.length;i++){
    if(kitu==chuoi.split("").elementAt(i)){
       dem++;
    }
  }
  if(dem==0){
    print('Kí Tự Nhập  Vào không có trong Chuỗi');
  }
  else {
    print('$dem');
  }
}
void main(){
String chuoi="";
var kitu;
print('Nhập Chuỗi');
  chuoi=stdin.readLineSync();
print('Nhập Ký Tự');
 kitu=stdin.readLineSync();
 while(kitu.toString().length>1){
   kitu=stdin.readLineSync();
 }
 kiemTra(chuoi, kitu);
}