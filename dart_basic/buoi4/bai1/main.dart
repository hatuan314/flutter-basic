import 'dart:io';

import 'giang_vien.dart';
import 'sinh_vien.dart';

void main(){
  List<SinhVien> list_sv = new List();
  List<GiangVien> list_gv = new List();
  Map map_gv_sv = new Map();
  int choose;

  while(true){
    print('1. nhap tt sinh vien');
    print('2. nhap tt gv');
    print('3. in thong tin sv, gv');
    print('4. in danh sach gv ma sv co the hoc');
    print('5. in danh sach nu');
    print('6. break');

    choose = int.parse(stdin.readLineSync());

    switch(choose){
      case 1:{
        SinhVien sv = new SinhVien();
        sv.nhap();
        list_sv.add(sv);
        print('them sv thanh cong');
        continue;
      }
      case 2:{
        GiangVien gv = new GiangVien();
        gv.nhap();
        list_gv.add(gv);
        print('them gv thanh cong');
        continue;
      }
      case 3:{
        print('danh sach sv');
        for (SinhVien sv in list_sv)
          print(sv.toString());
        print('danh sach gv');
        for (GiangVien gv in list_gv)
          print(gv.toString());
        continue;
      }
      case 4:{
        for (GiangVien gv in list_gv){
          map_gv_sv[gv.hoTen] = new List();
          for (SinhVien sv in list_sv){
            if (gv.khoa == sv.nganhHoc)
              map_gv_sv[gv.hoTen].add(sv.hoTen);
          }
        }
        print(map_gv_sv);
        continue;
      }
      case 5:{
        print('danh sach nu');
        for (SinhVien sv in list_sv)
          if (sv.gioiTinh == 'nu')
            print(sv.toString());
        for (GiangVien gv in list_gv)
          if (gv.gioiTinh == 'nu')
            print(gv.toString());
        continue;
      }
      case 6:{
        break;
      }
    }
    break;
  }
}