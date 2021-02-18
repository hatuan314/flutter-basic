import 'dart:io';

import '../ThuocTinh/Nha_Xuat_Ban.dart';
import '../ThuocTinh/Sach.dart';
import '../ThuocTinh/Sach.dart';
import '../ThuocTinh/Sach.dart';
import '../ThuocTinh/Tac_Gia.dart';
import 'Tim_Kiem.dart';

class Menu{
  sach s=new sach();
  NhaXuatBan nxb=new NhaXuatBan();
  Tacgia tg=new Tacgia();
  List<sach> listSach=List();
  List<NhaXuatBan> listNxb=List();
  List<Tacgia> listtg=List();
  void meNu(){
    int chon;
    print('1.Nhap');
    print('2.tim kiem sach theo ten tac gia');
    print('3.sua thong tin sach');
    print('4.so sach cua tac gia');
    print('5.thoat');
    while(true) {
      chon=int.parse(stdin.readLineSync());
      switch (chon) {
        case 1:
          Nhap();
          break;
        case 2:
          timKiem();
          break;
        case 3:
          suaThongtinsach();
          break;
        case 4:
          timSoSach();
          break;
        case 5:
          return;
      }
    }
  }
  void timSoSach(){
    List<Timkiem> timkiem=[];
    Map<String,dynamic> maptimkiem={};
    listtg.forEach((tacgia) {
      maptimkiem.addAll({tacgia.tenTacgia:List()});
      listSach.forEach((sach) {
        if(tacgia.maTacgia==sach.maTacgia){
          listNxb.forEach((NXB) {
            if(sach.maNhaxuatban==NXB.maXuatban){
              timkiem.add(Timkiem(tacgia.tenTacgia,sach.tenSach,NXB.tenNhaxuatban));
            }
          });
        }
      });
    });
    listtg.forEach((element) {
      for(int i=0;i<timkiem.length;i++){
        if(element.tenTacgia==timkiem[i].tenTacgia){
          maptimkiem[element.tenTacgia].add(timkiem[i]);
        }
      }
    });
    String tentg;
    print('Nhap Vao Ten Tac Gia Muon Tim Kiem');
    tentg=stdin.readLineSync();
    print('so Sach tac gia Co:${maptimkiem[tentg].length}');
  }
  void suaThongtinsach(){
    String maSach;
    print('Nhap Vao Ma Sach Can Sua');
    maSach=stdin.readLineSync();

    for(int i=0;i<listSach.length;i++){
      if(maSach==listSach[i].maSach){

        print('Sua ma Sach');
        listSach[i].maSach=stdin.readLineSync();
        print('Sua ten Sach');
        listSach[i].tenSach=stdin.readLineSync();
        print('sua ma tac gia');
        listSach[i].maTacgia=stdin.readLineSync();
        print('sua ma nha xuat ban');
        listSach[i].maNhaxuatban=stdin.readLineSync();
      }
    }
  }
  void timKiem(){
    List<Timkiem> timkiem=[];
    Map<String,dynamic> maptimkiem={};
    listtg.forEach((tacgia) {
      maptimkiem.addAll({tacgia.tenTacgia:List()});
      listSach.forEach((sach) {
        if(tacgia.maTacgia==sach.maTacgia){
          listNxb.forEach((NXB) {
            if(sach.maNhaxuatban==NXB.maXuatban){
               timkiem.add(Timkiem(tacgia.tenTacgia,sach.tenSach,NXB.tenNhaxuatban));
            }
          });
        }
      });
    });
listtg.forEach((element) {
  for(int i=0;i<timkiem.length;i++){
    if(element.tenTacgia==timkiem[i].tenTacgia){
      maptimkiem[element.tenTacgia].add(timkiem[i]);
    }
  }
});
    String tentg;
    print('Nhap Vao Ten Tac Gia Muon Tim Kiem');
    tentg=stdin.readLineSync();
    print('${maptimkiem[tentg]}');
  }

  void Nhap(){
    print('Nhap Thong Tin Sach');
    int i=0;
    while(true){
    i++;
      print('Sach Thu $i');
      sach s=new sach();
      s.nhap();
      listSach.add(s);
      print('Ban Co Muon Nhap Nua Khong(Y/K)');
      String chon1="";
     chon1=stdin.readLineSync();
    if(chon1=="k"){
      break;
    }
    }
    print('Nhap Thong Tin Tac Gia');
     i=0;
    while(true){
      i++;
      print('Tac Gia Thu $i');
      Tacgia tg=new Tacgia();
      tg.nhap();
      listtg.add(tg);
      print('Ban Co Muon Nhap Nua Khong(Y/K)');
      String chon1="";
      chon1=stdin.readLineSync();
      if(chon1=="k"){
        break;
      }
    }
    print('Nhap Thong Tin Nha Xuat Ban');
   i=0;
    while(true){
      i++;
      print('Nha Xuat Ban Thu $i');
      NhaXuatBan nxb=new NhaXuatBan();
      nxb.nhap();
      listNxb.add(nxb);
      print('Ban Co Muon Nhap Nua Khong(Y/K)');
      String chon1="";
      chon1=stdin.readLineSync();
      if(chon1=="k"){
        break;
      }
    }
  }
}