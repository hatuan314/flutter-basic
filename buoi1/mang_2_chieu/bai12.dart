import 'Dart:math';
main() {
  Random rd = new Random();
  List<List<int>> matrix = new List<List<int>>();
  taoMang(matrix);
  inMang(matrix);
}
taoMang(List matrix)
{
  Random rd= new Random();
  for (var i = 0; i < 4; i++) {
    List<int> list = new List<int>();

    for (var j = 0; j < 4; j++) {
      int k=rd.nextInt(100);
      list.add(k);
    }
    matrix.add(list);
  }
}
inMang(List matrix)
{
  for(int i=0;i<4;i++)
  {
    print(matrix[i]);
  }
}