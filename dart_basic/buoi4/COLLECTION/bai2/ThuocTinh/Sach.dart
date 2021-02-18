import 'dart:io';

class sach{
  String maSach;
  String tenSach;
  String maTacgia;
  String maNhaxuatban;
  void nhap(){
    print('Ma Sach');
    maSach=stdin.readLineSync();
    print('ten Sach');
    tenSach=stdin.readLineSync();
    print('ma Tac Gia');
    maTacgia=stdin.readLineSync();
    print('Ma Nha Xuat Ban');
    maNhaxuatban=stdin.readLineSync();
  }

  @override
  String toString() {
    return 'sach{maSach: $maSach, tenSach: $tenSach, maTacgia: $maTacgia, maNhaxuatban: $maNhaxuatban}';
  }
}