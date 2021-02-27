import 'dart:_internal';
import 'dart:io';
import 'Con_nguoi.dart';

class giangVien extends conNguoi{
  String Khoa;
  String MonHoc;
  int namKinhNghiem;

  void Nhap(){
    super.Nhap();
    print('Khoa: ');
    Khoa = stdin.readLineSync();
    print('Mon hoc: ');
    MonHoc = stdin.readLineSync();
    print('Nam kinh nghiem: ');
    namKinhNghiem = int.parse(stdin.readLineSync());

  }

  @override
  String toString() {
    return 'giangVien{${super.toString()},Khoa: $Khoa, MonHoc: $MonHoc, namKinhNghiem: $namKinhNghiem}';
  }
  void Xuat(){
    print(toString());
    
  }
}
