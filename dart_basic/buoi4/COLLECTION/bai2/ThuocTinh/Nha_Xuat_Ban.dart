import 'dart:io';

class NhaXuatBan{
  String maXuatban;
  String tenNhaxuatban;
  String diaChi;
void nhap(){
  print('Ma Xuat Ban');
  maXuatban=stdin.readLineSync();
  print('Ten Nha Xuat Ban');
  tenNhaxuatban=stdin.readLineSync();
  print('Dia Chia');
  diaChi=stdin.readLineSync();
  }

  @override
  String toString() {
    return 'NhaXuatBan{maXuatban: $maXuatban, tenNhaxuatban: $tenNhaxuatban, diaChi: $diaChi}';
  }

}