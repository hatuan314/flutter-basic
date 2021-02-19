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



import '../Mixin 1.dart' show humans;
import 'dart:io';
import 'dart:core';

class lecturers with humans {
  String faculty;
  String subject;
  int yoe;

  lecturers(String name, int yob, String hometown, String gender, String faculty, String subject, int yoe) {
    this.name = name;
    this.yob = yob;
    this.hometown = hometown;
    this.gender = gender;
    this.faculty = faculty;
    this.subject = subject;
    this.yoe = yoe;
  }

  lecturers.fromKeyboard() {
    super.input();
    print("Faculty?");
    this.faculty = stdin.readLineSync();
    print("Subject?");
    this.subject = stdin.readLineSync();
    print("Years of experience?");
    this.yoe = int.parse(stdin.readLineSync());
  }

  void display() {
    super.display();
    print("Faculty = ${this.faculty}\nSubject = ${this.subject}\nYears of experience = ${this.yoe}");
  }
}

