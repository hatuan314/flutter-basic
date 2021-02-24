//Bài 1: Nhập vào từ bàn phím 2 số nguyên bất kỳ. In ra màn hình tổng của 2 số đó sau 5 giây.

import 'dart:async';
import 'dart:io';

Future<void> input(int a, int b) async {
  await Future.delayed(Duration(seconds: 5));
  print(a + b);
}

main() {
  print("Insert a?");
  int a = int.parse(stdin.readLineSync());
  print("Insert b?");
  int b = int.parse(stdin.readLineSync());
  input(a, b);
}