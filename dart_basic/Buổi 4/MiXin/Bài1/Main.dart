import 'dart:io';
import 'Con_nguoi.dart';
import 'Giang_Vien.dart';
import 'Sinh_Vien.dart';

class Menu{
  List listSv = [];
  List listGv =[];
  giangVien gv = new giangVien();
  SinhVien sv = new SinhVien();
  void Chay() {
    print('Thong tin sinh vien:');
    sv.nhap();
    print('Thong tin giang vien: ');
    gv.Nhap();
    print('Hien thi thong tin sv va gv:');
    sv.Xuat();
    gv.Xuat();
  }

    void KiemTracoHoiHocVoiGiangVien() {
      if (sv.NganhHoc.toLowerCase() == gv.Khoa.toLowerCase()) {
        print('Co co hoi: ');
      }
      else {
        print('Khong co co hoi: ');
      }
    }
      void NhapSinhVine() {
        int i = 0;
        while (true) {
          i++;
          print('Thong tin sinh vien ${i}');
          SinhVien sv = new SinhVien();
          sv.nhap();
          listSv.add(sv);
          if (i == 2) {
            break;
          }
        }
      }
      void NhapGiangVien() {
        int i = 0;
        while (true) {
          i++;
          print('Thong tin ginag vien ${i}');
          giangVien gv = new giangVien();
          gv.Nhap();
          listGv.add(gv);
          if (i == 2) {
            break;
          }
        }
      }
      void SinhVienNu() {
        listSv.forEach((element) {
          if (element.GioiTinh.toString().toLowerCase() == 'nu' ||
              element.GioiTinh.toString().toLowerCase() == 'Nu') {
            print('${element.toString()}');
          }
        });
      }
      void GiangVienNu() {
        listGv.forEach((element) {
          if (element.GioiTinh.toString().toLowerCase() == 'nu' ||
              element.GioiTinh.toString().toLowerCase() == 'Nu') {
            print('${element.toString()}');
          }
        });
      }

        void ChucNang() {
          print(
              '1,Nhập vào từ bàn phím thông tin của 1 học sinh và 1 giảng viên. '
                  'Sau đó in ra màn hình thông tin của học sinh, giảng viên đó.');
          print(
              '2,Nhập vào từ bàn phím thông tin của 1 học sinh và 1 giảng viên. '
                  'Hỏi liệu học sinh đó có cơ hội học giảng viên đó không? ');
          print(
              '3,Nhập vào từ bàn phím thông tin của 2 học sinh và 2 giảng viên.'
                  ' In ra màn hình thông tin của giảng viên và học sinh có giới tính là nữ');

          int LuaChon;
          LuaChon = int.parse(stdin.readLineSync());
          switch (LuaChon) {
            case 1:
              Chay();
              break;
            case 2:
              Chay();
              KiemTracoHoiHocVoiGiangVien();
              break;
            case 3:
              NhapSinhVine();
              NhapGiangVien();
              SinhVienNu();
              GiangVienNu();
              break;
          }
        }
}
void main(){
  Menu t = new Menu();
  t.ChucNang();
}