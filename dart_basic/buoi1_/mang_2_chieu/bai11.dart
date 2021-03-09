import 'Dart:math';

main() {
  Random rd = new Random();
  List<List<int>> a = [];
  taoMang(a);
  print('Mang A : ');
  inMang(a);
  List<List<int>> b = [];
  taoMang(b);
  print('Mang B : ');
  inMang(b);
  List<List<int>> c = [];
  print('Mang C : ');
  nhanMang(a, b, c);
  inMang(c);
}

taoMang(List matrix) {
  Random rd = new Random();
  for (var i = 0; i < 4; i++) {
    List<int> list = [];
    for (var j = 0; j < 4; j++) {
      int k = rd.nextInt(10);
      list.add(k);
    }
    matrix.add(list);
  }
}

inMang(List matrix) {
  for (int i = 0; i < 4; i++) {
    print(matrix[i]);
  }
}

nhanMang(List a, List b, List c) {
  int d = 0;
  for (var i = 0; i < 4; i++) {
    List<int> list = [];
    for (var j = 0; j < 4; j++) {
      for (var k = 0; k < 4; k++) {
        d += a[i][k] * b[k][j];
      }
      list.add(d);
    }
    c.add(list);
  }
}
