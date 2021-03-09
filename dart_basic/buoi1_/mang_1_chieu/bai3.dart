import 'Dart:math';

main() {
  List a = [];
  taoMang(a);
  inMang(a);
  sntTrongHang(a);
}

taoMang(List a) {
  Random rd = new Random();
  for (int i = 0; i < 10; i++) {
    a.add(rd.nextInt(100));
  }
}

inMang(List a) {
  print(a);
}

int tinhTong(List a) {
  int sum = 0;
  for (int i = 0; i < 10; i++) {
    sum += a[i];
  }
  return sum;
}

bool soNguyenTo(int a) {
  if (a < 2) return false;
  if (a == 2) return true;
  for (int i = 2; i < a; i++) {
    if (a % i == 0) return false;
  }
  return true;
}

sntTrongHang(List a) {
  for (int i = 0; i < a.length; i++)
    if (soNguyenTo(a[i])) {
      print(a[i]);
    }
}
