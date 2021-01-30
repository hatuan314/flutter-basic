 import 'dart:io';

import 'dart:math';

class bai9 {
 static List<List<num>> a= new List.generate(3, (i) => new List(4));
   static void taomang(){
    for(int i=0;i<3;i++){
      for(int j=0;j<4;j++){
        print("a[${i}][${j}]=");
        a[i][j]=int.parse(stdin.readLineSync());
      }
    }

  }
  static void hien(){
    for(int i=0;i<3;i++){

      for(int j=0;j<4;j++){
       print(" ${a[i][j]}");
      }
     print("\n");
    }
  }
   static int kiemtra(int n){
    if(n<2)
    {
      return 0;
    }
    else {
      for(int i=2;i<=sqrt(n);i++){
    if(n%i==0){
    return 0;
    }
    }
    return 1;
  }
  }
   static void lietke(){
    for(int i=0;i<3;i++){
      for(int j=0;j<4;j++){
        if(kiemtra(a[i][j])==1){
         print(" ${a[i][j]}");
        }
      }
    }
  }

}
 void main() {

   bai9.taomang();
   bai9.hien();
   print('SNT');
  bai9.lietke();

}
 //bai9.taomang();




