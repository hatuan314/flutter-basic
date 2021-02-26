import 'dart:convert';
import 'dart:io';

import 'person.dart';

class Student extends Person {
  String classID;
  String major;
  int academicYear;

  void import() {
    print('Nhập thông tin sinh viên ');
    print('Nhập họ tên : ');
    name = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    print('Nhập quê quán : ');
    address = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    print('Nhập giới tính : ');
    gender = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    print('Nhập năm sinh : ');
    yearOfBirth = int.parse(stdin.readLineSync());
    print('Nhập mã lớp : ');
    classID = stdin.readLineSync();
    print('Nhập chuyên ngành : ');
    major = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    print('Nhập khóa : ');
    academicYear = int.parse(stdin.readLineSync());
  }

  @override
  String toString() {
    return 'Sinh viên {'+super.toString()+', Mã lớp: $classID, Chuyên ngành: '
        '$major, Khóa: $academicYear}';
  }
}

