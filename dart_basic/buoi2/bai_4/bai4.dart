import 'dart:convert';
import 'dart:io';

class SinhVien {
  String hoTen;
  String queQuan;
  int namSinh;
  String maKhoa;

  void nhap() {
    print('Nhập họ tên: ');
    hoTen = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
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

  bool laNu() {
    ///Nguyen Thi Minh
    ///Nguyen Dinh Thieu
    ///Nguyen Thi Hong Van
    ///
    bool gender = false;
    /*String hotenUTF8 = utf8.decode(hoTen.runes.toList());
    print('$hotenUTF8');*/
    List<String> tens = hoTen.split(" ");
    print('$tens va do dai mang la ${tens.length}');
    for (int i = 1; i < tens.length - 1; i++) {
      if (tens[i].toLowerCase() == 'thị') return true;
    }
    return false;
  }

  String tenKhoa() {
    maKhoa = maKhoa.toUpperCase();
    if (maKhoa.contains('AT')) return 'An toàn thông tin';
    if (maKhoa.contains('CT')) return 'Công nghệ thông tin';
    if (maKhoa.contains('DT')) return 'Điện tử viễn thông';
    return 'Mã không hợp lệ';
  }
}
