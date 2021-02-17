import 'dart:io';

import 'sinh_vien_kma.dart';

void main(){
  List<SinhVienKMA> arr_sv = new List();
  Map map_khoa = {'at': 'an toan thong tin', 'ct': 'cong nghe thong tin', 'dt': 'dien tu vien thong'};
  int choose;
  while(true){
    print('1. nhap thong tin sinh vien');
    print('2. in danh sach sinh vien');
    print('3. in danh sach sinh vien nu');
    print('4. in ten khoa day du');
    print('5. in sinh vien du 20 tuoi');
    print('6. break');

    choose = int.parse(stdin.readLineSync());

    switch(choose){
      case 1:{
        SinhVienKMA sv = new SinhVienKMA();
        sv.nhap();
        arr_sv.add(sv);
        print('them thanh cong');
        continue;
      }
      case 2:{
        print('danh sach sinh vien');
        for (SinhVienKMA sv in arr_sv)
          print(sv.toString());
        continue;
      }
      case 3:{
        print('danh sach sinh vien nu');
        for (SinhVienKMA sv in arr_sv)
          if(sv.hoTen.toLowerCase().contains('thi'))
            print(sv.hoTen);
        continue;
      }
      case 4:{
        for (SinhVienKMA sv in arr_sv)
          print('ho ten: ${sv.hoTen}, khoa: ${map_khoa[sv.maKhoa]}');
        continue;
      }
      case 5:{
        for (SinhVienKMA sv in arr_sv)
          if (2021 - int.parse(sv.namSinh) >= 20)
            print(sv.toString());
          continue;
      }
      case 6:{
        break;
      }
    }
    break;
  }
}