/*Bài 1: Nhập vào từ bàn phím 2 số nguyên bất kỳ. In ra màn hình tổng của 2 số đó sau 5 giây.*/

import 'dart:io';

Future<int> sum(int a, int b) async {
  await Future.delayed(Duration(seconds: 5));
  /// need time to process
  return a+b;
}

void main() async {
  print('Nhập 2 số:');
  int a = int.parse(stdin.readLineSync());
  int b = int.parse(stdin.readLineSync());
  int tong = await sum(a, b);
  print('Tổng = $tong');
}