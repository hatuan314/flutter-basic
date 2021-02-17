
import 'dart:io';

import 'nha_xuat_ban.dart';
import 'sach.dart';
import 'tac_gia.dart';

void main(){
  int choose;
  List<Sach> arr_sach = new List();
  arr_sach.add(new Sach('b1', 'book1', 'tg1', 'nxb1'));
  arr_sach.add(new Sach('b2', 'book2', 'tg2', 'nxb2'));
  arr_sach.add(new Sach('b3', 'book3', 'tg2', 'nxb1'));

  List<TacGia> arr_tacGia = new List();
  arr_tacGia.add(new TacGia('tg1', 'tacgia1'));
  arr_tacGia.add(new TacGia('tg2', 'tacgia2'));

  List<NXB> arr_NXB = new List();
  arr_NXB.add(new NXB('nxb1', 'NXB1', 'Hanoi'));
  arr_NXB.add(new NXB('nxb2', 'NXB2', 'Hanam'));

  while(true){
    print('1. nhap - pass');
    print('2. tim kiem theo tac gia');
    print('3. sua thong tin sach');
    print('4. break');
    print('nhap lua chon: '); choose = int.parse(stdin.readLineSync());
    switch(choose){
      case 2:{
        print('nhap ten tac gia muon tim kiem: ');
        String tenTacGia = stdin.readLineSync();
        for (TacGia tg in arr_tacGia)
          if (tg.tenTacGia == tenTacGia){
            String maTacGia = tg.maTacGia;
            for (Sach sach in arr_sach)
              if (sach.maTacGia == maTacGia){
                String maNXB = sach.maNXB;
                for (NXB nxb in arr_NXB)
                  if (nxb.maNXB == maNXB){
                    print('ten sach: ${sach.tenSach}, NXB: ${nxb.tenNXB}, tac gia: ${tg.tenTacGia}');
                    continue;
                  }
              }
          }
        continue;
      }
      case 3:{
        print('nhap ma sach muon sua thong tin');
        String maSach = stdin.readLineSync();
        for (Sach sach in arr_sach)
          if (sach.maSach == maSach){
            print('nhap ten sach: '); sach.tenSach = stdin.readLineSync();
            print('nhap ma tac gia: '); sach.maTacGia = stdin.readLineSync();
            print('nhap ma nxb: '); sach.maNXB = stdin.readLineSync();

            print('thong tin sach: ${sach.toString()}');
            }
        continue;
      }
      case 4:{
        break;
      }
    }
    break;
  }
}