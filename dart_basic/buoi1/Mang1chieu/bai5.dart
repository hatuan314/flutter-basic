 import 'dart:io';

class bai5 {

   static void taomang(List a,int n){
  for(int i=0;i<n;i++){
  print("a[${i}]");
  a[i]=int.parse(stdin.readLineSync());
  }
  }
  static void kiemtra(List a,int n){
  int k;
  int j=0;
  print("nhap phan tu k");
  k=int.parse(stdin.readLineSync());
  if(k>n){
  print("nhap so nho hon n");
  }
  else{
  for(int i=0;i<n;i++){
  j=a[k];
  }
print("a[${k}]=${j}");
  }
  }
}
  void main() {
 int n;
 print("nhap n");
 n=int.parse(stdin.readLineSync());
List a=new List(n);
 bai5.taomang(a,n);
 bai5.kiemtra(a,n);
 }