import 'Dart:math';
main()
{
  List a=[];
  taoMang(a);
  inMang(a);
  print('Sum = ${tinhTong(a)}');
}
taoMang(List a)
{
  Random rd= new Random();
  for(int i=0;i<10;i++)
  {
    a.add(rd.nextInt(100));
  }
}
inMang(List a)
{
  print(a);
}

int tinhTong(List a)
{
  int sum=0;
  for(int i=0;i<10;i++)
  {
    sum+=a[i];
  }
  return sum;
}