import 'dart:io';

class SinhVien {
  String _hoTen;
  String _queQuan;
  int _namSinh;
  String _maKhoa;

  String get hoTen => _hoTen;

  set hoTen(String value) {
    _hoTen = value;
  }

  String get queQuan => _queQuan;

  String get maKhoa => _maKhoa;

  set maKhoa(String value) {
    _maKhoa = value;
  }

  int get namSinh => _namSinh;

  set namSinh(int value) {
    _namSinh = value;
  }

  set queQuan(String value) {
    _queQuan = value;
  }

  void nhap() {
    print('Nhập họ tên: ');
    hoTen = stdin.readLineSync();
    print('Nhập quê quán: ');
    queQuan = stdin.readLineSync();
    print('Nhập năm sinh: ');
    namSinh = int.parse(stdin.readLineSync());
    print('Nhập mã khoa: ');
    maKhoa = stdin.readLineSync();
    //print(this.toString());
  }

  @override
  String toString() {
    return 'SinhVien{_hoTen: $_hoTen, _queQuan: $_queQuan, _namSinh: $_namSinh, _maKhoa: $_maKhoa}';
  }

  bool du20() {
    if (DateTime.now().year - namSinh > 20) return true;
    return false;
  }

  bool laNu() => (hoTen.contains('Thi') || hoTen.contains('thi'));

  String tenKhoa() {
    maKhoa = maKhoa.toUpperCase();
    //print(toString());
    if (maKhoa.contains('AT')) return 'An toàn thông tin';
    if (maKhoa.contains('CT')) return 'Công nghệ thông tin';
    if (maKhoa.contains('DT')) return 'Điện tử viễn thông';
    return 'Mã không hợp lệ';
  }
}

void main() {
  while (true) {
    inMenu();
    var chon = int.parse(stdin.readLineSync());
    SinhVien sv = SinhVien();
    switch (chon) {
      case 1:
        sv.nhap();
        if (sv.du20())
          print('Đủ 20+');
        else
          print('Không đủ 20+');
        break;
      case 2:
        sv.nhap();

        if (sv.laNu())
          print('Là nữ');
        else
          print('Không là nữ');
        break;
      case 3:
        sv.nhap();
        print('Học khoa ${sv.tenKhoa()}');
        break;
    }
  }
}

void inMenu() {
  print('1.Nhập thông tin sinh viên và kiểm tra xem tuổi đủ 20+ chưa');
  print('2.Nhập thông tin sinh viên và kiểm tra có là nữ không');
  print('3.Nhập thông tin sinh viên và kiểm tra xem học khoa gì');
  print('Chọn chức năng cần sử dụng');
}
