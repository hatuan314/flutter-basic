import 'dart:io';

main()
{
  var arr = new arr_2(10);
  arr.show();
}

class arr_2
{
  int n;
  List<int> n_arr = new List.empty(growable : true);
  List<int> p_arr = new List.empty(growable : true);
  arr_2(this.n)
  {
    for(int i=0;i<n;i++)
    {
      stdout.write('arr[${i+1}] ');
      int x = int.parse(stdin.readLineSync());
      if(x>=0)p_arr.add(x);else n_arr.add(x);
    }
  }
  void show()
  {
    p_arr.sort();
    n_arr.sort((a,b)=>-a.compareTo(b));
    stdout.write('chuoi so da duoc sap xep : ');
    p_arr.forEach((element){stdout.write(element.toString()+' ');});
    n_arr.forEach((element){stdout.write(element.toString()+' ');});
  }
  
  
  
}