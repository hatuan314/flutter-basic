//6. Sử dụng mảng 1 chiều nhập vào dãy số nguyên dương gồm n phần tử. Sắp xếp lại dãy số theo dạng, nửa đầu của dãy là các số nguyên dương theo thứ tự tăng dần,
//nửa sau của dãy là các số nguyên âm sắp xếp theo thứ tự giảm dần.
import 'Dart:math';

main() {
  List a = [];
  taoMang(a);
  inMang(a);
  List b = [];
  taoMangAm(a, b);
  xoaPhanTuAm(a);
  tangDan(a);
  giamDan(b);
  ghepMang(a, b);
  inMang(a);
}

taoMangAm(List a, List b) {
  int n = a.length;
  for (int i = 0; i < n; i++) {
    if (a[i] < 0) {
      b.add(a[i]);
    }
  }
}

xoaPhanTuAm(List a) {
  int n = a.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n; j++) {
      if (a[j] < 0) {
        a.removeAt(j);
        n--;
      }
    }
  }
}

ghepMang(List a, List b) {
  for (int j = 0; j < b.length; j++) {
    a.add(b[j]);
  }
}

taoMang(List a) {
  Random rd = new Random();
  for (int i = 0; i < 10; i++) {
    a.add(rd.nextInt(200) - 99);
  }
}

inMang(List a) {
  print(a);
}

tangDan(List a) {
  for (int i = 0; i < a.length - 1; i++) {
    for (int j = i + 1; j < a.length; j++) {
      if (a[i] > a[j]) {
        int tmp = a[i];
        a[i] = a[j];
        a[j] = tmp;
      }
    }
  }
}

giamDan(List a) {
  for (int i = 0; i < a.length - 1; i++) {
    for (int j = i + 1; j < a.length; j++) {
      if (a[i] < a[j]) {
        int tmp = a[i];
        a[i] = a[j];
        a[j] = tmp;
      }
    }
  }
}
