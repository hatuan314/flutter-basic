import 'dart:io';
import 'Con_nguoi.dart';

class SinhVien extends conNguoi{

  String MaLop;
  String NganhHoc;
  Strinh Khoa;
  void nhap(){
    super.Nhap();
    print('Ma lop:');
    MaLop = stdin.readLineSync();
    print('Nganh hoc: ');
    NganhHoc = stdin.readLineSync();
    print('khoa: ');
    Khoa = stdin.readLineSync();
  }

  @override
  String toString() {
    return 'SinhVien{ ${super.toString()},MaLop: $MaLop, NganhHoc: $NganhHoc, Khoa: $Khoa}';
  }
  void Xuat(){
    print(toString());
  }
}