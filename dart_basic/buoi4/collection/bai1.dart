
import 'dart:math';

bool checkElement(int element){
  if (element <=0) return false;
  else if (element <=2) return true;
  else if (element %2 == 0) return false;
  else{
    for (int i=3; i<= sqrt(element); i++){
      if (element % i ==0) return false;
    }
    return true;
  }
}

List<int> sortList(List<int> arr_int){
  List<int> temp = new List<int>.from(arr_int);
  temp.sort();
  return temp;
}

void main(){
  Random rng = new Random();
  List<int> arr_int = new List();
  List<int> arr_element = new List();
  for (var i = 0; i < 20; i++) {
    int var_ = rng.nextInt(100);
    arr_int.add(var_);
    if (checkElement(var_))
      arr_element.add(var_);
  }
  print('danh sach so nguyen: $arr_int');
  print('danh sach so nguyen to: $arr_element');
  print('danh sach so nguyen sau khi sap xep: ${sortList(arr_int)}');

  int ran1 = rng.nextInt(20);
  int ran2 = rng.nextInt(100);
  arr_int[ran1] = ran2;

  print('thay the phan tu thu $ran1 bang $ran2: $arr_int');
}