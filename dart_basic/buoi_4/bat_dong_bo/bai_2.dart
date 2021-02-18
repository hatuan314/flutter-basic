/*Bài 2: Nhập vào từ bàn phím 2 số nguyên a, b bất kỳ.
In ra màn hình tổng của 2 số a, b sau 3 giây.
Sau 3 giây tiếp theo in ra màn hình hiệu a - b.
Sau 4 giây tiếp theo in ra màn hình tích của 2 số a, b.
Sau 5 giây tiếp theo in ra màn hình giá trị của a^b.*/
import 'dart:io';

import 'dart:math';

Future<int> calculate(int a, int b) async {
  await Future.delayed(Duration(seconds: b));
  /// need time to process
  return a;
}

void main() async {
  print('Nhập 2 số:');
  int a = int.parse(stdin.readLineSync());
  int b = int.parse(stdin.readLineSync());
  print('$a + $b = ${await calculate(a+b, 3)}');
  print('$a - $b = ${await calculate(a-b, 3)}');
  print('$a * $b = ${await calculate(a*b, 4)}');
  print('$a ^ $b = ${await calculate(pow(a,b), 5)}');

}