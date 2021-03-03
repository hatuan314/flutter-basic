import 'Dart:io';
class SanPham{
  String _tenSP;
  String _maSP;
  int _giaMua;
  int _giaBan;
  int _soLuong;

  String get tenSP => _tenSP;

  set tenSP(String value) {
    _tenSP = value;
  }

  String get maSP => _maSP;

  int get soLuong => _soLuong;

  set soLuong(int value) {
    _soLuong = value;
  }

  int get giaBan => _giaBan;

  set giaBan(int value) {
    _giaBan = value;
  }

  int get giaMua => _giaMua;

  set giaMua(int value) {
    _giaMua = value;
  }

  set maSP(String value) {
    _maSP = value;
  }
  void nhap()
  {
    print('Nhập mã sản phẩm ');
    maSP=stdin.readLineSync();
    print('Nhập tên sản phẩm ');
    tenSP=stdin.readLineSync();
    print('Nhập giá mua vào ');
    giaMua=int.parse(stdin.readLineSync());
    print('Nhập giá bán ra ');
    giaBan=int.parse(stdin.readLineSync());
    print('Nhập số lượng ');
    soLuong=int.parse(stdin.readLineSync());
  }
  int banHet()
  {
    return (giaBan-giaMua)*soLuong;
  }
  double ban2_3()
  {
    return ((giaBan*soLuong*(2/3))-giaMua*soLuong);
  }
}
void main()
{
  SanPham sp = SanPham();
  sp.nhap();
  print('Neu ban het se lai ${sp.banHet()}');
  if(sp.ban2_3()<0)
    print('Neu ban 2/3 se lo ${sp.ban2_3()*-1}');
  else
    print('Neu ban 2/3 se lai ${sp.ban2_3()}');
}