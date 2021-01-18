import 'Dart:math';
import 'Dart:io';
//5. Sử dụng mảng 1 chiều nhập vào dãy số nguyên gồm n phần tử. Nhập 1 số nguyên dương k bất kì (k<n). In ra phần tử tại vị trí k trong mảng.

main()
{
List a=[];
taoMang(a);
inMang(a);
var k = int.parse(stdin.readLineSync());
print('Phan tu o vi tri ${k} la ${a[k]}');
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