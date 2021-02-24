// Nhập vào từ bàn phím ma trận số nguyên m*n (m,n là 2 số nguyên dương nhập vào từ bàn phím). Sử dụng hàm để thực hiện các chức năng sau:
// - In ra màn hình các phần tử thuộc đường chéo chính.
// - In ra màn hình danh sách số nguyên tố của 1 hàng bất kỳ trong mảng ban đầu
// - In ra màn hình danh sách các số chính phương của 1 cột bất kỳ trong mảng ban đầu.
// - Tính tổng các số phần tử trên 1 hàng bất kỳ thuộc mảng.
import 'dart:io';
import 'dart:math';

List<List<int>> inputmatrix() {
  print("Please insert the number of rows of this matrix?"); int k = int.parse(stdin.readLineSync());
  print("Please insert the number of column of this matrix?"); int q = int.parse(stdin.readLineSync());
  List<List<int>> d = [];
  for (var i = 0; i < k; i++) {
    List<int> d1 = [];
    for (var j = 0; j < q; j++) {
      print("Please insert element [${i + 1},${j + 1}]");
      int a = int.parse(stdin.readLineSync());
      d1.add(a);
    }
    d.add(d1);
  }
  return d;
}

void printmdiagonal(List<List<int>> d) {
  for (int i = 0; i < d.length; i++) {
    for (int j = 0; j < d.elementAt(i).length; j++) {
      if (i == j) {
        print(d.elementAt(i).elementAt(j));
      }
    }
  }
}

void checkprime(int n) {
  bool flag = false;
  for(int i = 2; i <= n/2; i++)
  {
    if(n % i == 0)
    {
      print("${n} NOT prime");
      flag = true;
      break;
    }
  }
  if(flag == false)
    print("${n} Prime");
}

void printprime(List<List<int>> d) {
  for (var i = 0; i < d.length; i++) {
    for (var j = 0; j < d.elementAt(i).length; j++) {
      checkprime(d.elementAt(i).elementAt(j));
    }
  }
}

void sqno(List<List<int>> d) {
  for (var i = 0; i < d.length; i++) {
    for (var j = 0; j < d.elementAt(i).length; j++) {
      int check = (sqrt(d.elementAt(i).elementAt(j))).round();
      if(check*check == d.elementAt(i).elementAt(j)) {
        print("${d.elementAt(i).elementAt(j)} is a square number");
      }
      else print("${d.elementAt(i).elementAt(j)} is NOT a square number");
    }
  }
}

void sumofaline(List<List<int>> d){
  int sum = 0;
  for (var i = 0; i < d.length; i++) {
    for (var j = 0; j < d.elementAt(i).length; j++) {
      sum = sum + d.elementAt(i).elementAt(j);
    }
    break;
  }
  print(sum);
}

main() {
  List<int> a = [4,21,31];
  List<int> b = [41,51,61];
  List<int> c = [71,81,91];
  //List<List<int>> d = [a, b, c];
  List<List<int>> d = inputmatrix();
  printprime(d);
}