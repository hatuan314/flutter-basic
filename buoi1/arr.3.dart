import 'dart:io';
import 'dart:math';

main()
{
  var arr = new arr_3(5);
  arr.show_prime();
}

class arr_3
{
  int n;
  List<int> arr = new List.empty(growable : true);
  arr_3(this.n)
  {
    for(int i=0;i<n;i++)
    {
      stdout.write('arr[${i+1}] ');
      arr.add(int.parse(stdin.readLineSync()));
    }
  }
  arr_3.empty();
  bool isPrime(int m)
  {
    var l = sqrt(m);
    for(int i=l.toInt();i>=2;i--)
    {
      if(m%i==0)return false;
    }
    return true;
  }
  void show_prime()
  {
    stdout.write('so nguyen to : ');
    arr.forEach((element) {if(isPrime(element))stdout.write(element.toString()+' ');});
  }
}