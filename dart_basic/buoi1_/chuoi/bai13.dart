//13. Nhập và từ bàn phím 1 chuỗi và 1 kí tự bất kì. Kiểm tra kí tự vừa nhập vào có thuộc chuỗi hay không?
// Và kí tự đó xuất hiện mấy lần trong chuỗi
import 'Dart:io';

main() {
  print('Nhap chuoi : ');
  var str = stdin.readLineSync();
  print('Nhap ki tu : ');
  var c = stdin.readLineSync();
  int count = 0;
  if (str.contains(c)) {
    for (int i = 0; i < str.length; i++) {
      if (str[i].compareTo(c) == 0) {
        count++;
      }
    }
    print('${c} xuat hien ${count} lan');
  } else {
    print('${c} khong ton tai trong chuoi ${str}');
  }
}
