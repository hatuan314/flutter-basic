// Bài 2: Tạo 1 đối tượng sinh viên với các thuộc tính: - mã sinh viên - tên sinh viên - quê quán - điểm thi
// môn toán cao cấp A1 - điểm thi môn toán cao cấp A3 - điểm môn nguyên lí
// 1 Tính điểm trung bình của sinh viên đó. l và kiểm tra xem sinh viên đó phải đóng bao nhiêu tiền thi lại
// ( biết thi lại 1 môn là 90k).


class KmaStudent {
  String ID;
  String name;
  String hometown;
  double a1;
  double a3;
  double nl;

  KmaStudent(this.ID, this.name, this.hometown, this.a1, this.a3, this.nl);

  double Average () {
    return (this.a1 + this.a3 + this.nl)/3;
  }

  double Retest() {
    double d = 0;
    if (this.nl < 4.0) {
      d = d + 90000;
    }
    if (this.a1 < 4.0) {
      d = d + 90000;
    }
    if (this.a3 < 4.0) {
      d = d + 90000;
    }
    return d;
  }

}