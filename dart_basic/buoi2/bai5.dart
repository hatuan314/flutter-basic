import 'Dart:io';

class HangHoa {
  String _ten;
  int _soLuong;
  int _giaNhap;
  int _giaBan;
  DateTime _ngayNhap;
  DateTime _HSD;

  String get ten => _ten;

  set ten(String value) {
    _ten = value;
  }

  int get soLuong => _soLuong;

  DateTime get HSD => _HSD;

  set HSD(DateTime value) {
    _HSD = value;
  }

  DateTime get ngayNhap => _ngayNhap;

  set ngayNhap(DateTime value) {
    _ngayNhap = value;
  }

  int get giaBan => _giaBan;

  set giaBan(int value) {
    _giaBan = value;
  }

  int get giaNhap => _giaNhap;

  set giaNhap(int value) {
    _giaNhap = value;
  }

  set soLuong(int value) {
    _soLuong = value;
  }

  @override
  String toString() {
    return 'HangHoa{ten: $_ten, \nsoLuong: $_soLuong, \ngiaNhap: $_giaNhap, \ngiaBan: $_giaBan, \nngayNhap: ${ngayNhap.day}/${ngayNhap.month}/${ngayNhap.year}, \nHSD: ${HSD.day}/${HSD.month}/${HSD.year}';
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

void main() {
  while (true) {
    //print(DateTime.now());
    inMenu();
    var chon = int.parse(stdin.readLineSync());
    HangHoa hh = HangHoa();
    hh.nhap();
    switch (chon) {
      case 1:
        print(hh.toString());
        break;
      case 2:
        print('Tien hang = ${hh.tienHang()}');
        break;
      case 3:
        if (hh.HSD.isAfter(DateTime.now()))
          print('HSD con ${hh.hsdConLai().inDays} ngay');
        else
          print('da het han');
        break;
    }
  }
}

void inMenu() {
  print(
      '1.Nhập và in hàng hóa\n2.Tính tổng tiền hàng\n3.Hàng còn dùng được bao nhiêu ngày ?\n Chọn chức năng cần sử dụng ');
}
