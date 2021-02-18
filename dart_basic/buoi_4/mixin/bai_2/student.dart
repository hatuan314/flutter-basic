import 'dart:convert';
import 'dart:io';
import '../Basic_Info.dart';

class Student with Basic_Info {
  String faculty;

  void import() {
    print('Nhập họ tên: ');
    name = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    print('Nhập quê quán: ');
    address = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    print('Nhập năm sinh: ');
    yearOfBirth = int.parse(stdin.readLineSync());
    print('Nhập mã khoa: ');
    faculty = stdin.readLineSync();
  }

  @override
  String toString() {
    return 'SinhVien{Họ tên: $name, Quê quán: $address, Năm sinh: $yearOfBirth, Mã khoa: $faculty}';
  }

  bool isOver20() {
    if (DateTime.now().year - yearOfBirth > 20) return true;
    return false;
  }
  bool isFemale() {
    bool gender = false;
    List<String> n= name.split(" ");
    for(int i=1; i<n.length-1; i++){
      if(n[i].toLowerCase() == 'thị')
        return true;
    }
    return false;
  }
  String tenKhoa() {
    faculty = faculty.toUpperCase();
    if (faculty.contains('AT')) return 'An toàn thông tin';
    if (faculty.contains('CT')) return 'Công nghệ thông tin';
    if (faculty.contains('DT')) return 'Điện tử viễn thông';
    return 'Mã không hợp lệ';
  }
}