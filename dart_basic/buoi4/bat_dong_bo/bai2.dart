
import 'dart:io';

import 'dart:math';

void main() async{
  print('nhap so a: ');
  int a = int.parse(stdin.readLineSync());

  print('nhap so b: ');
  int b = int.parse(stdin.readLineSync());

  print('doi 3s xu ly');
  await Future.delayed(Duration(seconds: 3));
  print('a + b = ${a+b}');

  print('doi 3s xu ly');
  await Future.delayed(Duration(seconds: 3));
  print('a - b = ${a-b}');

  print('doi 4s xu ly');
  await Future.delayed(Duration(seconds: 4));
  print('a * b = ${a*b}');

  print('doi 5s xu ly');
  await Future.delayed(Duration(seconds: 5));
  print('a ^ b = ${pow(a, b)}');
}