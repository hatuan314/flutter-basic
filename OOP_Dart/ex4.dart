// Bài 4: Khởi tạo đối tượng sinh viên KMA gồm các thuộc tính sau: Họ và tên, quê quán, năm sinh, mã khoa.
// Sau đó thực hiện các chức năng sau:
// 1. Nhập vào từ bàn phím thông tin của 1 sinh viên KMA. Kiểm tra xem sinh viên đó đã đủ 20+ hay chưa?
// 2. Nhập vào từ bàn phím thông tin của 1 sinh viên KMA. Kiểm tra xem sinh viên đó có phải là nữ hay không
// (Biết rằng nếu là nữ sẽ có từ "Thị" ở trong thuộc tính họ và tên)?
// 3. Nhập vào từ bàn phím thông tin của 1 sinh viên KMA. Kiểm tra xem sinh viên đó học khoa gì
// (Biết rằng An toàn thông tin có mã khoa là AT, Điện tử viễn thông là ĐT, Công nghệ thông tin là CT) ? ----------------


class Kma_Student {
  String name;
  String town;
  int year;
  String faculty;

  Kma_Student(this.name, this.town, this.year, this.faculty);

  bool twenty_check() {
    DateTime d = new DateTime.now();
    int a = d.year;
    if ((a - this.year) >= 20) {
      print("Equal or over 20");
      return true;
    }
    else {
      print("Under 20");
      return false;
    }
  }

  bool gender_check() {
    bool d = this.name.contains("Thị");
    if (d) print("female");
    else print("male");
    return d;
  }

  void return_faculty(String name) {
    if (this.name == name) {
      print(this.faculty);
    }
  }


}

main() {
  List<Kma_Student> d = [];
  d.add(new Kma_Student("Trương Quốc Quân", "Ha Noi", 2000, "CT"));
  d.add(new Kma_Student("Nguyễn Hải Nam", "Hai Duong", 2002, "AT"));
  d.add(new Kma_Student("Phạm Thị Dương", "Nam Dinh", 1990, "DT"));
  for (Kma_Student w in d) {
    bool d = w.twenty_check();
    w.return_faculty("Nam");
    w.gender_check();
  }

}