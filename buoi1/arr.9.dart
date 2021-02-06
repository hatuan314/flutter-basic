import 'arr.3.dart';
import 'dart:io';
import 'Matrix.dart';

main(List<String> args) {
  int m = int.parse(stdin.readLineSync());
  int n = int.parse(stdin.readLineSync());
  var matrix = Matrix(m,n);
  stdout.write('cac phan tu la so nguyen to la : ');
  for(int i=0;i<m;i++)
  {
    for(int j=0;j<n;j++)
    {
      if(arr_3.empty().isPrime(matrix.getAt(i, j)))stdout.write(matrix.getAt(i, j).toString()+' ');
    }
  }
}