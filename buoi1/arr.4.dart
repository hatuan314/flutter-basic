import 'dart:io';

main()
{
  var arr = new arr_2(5);
  stdout.write('nhap so can tim : ');
  int x=int.parse(stdin.readLineSync());
  if(arr.so_lan_xuat_hien(x)==0)
  {
    print('so khong co o trong chuoi');
  }
  else
  {
    print('so $x xuat hien ${arr.so_lan_xuat_hien(x)} trong mang');
  }
}

class arr_2
{
  int n;
  List<int> arr = new List.empty(growable : true);
  arr_2(this.n)
  {
    for(int i=0;i<n;i++)
    {
      stdout.write('arr[${i+1}] ');
      arr.add(int.parse(stdin.readLineSync()));
    }
  }
  int so_lan_xuat_hien(int x)
  {
    int c=0;
    arr.forEach((element){if(element==x)c++;});
    return c;
  }
  
  
}