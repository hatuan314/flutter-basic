import 'Dart:io';
import 'person.dart';

class SinhVien  with Person{
  String maSV;
  double diemA1;
  double diemA3;
  double diemNguyenLi;
  double diemTB;


  SinhVien(this.maSV, this.diemA1, this.diemA3, this.diemNguyenLi, this.diemTB) {
    Future.delayed(Duration(seconds: 3)).whenComplete(() {
      print('Sau 3s khởi tạo constructor');
      /// bloc command
    });

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
