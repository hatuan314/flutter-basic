import 'dart:io';
import 'Sinh_Vien.dart';

class ChucNang{
  SinhVien sv = new SinhVien();
  void Nhap(){
    sv.Nhap();
  }
  void KiemTraTuoi() {
    if (2021 - sv.namsinh > 20) {
      print('Da du tuoi: ');
    }
    else {
      print('chua du tuoi: ');
    }
  }
    void KiemTraGioiTinh() {
      if (sv.HoTen.toLowerCase().contains('Thi')) {
        print('Gioi tinh nu: ');
      } else {
        print('Gioi tinh nam: ');
      }
    }
    void KiemTraKhoa(){
        if(sv.MaKhoa.toLowerCase().startsWith('at')){
          print('An toan thong tin:');
        }
        if(sv.MaKhoa.toLowerCase().startsWith('ct')){
          print('Cong nghe thong tin');
        }
        if(sv.MaKhoa.toLowerCase().startsWith('dt')){
          print('Dien tu vien thong');
        }
    }
      void Menu(){
        print('1. Nhập vào từ bàn phím thông tin của 1 sinh viên KMA.'
            ' Kiểm tra xem sinh viên đó đã đủ 20+ hay chưa? ');
        print('2. Nhập vào từ bàn phím thông tin của 1 sinh viên KMA. '
            'Kiểm tra xem sinh viên đó có phải là nữ hay không ');
        print('3. Nhập vào từ bàn phím thông tin của 1 sinh viên KMA. '
            'Kiểm tra xem sinh viên đó học khoa gì');
        int LuaChon;
        LuaChon = int.parse(stdin.readLineSync());
        switch(LuaChon){
          case 1:
            Nhap();
            KiemTraTuoi();
            break;
          case 2:
            Nhap();
            KiemTraGioiTinh();
            break;
          case 3:
            Nhap();
            KiemTraKhoa()
                break;

        }
      }
    }

