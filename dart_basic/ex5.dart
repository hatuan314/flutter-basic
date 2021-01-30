// CHUỖI:
// 13. Nhập và từ bàn phím 1 chuỗi và 1 kí tự bất kì. Kiểm tra kí tự vừa nhập vào có thuộc chuỗi hay không? Và kí tự đó xuất hiện mấy lần trong chuỗi
// 14. Nhập vào từ bàn phím 2 chuỗi. Tiến hành nối 2 chuỗi trên thành 1 chuỗi mới
// 15. Nhập vào từ bàn phím 1 chuỗi. Tạo menu với các chức năng sau:
// - Viết hoa toàn bộ chuỗi
// - Viết thường toàn bộ chuỗi
// - Thoát

import 'dart:io';
void checkandcount(String s, String c) {
  int count = 0;
  for (int i = 0; i < s.length; i++) {
    if(s[i] == c) {
      count++;
    }
  }
  if (count == 0) {
    print(c + ' is not in here');
  }
  else print("Yes, ${c} occurs ${count} time(s) in ${s}");
}

void concat (String s, String q) {
  String r = s + q;
  print(r);
}

int menu (String s) {
  print("Select 1 to UPPERCASE your string\nSelect 2 to lowercase your string\nSelect 3 to exit the programs");
  num i = int.parse(stdin.readLineSync()) as num;
  switch (i) {
    case 1: {
      print(s.toUpperCase());
      break;
    }
    case 2: {
      print(s.toUpperCase());
      break;
    }
    case 3:
      return 0;
  }
}