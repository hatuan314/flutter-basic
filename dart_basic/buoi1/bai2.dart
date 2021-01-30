import 'dart:math';

void main(){
  int n=2;
  List a =[List(2), List(2)];
  a[0][0]= 1;
  a[0][1]= 2;
  a[1][0]= 3;
  a[1][1]= 4;
  taoMang(n, a);
  print('Số Nguyên Tố:');
  soNguyento(n, a);
  print('so Chinh phuong');
  soChinhPhuong(n, a);
}
void taoMang(int n,List a){
  for(int i=0;i<n;i++){
    for(int j=0;j<n;j++){
      if(i==j){
        print('${a[i][j]}');
      }
    }
  }
}
void soNguyento(int n,List a){

  for(int i=0;i<n;i++){
    for(int j=0;j<n;j++){

      if(kiemTraSnt(a[i][j])){
        print('${a[i][j]}');
      }
    }
  }
}
void soChinhPhuong(int n,List a){
  for(int i=0;i<n;i++){
    for(int j=0;j<n;j++){
      if(kiemtraScp(a[i][j])){
        print('${a[i][j]}');
      }
    }
  }
}
bool kiemTraSnt(int snt){
  if(snt<2){
    return false;
  }
  for(int i=2;i<snt;i++){
    if(snt%2==0){
      return false;
    }
  }
  return true;
}
bool kiemtraScp(int scp){
  int soCp= sqrt(scp) as int;
  if(soCp*soCp==scp){
    return true;
  }
  return false;
}

