import 'Dart:math';
import 'Dart:io';
main()
{
  List a=[];
  taoMang(a);
  inMang(a);
  while(true) {
    print("1.Sap xep tang dan");
    print("2.Sap xep giam dan");
    var chon = int.parse(stdin.readLineSync());
    switch (chon) {
      case 1:
        tangDan(a);
        break;
      case 2:
        giamDan(a);
        break;
    }
    inMang(a);
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
giamDan(List a)
{
  for(int i=0;i<a.length-1;i++)
  {
    for(int j=i+1;j<a.length;j++)
    {
      if(a[i]<a[j])
      {
        int tmp=a[i];
        a[i]=a[j];
        a[j]=tmp;
      }
    }
  }
}