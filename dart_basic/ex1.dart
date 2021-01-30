// Bài 1: Nhập vào từ bàn phím mảng số nguyên gồm n phần tử. Sử dụng hàm để thực hiện các chức năng sau:
// - In ra màn hình giá trị MAX, MIN trong mảng số nguyên
// - In ra màn hình danh sách các số nguyên chẵn.
// - In ra màn hình danh sách các số nguyên chia hết cho cả 2 và 3.
// - In ra màn hình các số là ước của MAX trong mảng.
// - In ra màn hình các số là bội của MIN trong mảng.

int max(List<int> d) {
  var ret = d.elementAt(0);
  for (int c in d) {
    if (ret < c) {
      ret = c;
    }
}
  return ret;
}


int min(List<int> d) {
  var ret = d.elementAt(0);
  for (int c in d) {
    if (ret > c) {
      ret = c;
    }
  }
  return ret;
}


List<int> even(List<int> d) {
  var ret = <int>[];
  for (int i in d) {
    if (i % 2 == 0) {
      ret.add(i);
    }
  }
  return ret;
}

List<int> divby6(List<int> d) {
  var ret = <int>[];
  for (int i in d) {
    if (i % 6 == 0) {
      ret.add(i);
    }
  }
  return ret;
}


List<int> divisorofmax(List<int> d) {
  var ret = <int> [];
  var max1 = max(d);
  for (int i in d) {
    if (max1 % i == 0) {
      ret.add(i);
    }
  }
  return ret;
}

List<int> dividendofmin(List<int> d) {
  var ret = <int> [];
  var min1 = min(d);
  for (int i in d) {
    if (i % min1 == 0) {
      ret.add(i);
    }
  }
  return ret;
}