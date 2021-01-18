import 'Dart:math';
main() {
  List<List<int>> matrix = new List<List<int>>();
  taoMang(matrix);
  inMang(matrix);
  print('Cac so nguyen to trong mang  : ');
  sntTrongMang(matrix);
}
taoMang(List matrix)
{
  Random rd= new Random();
  for (var i = 0; i < 3; i++) {
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
  for(int i=0;i<3;i++)
  {
    print(matrix[i]);
  }
}
bool soNguyenTo(int a)
{
  if(a<2)
    return false;
  if(a==2)
    return true;
  for(int i=2;i<a;i++)
  {
    if(a%i==0)
      return false;
  }
  return true;
}
sntTrongMang(List matrix)
{
  for(int i=0;i<3;i++)
    for(int j=0;j<4;j++)
    if(soNguyenTo(matrix[i][j]))
    {
      print(matrix[i][j]);
    }
}
