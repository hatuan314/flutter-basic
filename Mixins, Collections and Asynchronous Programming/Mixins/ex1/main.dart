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

import '../ex1/student.dart';
import '../ex1/lecturer.dart';


bool ChanceToAttend(students a, lecturers b) {
  if(a.major == b.subject) {
    print("There exist a chance");
    return true;
  }
  else {
    print("There not exist a chance");
    return false;
  }
}

main(){
  //students a = new students.fromKeyboard();
  students b = new students("name", 2000, "hometown", "gender", "ID", "major", "s_class");
  //lecturers c = new lecturers.fromKeyboard();
  lecturers d = new lecturers("name", 2000, "hometown", "gender", "faculty", "major", 13);
  ChanceToAttend(b, d);
}
