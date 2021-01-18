import 'Dart:math';
import 'Dart:io';
//4. Sử dụng mảng 1 chiều nhập vào dãy số nguyên gồm n phần tử.
// Nhập 1 số nguyên k bất kì. Kiểm tra k có thuộc mảng hay không và xuất hiện mấy lần trong mảng.
main()
{
  List a=[];
  taoMang(a);
  inMang(a);
  var k = int.parse(stdin.readLineSync());
  if(chuak(a, k))
  {
    print('${k} xuat hien ${kXuatHien(a,k)} lan');
  }
  else
  {
    print('${k} khong ton tai trong mang');
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
bool chuak(List a, int k)
{
  for(int i=0;i<10;i++)
  {
    if(a[i]==k)
      return true;
  }
  return false;
}
int kXuatHien(List a, int k)
{
  int count =0;
  for(int i=0;i<10;i++)
  {
    if(a[i]==k)
      count++;
  }
  return count;
}