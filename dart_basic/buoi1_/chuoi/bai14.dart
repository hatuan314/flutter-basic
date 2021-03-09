//14. Nhập vào từ bàn phím 2 chuỗi. Tiến hành nối 2 chuỗi trên thành 1 chuỗi mới
import 'Dart:io';

main() {
  print('Nhap chuoi 1 : ');
  var str = stdin.readLineSync();
  print('Nhap chuoi 2 : ');
  var str2 = stdin.readLineSync();
  print('chuoi sau khi noi ${str + str2}');
}
