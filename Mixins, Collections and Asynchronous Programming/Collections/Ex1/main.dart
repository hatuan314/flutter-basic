// Bài 1: Sử dụng thư viện random để lấy ra danh sách gồm 20 số nguyên. và thức hiện các chức năng sau:
// 1. Hiển thị ra danh sách 20 số nguyên
// 2. Tìm và tạo danh sách các số nguyên tố từ danh sách các số nguyên trên
// 3. Sắp xếp lại danh sách theo thứ tự tăng dần.
// 4. Tiến hành thay thế 1 phần tử bất kì trong danh sách bằng 1 phần tử khác sử dụng thư viện Random.




import 'dart:io';
import 'dart:math';
import 'dart:collection';

List<int> generate_array_of_20_numbers() {
  Random r = new Random();
  List<int> d = [];
  for (int i = 0; i < 20; i++) {
    int q = r.nextInt(100);
    d.add(q);
  }
  return d;
}

void display(List<int> d) {
  for (int i in d) {
    print(i);
  }
}

List<int> spawnprime(List<int> q) {
  List<int> d = [];
  for (int n in q) {
    bool flag = false;
  for(int i = 2; i <= n/2; i++)
  {
    if(n % i == 0)
    {
      //print("${n} NOT prime");
      flag = true;
      break;
    }
  }
  if(flag == false)
    {
      //print("${n} Prime");
      d.add(n);
    }
  }
  return d;
}

void replace (List<int> d, int e) {
  Random r = new Random();
  for (int i = 0; i < d.length; i++) {
    if (d.elementAt(i) == e) {
      d[i] = r.nextInt(100);
    }
  }
}

void sortascend(List<int> d) {
  int temp;
  int i, j;
  for (i = 0; i < d.length; i++) {
    for (j = 0; j < d.length; j++) {
      if (d[i] < d[j]) {
        temp = d[i];
        d[i] = d[j];
        d[j] = temp;
      }
    }
  }
}


main() {
  List<int> d = generate_array_of_20_numbers();
  // display(d);
  var q = spawnprime(d);
  display(q);
}