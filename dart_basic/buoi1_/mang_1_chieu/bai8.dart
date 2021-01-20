import 'Dart:io';
main()
{
  List a=[];
  var n = int.parse(stdin.readLineSync());
  taoMang(a,n);
  inMang(a);

}
taoMang(List a,int n)
{

  for(int i=0;i<n;i++)
  {
    if(i==0 || i==1)
    {
      a.add(1);
    }
    else
    {
      a.add(a[i-2]+a[i-1]);
    }
  }
}
inMang(List a)
{
  print(a);
}
