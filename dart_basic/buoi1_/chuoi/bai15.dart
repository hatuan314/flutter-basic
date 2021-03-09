//15. Nhập vào từ bàn phím 1 chuỗi. Tạo menu với các chức năng sau:
// - Viết hoa toàn bộ chuỗi
// - Viết thường toàn bộ chuỗi
// - Thoát
import 'Dart:io';

main() {
  while (true) {
    print('Nhap chuoi : ');
    var str = stdin.readLineSync();
    print('1.Viet hoa toan bo chuoi');
    print('2.Viet thuong toan bo chuoi');
    print('3.Thoat');
    print('Nhap chuc nang : ');
    var c = int.parse(stdin.readLineSync());
    switch (c) {
      case 1:
        print('${str.toUpperCase()}');
        break;
      case 2:
        print('${str.toLowerCase()}');
        break;
      case 3:
        exit(0);
    }
  }
}
