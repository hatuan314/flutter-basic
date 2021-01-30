// MẢNG 1 CHIỀU:
// 1. Sử dụng mảng 1 chiều nhập vào dãy số nguyên gồm n phần tử. Sắp xếp các phần tử theo thứ tự tăng dần, giảm dần ( Sử dụng switch...case).
// 2. Sử dụng mảng 1 chiều nhập vào dãy số nguyên gồm n phần tử. Tính tổng các phần tử thuộc mảng.
// 3. Sử dụng mảng 1 chiều nhập vào dãy số nguyên gồm n phần tử. In ra màn hình mảng các phần tử là số nguyên tố.
// 4. Sử dụng mảng 1 chiều nhập vào dãy số nguyên gồm n phần tử. Nhập 1 số nguyên k bất kì. Kiểm tra k có thuộc mảng hay không và xuất hiện mấy lần trong mảng.
// 5. Sử dụng mảng 1 chiều nhập vào dãy số nguyên gồm n phần tử. Nhập 1 số nguyên dương k bất kì (k<n). In ra phần tử tại vị trí k trong mảng.
// 6. Sử dụng mảng 1 chiều nhập vào dãy số nguyên dương gồm n phần tử. Sắp xếp lại dãy số theo dạng, nửa đầu của dãy là các số nguyên dương theo thứ tự tăng dần, nửa sau của dãy là các số nguyên âm sắp xếp theo thứ tự giảm dần.
// INPUT: -3, 4, 6, -5, 3, 8, -2, -1
// OUTPUT: 3, 4, 6, 8, -1, -2, -3, -5
// 7. Sử dụng mảng 1 chiều nhập vào dãy số nguyên gồm n phần tử. In ra phần tử MAX, MIN và số thứ tự của chúng trong dãy.
// 8. Sử dụng mảng 1 chiều in ra dãy số Fibonasi với n phần tử (n>0 )

import 'dart:io';
void sortascend(List<double> d) {
  double temp;
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
  for (i = 0; i < d.length; i++) {
    print(d.elementAt(i));
  }
}

void sortdescend(List<double> d) {
  double temp;
  int i, j;
  for (i = 0; i < d.length; i++) {
    for (j = 0; j < d.length; j++) {
      if (d[i] > d[j]) {
        temp = d[i];
        d[i] = d[j];
        d[j] = temp;
      }
    }
  }
  for (i = 0; i < d.length; i++) {
    print(d.elementAt(i));
  }
}

void checkprime(int n) {
  bool flag = false;
  for(int i = 2; i <= n/2; i++)
  {
    if(n % i == 0)
    {
      print("${n} NOT prime");
      flag = true;
      break;
    }
  }
  if(flag == false)
    print("${n} Prime");
}

void printprime(List<int> d) {
  for (int i in d) {
    checkprime(i);
  }
}

void occurance(List<int> d, int o) {
  int count = 0;
  for (int i in d) {
    if (i == o) {
      count = count + 1;
    }
  }
  print(count);
}

void printat(List<int> d, int m) {
  print(d.elementAt(m));
}

void _2wayarrange(List<int> d) {
  List<int> positive = []; List<int> negative = [];
  for (int i in d) {
    if (i >= 0) positive.add(i);
    else negative.add(i);
  }
  positive.sort();
  negative.sort();
  negative = (negative.reversed).toList();
  d.remove(true);
  d = positive + negative;
  for (int i in d) {
    stdout.write("${i}, ");
  }
}

void fibo(int n) {
  List<int> arr = [1,1];
  stdout.write("${arr[0]}, ");
  stdout.write("${arr[1]}, ");
  for(int i=0;i<n;i++)
  {
    int m = arr[0]+arr[1];
    arr[0]=arr[1];
    arr[1]=m;
    stdout.write("${m}, ");
  }
}

main() {
  List<int> d = [-3, 4, 6, -5, 3, 8, -2, -1];
  fibo(3);
}