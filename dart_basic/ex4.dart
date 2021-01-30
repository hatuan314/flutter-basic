// MẢNG 2 CHIỀU:
// 9. Nhập mảng 2 chiều các số nguyên có dạng ma trận 3x4. Liệt kê các phần tử là số nguyên tố trong có trong mảng.
// 10. Nhập mảng 2 chiều các số nguyên dương có dạng là ma trận 3x3. Sắp xếp lại các phần tử trong mảng theo thứ tự tăng dần.
// 11. Nhập và mảng A, B là mảng 2 chiều. Các phân tử trong mảng là các số nguyên. Tính A x B.
// 12. Nhập và mảng A, B là mảng 2 chiều. Các phân tử trong mảng là các số nguyên. B có phải là ma trận nghịch đảo của A hay không?
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

List<List<int>> matrixmultiplication(List<List<int>> a, List<List<int>> b) {
  //initialize matrix of appropriate size
  List<List<int>> c = [];
  for (int i = 0; i < a.length; i++) {
    List<int> c1 = [];
    for (int j = 0; j < b.elementAt(i).length; j++) {
      c1.add(0);
    }
    c.add(c1);
  }
  //I literally ripped this code from one of my older C project lol
  if (a.elementAt(0).length == b.length) {
    for (int i=0;i<a.length;i++) {
      for (int j = 0; j < b.elementAt(0).length; j++) {
        for (int l = 0; l < a.elementAt(0).length; l++) {
          c[i][j] = c[i][j] + a[i][l] * b[l][j];
        }
      }
    }
  }
  return c;
}

void checktranspose(List<List<int>> d, List<List<int>> e) {
  int row = d.length;
  int col = d.elementAt(0).length;
  List<List<int>> td = [];
  for (int i = 0; i < col; i++) {
    List<int> d1 = [];
    for (int j = 0; j < row; j++) {
      d1.add(d[j][i]);
    }
    td.add(d1);
  }
  // print(d);
  e.join('') == td.join('') ? print ("true"): print ("false");
}


main(){
  List<List<int>> a = inputmatrix();
  List<List<int>> b = inputmatrix();
  List<List<int>> c = matrixmultiplication(a, b);
  for (int i = 0; i < c.length; i++) {
    for (int j = 0; j < c.elementAt(i).length; j++) {
      stdout.write(c[i][j].toString() + " ");
    }
    print(" ");
  }
}