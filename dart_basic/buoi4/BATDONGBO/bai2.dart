import 'dart:io';

import 'dart:math';

Future<void> nhap() async {
  int a,b;
  print('Nhap a:');
  a=int.parse(stdin.readLineSync());
  print('Nhap b');
  b=int.parse(stdin.readLineSync());
 await Future.delayed(Duration(seconds: 3));
  print('Tong:${a+b}');
await  Future.delayed(Duration(seconds: 3));
  print('Hieu:${a-b}');
 await Future.delayed(Duration(seconds: 4));
  print('Tich:${a*b}');
  await  Future.delayed(Duration(seconds: 5));
  print('a^b:${pow(a,b)}');
}
void main(){
  nhap();
}