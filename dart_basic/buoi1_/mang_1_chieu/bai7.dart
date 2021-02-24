import 'Dart:math';
main()
{
  List a=[];
  taoMang(a);
  inMang(a);
  print('Max = ${timMax(a)} o vi tri ${viTri(a, timMax(a))}');
  print('Min = ${timMin(a)} o vi tri ${viTri(a, timMin(a))}');
}
int viTri(List a, int n)
{
  for(int i=0;i<a.length;i++)
  {
    if(n==a[i])
      return i;
  }
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
int timMax(List a)
{
  int max=a[0];
  for(int i=0;i<a.length;i++)
  {
    if(a[i]>max)
    {
      max=a[i];
    }
  }
  return max;
}

int timMin(List a)
{
  int min=a[0];
  for(int i=0;i<6;i++)
  {
    if(a[i]<min)
    {
      min=a[i];
    }
  }
  return min;
}