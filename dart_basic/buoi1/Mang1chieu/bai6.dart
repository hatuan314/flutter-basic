 import 'dart:io';

class bai6 {

  static void taomang(List a,int n){
  for(int i=0;i<n;i++){
print("a[${i}]=");
  a[i]=int.parse(stdin.readLineSync());
  }
  }
 static void xep(List a,int n)
  {
  int tmp;
  int tpq;
  for(int i=0;i<n-1;i++){
  for(int j=i+1;j<n;j++){
  if(a[i]<0){
  if(a[i]>a[j]){
  tmp=a[i];
  a[i]=a[j];
  a[j]=tmp;
  }
  }

  }
  }
  for(int i=0;i<n-1;i++)
  {
  for(int j=i+1;j<n;j++){
  if(a[i]<0){
  if(a[i]<a[j]){
  tpq=a[i];
  a[i]=a[j];
  a[j]=tpq;
  }
  }

  }
  }
  for(int i=0;i<n;i++){
  print(" ${a[i]}");
  }
  }
}

 void main() {
 int n;
 print("nhap n");
 n=int.parse(stdin.readLineSync());
List a=new List(n);
 bai6.taomang(a,n);
 bai6.xep(a,n);
 }