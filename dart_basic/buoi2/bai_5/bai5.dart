import 'Dart:io';

class HangHoa {
  String ten;
  int soLuong;
  int giaNhap;
  int giaBan;
  DateTime ngayNhap;
  DateTime HSD;

  @override
  String toString() {
    return 'HangHoa{ten: $ten, \nsoLuong: $soLuong, \ngiaNhap: $giaNhap, '
        '\ngiaBan: $giaBan, \nngayNhap: ${ngayNhap.day}/${ngayNhap.month}/'
        '${ngayNhap.year}, \nHSD: ${HSD.day}/${HSD.month}/${HSD.year}';
  }

  void nhap() {
    print('Nhập tên: ');
    ten = stdin.readLineSync();
    print('Nhập số lượng: ');
    soLuong = int.parse(stdin.readLineSync());
    print('Nhập giá nhập: ');
    giaNhap = int.parse(stdin.readLineSync());
    print('Nhập giá bán: ');
    giaBan = int.parse(stdin.readLineSync());
    print('Nhập ngày nhập: ');
    //var a= ngayNhap.
    ngayNhap = DateTime.parse(stdin.readLineSync());
    print('Nhập HSD: ');
    HSD = DateTime.parse(stdin.readLineSync());
  }

  int tienHang() => giaNhap * soLuong;

  Duration hsdConLai() => HSD.difference(DateTime.now());
}
