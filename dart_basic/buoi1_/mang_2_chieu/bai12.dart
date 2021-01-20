import 'Dart:math';
import 'Dart:io';
main() {
  Random rd = new Random();
  List<List<int>> a = [] ;
  taoMang(a);
  print('Mang A : ');
  inMang(a);
  List<List<int>> b = [] ;
  taoMang(b);
  print('Mang B : ');
  inMang(b);
  int m = a[0].length;
  int n= b[0].length;
  if(nghichDao(a, b, m, n))
    {
      print('la ma tran nghich dao');
    }
  else

    print('khong la ma tran nghich dao');
}
taoMang(List matrix)
{
  print('Nhap so dong : ');
  int n = int.parse(stdin.readLineSync());
  print('Nhap so cot : ');
  int m = int.parse(stdin.readLineSync());
  Random rd= new Random();
  for (var i = 0; i < n; i++) {
    List<int> list = [];
    for (var j = 0; j < m; j++) {
      int k=rd.nextInt(100);
      list.add(k);
    }
    matrix.add(list);
  }

}
inMang(List matrix)
{
  for(int i=0;i<matrix.length;i++)
  {
    print(matrix[i]);
  }
}

nhanMang(List a, List b, List c)
{
  int d=0;
  for (var i = 0; i < a.length; i++) {
    List<int> list = [];
    for (var j = 0; j < b.length; j++) {
      for (var k = 0; k < a.length; k++) {
        d += a[i][k] * b[k][j];
      }
      list.add(d);
    }
    c.add(list);
  }
}
bool nghichDao(List a, List b, int m, int n) {
  if (a.length == m && b.length == n) {
    List<List<int>> c = [];
    List<List<int>> d = [];
    nhanMang(a, b, c);
    nhanMang(b, a, d);
    int flag = 0;
    for (int i = 0; i < a.length; ++i) {
      for (int j = 0; j < n; ++j) {
        if (i == j) {
          if (c[i][j] == 1 && d[i][j] == 1)
            flag++;
        }
        else {
          if (c[i][j] == 0 && d[i][j] == 0)
            flag++;
        }
      }
    }
    if (flag != (a.length * m)) {
      return false;
    }
    else {
      return true;
    }
  }
  else
    return false;
}
