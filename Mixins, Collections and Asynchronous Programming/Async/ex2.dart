//Bài 2: Nhập vào từ bàn phím 2 số nguyên a, b bất kỳ. In ra màn hình tổng của 2 số a, b sau 3 giây.
// Sau 3 giây tiếp theo in ra màn hình hiệu a - b.
// Sau 4 giây tiếp theo in ra màn hình tích của 2 số a, b.
// Sau 5 giây tiếp theo in ra màn hình giá trị của a^b.

import 'dart:async';
import 'dart:io';

import 'dart:math';

Future<void> input(int a, int b) async {
  await Future.delayed(Duration(seconds: 3));
  print(a + b);
  await Future.delayed(Duration(seconds: 3));
  print(a - b);
  await Future.delayed(Duration(seconds: 4));
  print(a * b);
  await Future.delayed(Duration(seconds: 5));
  print(pow(a, b));
}

main() {
  print("Insert a?");
  int a = int.parse(stdin.readLineSync());
  print("Insert b?");
  int b = int.parse(stdin.readLineSync());
  input(a, b);
}