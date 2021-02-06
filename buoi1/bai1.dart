import 'dart:io';

main()
{
  stdout.write('nhap n : ');
  var a = new Bai1(int.parse(stdin.readLineSync()));
  print('min : '+a.MIN().toString());
  print('max : '+a.MAX().toString());
  a.chia_het_cho_2_va_3();
  a.uoc_cua_max();
  a.boi_cua_min();
}

class Bai1 {
  int n;
  List arr = new List.empty(growable: true);
  Bai1(this.n)
  {
    for(int i=1;i<=n;i++)
    {
      stdout.write('Arr[$i] = ');
      arr.add(int.parse(stdin.readLineSync(encoding: SystemEncoding())));
    }
  }
  Bai1.createArr(this.arr)
  {
    this.n=arr.length;
  }
  int MIN()
  {
    int min=arr[0];
    arr.forEach((element) {if(element<min)min=element;});
    return min;
  }
  int MAX()
  {
    int max=arr[0];
    arr.forEach((element) {if(element>max)max=element;});
    return max;
  }
  void chia_het_cho_2_va_3()
  {
    stdout.write('Cac so chia cho cho 2 va 3 : ');
    arr.forEach((element) {if(element%2==0 && element%3==0)stdout.write(element.toString()+' '); });
  }
  void uoc_cua_max()
  {
    int max=MAX();
    stdout.write('\nuoc cua max : ');
    arr.forEach((element) {if(max%element==0)stdout.write(element.toString()+' ');});
  }
  void boi_cua_min()
  {
    int min = MIN();
    stdout.write('\nboi cua min : ');
    arr.forEach((element) {if(element%element==0)stdout.write(element.toString()+' ');});
  }
  void show_arr()
  {
    
    if(arr.length>0)
    {
      print('['+arr[0].toString());
      arr.forEach((ele) =>{stdout.write(','+ele.toString())});
      stdout.write(']');
    }
    
  }
}