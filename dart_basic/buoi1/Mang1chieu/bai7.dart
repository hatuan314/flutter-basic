 import 'dart:io';

class bai7 {

  static void taomang(List a,int n){
  for(int i=0;i<n;i++){
 print("a[${i}]=");
  a[i]=int.parse(stdin.readLineSync());
  }

  }
 static void solon(List a,int n){
  int max;
  max=a[0];
  int min;
  min=a[0];
  for(int i=0;i<n;i++){
  if(max<a[i]){
  max=a[i];
  }
  }
print("max=${max}");
  for(int i=0;i<n;i++){
  if(min>a[i]){
  min=a[i];
  }
  }
  print("min=${min}");
  }

}
  void main() {
 int n;
print("nhap n");
 n=int.parse(stdin.readLineSync());
 List a=new List(n);
 bai7.taomang(a,n);
 bai7.solon(a,n);
 }