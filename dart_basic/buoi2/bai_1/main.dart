import 'dart:io';

import 'phan_so.dart';

void main()
{
  while(true)
  {
    inMenu();
    var chon = int.parse(stdin.readLineSync());
    switch(chon)
    {
      case 1 :
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
        print(pSo.soThapPhan);
        break;
    }
  }
}
void inMenu()
{
  print('1. Nhập và in 1 phân số. \n');
  print('2. Nhập và in dạng rút gon của 1 phân số. \n');
  print('3. Nhập vào từ bàn phím 2 phân số a, b bất kì. Thực hiện các phép tính a+b, a-b, a/b, a*b. \n');
  print('4. Nhập vào từ bàn phím 1 phân số bất kì. in ra màn hình dạng số thập phân của phân số đó. \n');
  print('Chọn chức năng cần sử dụng : ');
}