

 import 'dart:io';

void main() {
  int n;
  int a1=1;
  int b1=1;
  print("nhap n");
  n=int.parse(stdin.readLineSync());
  List a=new List(n);
  for(int i=1;i<=n;i++){
  a[i]=a1+b1;
  a1=b1;
  b1=a[i];
print("fibonacci la:${a[i]}");
  }
  }
