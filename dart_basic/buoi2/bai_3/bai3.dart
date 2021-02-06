import 'Dart:io';

class SanPham {
  String tenSP;
  String maSP;
  int giaMua;
  int giaBan;
  int soLuong;

  void nhap() {
    print('Nhập mã sản phẩm ');
    maSP = stdin.readLineSync();
    print('Nhập tên sản phẩm ');
    tenSP = stdin.readLineSync();
    print('Nhập giá mua vào ');
    // set validate cho giá nhập vào và giá bán ra
    giaMua = int.parse(stdin.readLineSync());
    print('Nhập giá bán ra ');
    giaBan = int.parse(stdin.readLineSync());
    print('Nhập số lượng ');
    soLuong = int.parse(stdin.readLineSync());
  }

  int banHet() {
    return (giaBan - giaMua) * soLuong;
  }

  double ban2_3() {
    return ((giaBan * soLuong * (2 / 3)) - giaMua * soLuong);
  }
}
