import 'Dart:io';
import 'Dart:core';

class PhanSo {
  int tuSo;
  int mauSo;

  void nhap() {
    print('Nhap tu so : ');
    tuSo = int.parse(stdin.readLineSync());
    do {
      print('Nhap mau so : ');
      mauSo = int.parse(stdin.readLineSync());
    } while(mauSo == 0);
  }

  void hienThi() {
    print('${tuSo}/${mauSo}');
  }

  int ucln(int tu, int mau) {
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
    int mUcln = ucln(tuSo, mauSo);
    tuSo = tuSo ~/ mUcln;
    mauSo = mauSo ~/ mUcln;
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

  double get soThapPhan => tuSo / mauSo;
}
