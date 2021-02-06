import 'Dart:math';
main() {
  Random rd = new Random();
  List<List<int>> matrix = [];
  List a=[];
  taoMang(matrix);
  inMang(matrix);
  saoChepMang(matrix, a);
  tangDan(a);
  chuyen1Thanh2(matrix, a);
  print('Mang da sap xep');
  inMang(matrix);
}
taoMang(List matrix)
{
  Random rd= new Random();
  for (var i = 0; i < 3; i++) {
    List<int> list = new List<int>();

    for (var j = 0; j < 3; j++) {
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
tangDan(List a)
{
  for(int i=0;i<a.length-1;i++)
  {
    for(int j=i+1;j<a.length;j++)
    {
      if(a[i]>a[j])
      {
        int tmp=a[i];
        a[i]=a[j];
        a[j]=tmp;
      }
    }
  }
}
saoChepMang(List matrix, List a)
{
  for(int i=0;i<3;i++)
  {
    for(int j=0;j<3;j++)
    {
      a.add(matrix[i][j]);
    }
  }
  matrix.clear();
}
chuyen1Thanh2(List matrix, List a) {
  int k = 0;
  for (var i = 0; i < 3; i++) {
    List<int> list = new List<int>();
    for (var j = 0; j < 3; j++) {
      list.add(a[k++]);
    }
    matrix.add(list);
  }
}