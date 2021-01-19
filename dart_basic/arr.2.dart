import 'dart:io';


main()
{
  var arr = new arr_2(5);
  print(arr.sum());
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
  int sum()
  {
    int s=0;
    arr.forEach((element) {s=s+element;});
    return s;
  }
}