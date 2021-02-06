import 'dart:io';
import 'Str.dart';
main(List<String> args) {
  stdout.write('nhap chuoi 1 : ');
  String s1 = stdin.readLineSync();
  stdout.write('nhap chuoi 2 : ');
  String s2 = stdin.readLineSync();
  print('chuoi da duoc noi'+Str.empty().concate(s1, s2));
}