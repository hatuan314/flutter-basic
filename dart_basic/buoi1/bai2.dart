import 'dart:math';

bool checkNT(int a){
  if (a<=3) return true;
  else if (a % 2 == 0) return false;
  else{
    for (int i=3; i<=sqrt(a); i++)
      if (a%i==0) return false;
    return true;
  }
}

bool checkCP(int a){
  if (sqrt(a) - sqrt(a).floor() == 0) return true;
  return false;
}

main (){
  List matrix = [[1,2,3], [4,5,6], [7,8,9]];
  for (int i=0; i<matrix.length; i++)
    print(matrix[i]);

  for (int i=0; i<matrix.length; i++){
    print(matrix[i][i]);
  }

  for (int i=0; i<matrix.length; i++){
    print('so nguyen to hang ${i+1}');
    for (int j=0; j<matrix[i].length; j++){
      if (checkNT(matrix[i][j])) print(matrix[i][j]);
    }
  }

  for (List i in matrix){
    print(i);
  }
}