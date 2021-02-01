class Thuoctinh{
  String _maSv;
  String _tenSv;
  String _queQuan;
  double _toanA1;
  double _toanA3;
  double _nguyenLi1;


  Thuoctinh();

  double get nguyenLi1 => _nguyenLi1;

  double get toanA3 => _toanA3;

  double get toanA1 => _toanA1;

  String get queQuan => _queQuan;

  String get tenSv => _tenSv;

  String get maSv => _maSv;

  set nguyenLi1(double value) {
    _nguyenLi1 = value;
  }

  set toanA3(double value) {
    _toanA3 = value;
  }

  set toanA1(double value) {
    _toanA1 = value;
  }

  set queQuan(String value) {
    _queQuan = value;
  }

  set tenSv(String value) {
    _tenSv = value;
  }

  set maSv(String value) {
    _maSv = value;
  }
}