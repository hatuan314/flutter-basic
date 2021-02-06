import 'Str.dart';
import 'dart:io';
main(List<String> args) {
  stdout.write('nhap chuoi s : ');
  String s = stdin.readLineSync();
  stdout.write('nhap ky tu can tim : ');
  String c = stdin.readLineSync();
  print('so lan xuat hien cua $c trong $s la :'+Str.empty().count_number_of_char(s,c).toString());
}