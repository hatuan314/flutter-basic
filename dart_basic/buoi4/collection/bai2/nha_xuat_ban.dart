import 'dart:io';

class NXB{
  String maNXB;
  String tenNXB;
  String diaChi;


  NXB(this.maNXB, this.tenNXB, this.diaChi);

  void nhap(){
    print('nhap ma NXB: '); maNXB = stdin.readLineSync();
    print('nhap ten NXB: '); tenNXB = stdin.readLineSync();
    print('nhap dia chi: '); diaChi = stdin.readLineSync();
  }

  @override
  String toString() {
    return 'NXB{maNXB: $maNXB, tenNXB: $tenNXB, diaChi: $diaChi}';
  }
}