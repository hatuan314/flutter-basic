import 'dart:convert';
import 'dart:io';

import 'person.dart';

class Teacher extends Person{
  String major;
  String subject;
  int experience;

  void import() {
    print('Nhập thông tin giảng viên ');
    print('Nhập họ tên : ');
    name = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    print('Nhập quê quán : ');
    address = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    print('Nhập giới tính : ');
    gender = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    print('Nhập năm sinh : ');
    yearOfBirth = int.parse(stdin.readLineSync());
    print('Nhập môn học : ');
    subject= stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    print('Nhập khoa : ');
    major = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    print('Nhập năm kinh nghiệm : ');
    experience = int.parse(stdin.readLineSync());
  }

  @override
  String toString() {
    return 'Teacher{'+super.toString()+', Khoa: $major, Môn học: $subject, Năm kinh nghiệm: $experience}';
  }
}