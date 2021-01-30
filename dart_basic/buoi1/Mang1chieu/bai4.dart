 import 'dart:io';

import 'bai3.dart';

class bai4 {

   static void taomang(List a,int n){
  for(int i=0;i<n;i++){
  print("a[${i}]");
  a[i]=int.parse(stdin.readLineSync());
  }
  }
   static void kiemtra(List a,int n){
  int k;
 print("nhap phan tu k");
  k=int.parse(stdin.readLineSync());
  if(k>n){
  print("nhap so nho hon n");
  }
  else{
  for(int i=0;i<n;i++){
print("a[${k}]=${a[k]}");
  }
  }
  }

}
  void main() {
 int n;
 print("nhap n");
 n=int.parse(stdin.readLineSync());
 List a=new List(n);
 bai4.taomang(a,n);
 bai4.kiemtra(a,n);

 }