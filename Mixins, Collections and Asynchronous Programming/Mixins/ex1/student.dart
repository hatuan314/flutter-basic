// Bài 1: Khởi tạo đối tượng Con người gồm các thuộc tính: Họ tên, năm sinh, quê quán, giới tính; Đối tượng
// Sinh viên kế thừa từ đối tượng Con người gồm các thuộc tính sau: Mã lớp, ngành học, khoá;
// Đối tượng Giảng viên kế thừa từ đối tượng con người gồm các thuộc tính sau: khoa, môn học, năm kinh nghiệm.
// Sau đó thực hiện các chức năng sau:
// 1. Nhập vào từ bàn phím thông tin của 1 học sinh và 1 giảng viên. Sau đó in ra màn hình thông tin của
// học sinh, giảng viên đó.
// 2. Nhập vào từ bàn phím thông tin của 1 học sinh và 1 giảng viên. Hỏi liệu học sinh đó có cơ hội học
// giảng viên đó không? (Biết rằng nếu ngành học của học sinh giống với khoa của giáo viên thì học sinh
// có cơ hội được học giảng viên đó).
// 3. Nhập vào từ bàn phím thông tin của 2 học sinh và 2 giảng viên. In ra màn hình thông tin của
// giảng viên và học sinh có giới tính là nữ.

import '../Mixin 1.dart';
import 'dart:io';
class students with humans {
  String ID;
  String major;
  String s_class;




  students(String name, int yob, String hometown, String gender, String ID, String major, String s_class) {
    this.name = name;
    this.yob = yob;
    this.hometown = hometown;
    this.gender = gender;
    this.ID = ID;
    this.major = major;
    this.s_class = s_class;
  }


  students.fromKeyboard() {
    super.input();
    print("ID");
    this.ID = stdin.readLineSync();
    print("Major?");
    this.major = stdin.readLineSync();
    print("Class?");
    this.s_class = stdin.readLineSync();
  }

  void display() {
    super.display();
    print("ID = ${this.ID}\nMajor = ${this.major}\nClass = ${this.s_class}");
  }
}