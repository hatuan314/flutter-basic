import 'Dart:io';
import 'Dart:core';

class PhanSo {
  int _tuSo;
  int _mauSo;
  int get tuSo => _tuSo;

  set tuSo(int value) {
    _tuSo = value;
  }

  int get mauSo => _mauSo;

  set mauSo(int value) {
    _mauSo = value;
  }

  void nhap() {
    print('Nhap tu so : ');
    _tuSo = int.parse(stdin.readLineSync());
    print('Nhap mau so : ');
    _mauSo = int.parse(stdin.readLineSync());
  }

  void hienThi() {
    print('${tuSo}/${mauSo}');
  }

  int UCLN(int tu, int mau) {
    if (tu == 0 || mau == 0) {
      num a = tu + mau;
      return (a.abs());
    }
    while (mau * tu != 0) {
      if (tu > mau)
        tu %= mau;
      else
        mau %= tu;
    }
    num a = tu + mau;
    return (a.abs());
  }

  void rutGon() {
    var ucln = UCLN(tuSo, mauSo);
    tuSo = (tuSo / ucln).toInt();
    mauSo = (mauSo / ucln).toInt();
  }

  void cong(PhanSo pSo) {
    PhanSo pSoCong = PhanSo();
    pSoCong.tuSo = tuSo * pSo.mauSo + mauSo * pSo.tuSo;
    pSoCong.mauSo = mauSo * pSo.mauSo;
    pSoCong.rutGon();
    pSoCong.hienThi();
  }

  void tru(PhanSo pSo) {
    PhanSo pSoTru = PhanSo();
    pSoTru.tuSo = tuSo * pSo.mauSo - mauSo * pSo.tuSo;
    pSoTru.mauSo = mauSo * pSo.mauSo;
    pSoTru.rutGon();
    pSoTru.hienThi();
  }

  void nhan(PhanSo pSo) {
    PhanSo pSoNhan = PhanSo();
    pSoNhan.tuSo = tuSo * pSo.tuSo;
    pSoNhan.mauSo = mauSo * pSo.mauSo;
    pSoNhan.rutGon();
    pSoNhan.hienThi();
  }

  void chia(PhanSo pSo) {
    PhanSo pSoChia = PhanSo();
    pSoChia.tuSo = tuSo * pSo.mauSo;
    pSoChia.mauSo = mauSo * pSo.tuSo;
    pSoChia.rutGon();
    pSoChia.hienThi();
  }

  double soThapPhan() => tuSo / mauSo;
}

void main() {
  while (true) {
    inMenu();
    var chon = int.parse(stdin.readLineSync());
    switch (chon) {
      case 1:
        PhanSo pSo = PhanSo();
        pSo.nhap();
        pSo.hienThi();
        break;
      case 2:
        PhanSo pSo = PhanSo();
        pSo.nhap();
        pSo.rutGon();
        pSo.hienThi();
        break;
      case 3:
        PhanSo pSo1 = PhanSo();
        pSo1.nhap();
        PhanSo pSo2 = PhanSo();
        pSo2.nhap();
        pSo1.cong(pSo2);
        pSo1.tru(pSo2);
        pSo1.nhan(pSo2);
        pSo1.chia(pSo2);
        break;
      case 4:
        PhanSo pSo = PhanSo();
        pSo.nhap();
        print(pSo.soThapPhan());
        break;
    }
  }
}

void inMenu() {
  print('1. Nhập và in 1 phân số. \n');
  print('2. Nhập và in dạng rút gon của 1 phân số. \n');
  print(
      '3. Nhập vào từ bàn phím 2 phân số a, b bất kì. Thực hiện các phép tính a+b, a-b, a/b, a*b. \n');
  print(
      '4. Nhập vào từ bàn phím 1 phân số bất kì. in ra màn hình dạng số thập phân của phân số đó. \n');
  print('Chọn chức năng cần sử dụng : ');
}
