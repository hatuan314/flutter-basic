import 'dart:io';

class bai10 {
   static List b=new List(100);
   static List<List<num>> a=new List.generate(3, (index) => new List(4));

   static void taomang(){
    for(int i=0;i<3;i++){
      for(int j=0;j<4;j++){
       print("a[$i}][$j]=");
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
  static void sapxep(){

    int k=0;
    for(int i=0;i<3;i++){
      for(int j=0;j<3;j++){
        b[k]=a[i][j];
        k++;
      }
    }
    int tmp;
    for(int i=0;i<3*3-1;i++){
      for(int j=i+1;j<3*3;j++){
        if(b[i]<b[j]){
          tmp=b[i];
          b[i]=b[j];
          b[j]=tmp;
        }
      }
    }
    for(int i=0;i<9;i++){
      if(i==3||i==6){
      print("\n");
      }
     print(" ${b[i]}");

    }
  }
}
void main() {

    bai10.taomang();
     bai10.sapxep();



}