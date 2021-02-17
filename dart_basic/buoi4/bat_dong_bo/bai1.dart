
import 'dart:io';

void main() async{
  print('nhap so a: ');
  int a = int.parse(stdin.readLineSync());
  print('nhap so b: ');
  int b = int.parse(stdin.readLineSync());
  print('doi 5s xu ly');
  await Future.delayed(Duration(seconds: 5));
  print('a + b = ${a+b}');
}