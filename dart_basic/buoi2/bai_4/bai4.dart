import 'dart:io';

class SinhVien {
  String hoTen;
  String queQuan;
  int namSinh;
  String maKhoa;

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
    return 'SinhVien{_hoTen: $hoTen, _queQuan: $queQuan, _namSinh: $namSinh, _maKhoa: $maKhoa}';
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
