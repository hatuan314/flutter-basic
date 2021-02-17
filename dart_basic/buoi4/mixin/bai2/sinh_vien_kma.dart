import 'dart:io';

class SinhVienKMA{
  String hoTen;
  String queQuan;
  String namSinh;
  String maKhoa;

  void nhap(){
    print('nhap thong tin sinh vien KMA');
    print('nhap ho ten: '); hoTen = stdin.readLineSync();
    print('nhap que quan: '); queQuan = stdin.readLineSync();
    print('nhap nam sinh: '); namSinh = stdin.readLineSync();
    print('nhap ma khoa: '); maKhoa = stdin.readLineSync();
  }

  @override
  String toString() {
    return 'SinhVienKMA{hoTen: $hoTen, queQuan: $queQuan, namSinh: $namSinh, maKhoa: $maKhoa}';
  }
}