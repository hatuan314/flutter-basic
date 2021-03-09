import 'dart:ffi';
import 'Dart:io';

class SinhVien {
  String _maSV;
  String _hoTen;
  String _queQuan;
  double _diemA1;
  double _diemA3;
  double _diemNguyenLi;
  double _diemTB;

  String get maSV => _maSV;

  set maSV(String value) {
    _maSV = value;
  }

  String get hoTen => _hoTen;

  set hoTen(String value) {
    _hoTen = value;
  }

  String get queQuan => _queQuan;

  set queQuan(String value) {
    _queQuan = value;
  }

  double get diemA1 => _diemA1;

  set diemA1(double value) {
    _diemA1 = value;
  }

  double get diemA3 => _diemA3;

  set diemA3(double value) {
    _diemA3 = value;
  }

  double get diemNguyenLi => _diemNguyenLi;

  set diemNguyenLi(double value) {
    _diemNguyenLi = value;
  }

  double get diemTB => _diemTB;
  set diemTB(double value) {
    _diemTB = value;
  }

  void nhap() {
    print('Nhập mã sv : ');
    maSV = stdin.readLineSync();
    print('Nhập họ tên : ');
    hoTen = stdin.readLineSync();
    print('Nhập quê quán : ');
    queQuan = stdin.readLineSync();
    print('Nhập điểm toán A1 : ');
    diemA1 = double.parse(stdin.readLineSync());
    print('Nhập điểm toán A3 : ');
    diemA3 = double.parse(stdin.readLineSync());
    print('Nhập điểm nguyên lý : ');
    diemNguyenLi = double.parse(stdin.readLineSync());
    diemTB = (diemA3 + diemA1 + diemNguyenLi) / 3;
  }

  void hienThi() {
    String str = ' Mã sv: ' +
        maSV +
        '\n Họ tên: ' +
        hoTen +
        '\n Quê quán: ' +
        queQuan +
        '\n Điểm A1: ' +
        diemA1.toString() +
        '\n Điểm A3: ' +
        diemA3.toString() +
        '\n Điểm Nguyên lí 1: ' +
        diemNguyenLi.toString() +
        '\n Điểm TB: ' +
        diemTB.toString();
    if (tienThiLai() == 0)
      str += '\n Sinh viên không thi lại';
    else
      str += '\nSinh vien dong ' + tienThiLai().toString();
    print(str);
  }

  int tienThiLai() {
    int tien = 0;
    if (diemNguyenLi < 4) tien += 90000;
    if (diemA1 < 4) tien += 90000;
    if (diemA3 < 4) tien += 90000;
    return tien;
  }
}

void main() {
  SinhVien sv = SinhVien();
  sv.nhap();
  sv.hienThi();
}
