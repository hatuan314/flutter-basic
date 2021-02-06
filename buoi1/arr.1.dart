import 'dart:io';

main()
{
  var arr = new arr_1(5);
  arr.sort(true);
  arr.show();
  arr.sort(false);
  arr.show();
}

class arr_1
{
  int n;
  List<int> arr = new List.empty(growable : true);
  arr_1(this.n)
  {
    for(int i=0;i<n;i++)
    {
      stdout.write('arr[${i+1}]');
      arr.add(int.parse(stdin.readLineSync()));
    }
  }
  void sort(bool inc)
  {
    switch(inc)
    {
      case true: 
        arr.sort();
        break;
      case false:
        arr.sort((a,b)=>-a.compareTo(b));
    }
  }
  void show()
  {
    stdout.write(' arr = ');
    arr.forEach((element) {stdout.write(element.toString()+' ');});
  }
}