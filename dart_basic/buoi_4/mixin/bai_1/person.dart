import '../Basic_Info.dart';

class Person with Basic_Info{
  String gender;

  @override
  String toString() {
    return 'Họ tên: $name, Năm sinh: $yearOfBirth, Quê quán: $address, Giới tính: $gender';
  }
}

