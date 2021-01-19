import 'dart:io';
import 'dart:math';

main()
{
  var arr = new arr_2(5);
  arr.show_prime();
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