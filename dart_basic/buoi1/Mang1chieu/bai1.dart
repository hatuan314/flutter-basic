import 'dart:io';

class bai1 {
  static int n;
  static int xacnhan = 0;
static     List a = new List(100);
  static void nhapmang(List a, int n) {
    for (int i = 0; i < n; i++) {
      print('a[${i}]=');
      a[i] = int.parse(stdin.readLineSync());
    }
  }

  static void hienmang(List a, int n) {
    for (int i = 0; i < n; i++) {
      print('${a[i]}');
    }
  }

 static void tangdan(List a, int n) {
    int tmp;
    for (int i = 0; i < n - 1; i++) {
      for (int j = i + 1; j < n; j++) {
        if (a[i] > a[j]) {
          tmp = a[i];
          a[i] = a[j];
          a[j] = tmp;
        }
      }
    }
    print('Mang da sap xep la');
    for (int i = 0; i < n; i++) {
      print(' ${a[i]}');
    }
  }

  static void giamdan(List a, int n) {
    int tmp;
    for (int i = 0; i < n - 1; i++) {
      for (int j = i + 1; j < n; j++) {
        if (a[i] < a[j]) {
          tmp = a[i];
          a[i] = a[j];
          a[j] = tmp;
        }
      }
    }
    print('Mang da sap xep giam dan');
    for (int i = 0; i < n; i++) {
      print(' ${a[i]}');
    }
  }

 static void menu() {

    int chon;

    do {
      print("1.tao mang");
      print("2.sap xep mang theo thu tu tang dan");
      print("3.sap xep mang theo thu tu giam dan");
      print("4.thoat");
      print("---moi ban chon chuc nang");
      chon = int.parse(stdin.readLineSync());

      switch (chon) {
        case 1:
          xacnhan=1;
          n = int.parse(stdin.readLineSync());
          nhapmang(a, n);
          break;
        case 2:
          if (xacnhan == 0) {
            print("ban chua nhap mang");
          }
          else {
            tangdan(a, n);
          }
          break;
        case 3:
          if (xacnhan == 0) {
            print("ban chua nhap mang");
          } else {
            giamdan(a, n);
          }
          break;
      }
    } while (chon != 4);
  }


}
void main() {
  bai1.menu();
}