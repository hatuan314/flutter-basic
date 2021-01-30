  import 'dart:io';

import 'dart:math';

class bai3 {

  static void taomang(List a,int n){
  for(int i=0;i<n;i++){
  print("a[${i}]=");
  a[i]=int.parse(stdin.readLineSync());
  }

  }
   static int kiemtra(int n){
    if(n<2){
      return 0;
    }
    else {
      for(int i=2;i<=sqrt(n);i++)
    {
    if(n%i==0){
    return 0;
    }

    }return 1;
  }
  }
   static void lietke(List a,int n){
  for(int i=0;i<n;i++){
  if(kiemtra(a[i])==1){
  print(" ${a[i]}");
  }

  }
  }

}
   void main() {

  int n;
  n=int.parse(stdin.readLineSync());
  List a=new List(n);
  bai3.taomang(a,n);
  bai3.lietke(a,n);

  }


