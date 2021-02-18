import 'Dart:math';
import 'Dart:io';
/*Bài 1: Sử dụng thư viện random để lấy ra danh sách gồm 20 số nguyên. và thức hiện các chức năng sau:
1. Hiển thị ra danh sách 20 số nguyên
2. Tìm và tạo danh sách các số nguyên tố từ danh sách các số nguyên trên
3. Sắp xếp lại danh sách theo thứ tự tăng dần.
4. Tiến hành thay thế 1 phần tử bất kì trong danh sách bằng 1 phần tử khác sử dụng thư viện Random.
*/
void main()
{
  List a=[];
  create(a);
  while(true) {
    menu();
    var chon = int.parse(stdin.readLineSync());
    switch (chon) {
      case 1:
        display(a);
        break;
      case 2:
        List b = listOfPrimeNumber(a);
        display(b);
        break;
      case 3:
        sort(a);
        display(a);
        break;
      case 4:
        display(a);
        randomReplace(a);
        display(a);
        break;
    }

  }
}
void create(List a)
{
  Random rd= Random();
  for(int i=0;i<20;i++)
  {
    a.add(rd.nextInt(100));
  }
}
void display(List a)
{
  print(a);
}
void sort(List a)
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
bool primeNumber(int a)
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
List<int> listOfPrimeNumber(List a) {
  List <int> b = [];
  for (int i = 0; i < a.length; i++)
    if (primeNumber(a[i])) {
      b.add(a[i]);
    }
  return b;
}
void menu(){
    print('1. Hiển thị ra danh sách 20 số nguyên');
    print('2. Tìm và tạo danh sách các số nguyên tố từ danh sách các số nguyên trên');
      print('3. Sắp xếp lại danh sách theo thứ tự tăng dần.');
      print('4. Tiến hành thay thế 1 phần tử bất kì trong danh sách bằng 1 phần tử khác ');
}
void randomReplace(List a)
{
  Random rd= Random();
  int i = rd.nextInt(20);
  a[i]= rd.nextInt(100);
}