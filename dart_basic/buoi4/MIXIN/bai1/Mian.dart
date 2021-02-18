import 'dart:io';

import 'Giang_Vien.dart';
import 'Sinh_Vien.dart';


class Menu{
  List listSV=[];
  List listGV=[];
  giangVien gv=new giangVien();
  sinhVien sv=new sinhVien();
  void nhap(){
     print('Thong Tin Hoc Sinh');
     sv.nhap();
     print('Thong Tin Giang Vien');
    gv.nhap();
     print('Tong Tin Hoc Sinh va Giang Vien');
    sv.xuat();
    gv.xuat();
  }
  void kiemTra(){
     if(sv.nganhHoc.toLowerCase()==gv.khoa.toLowerCase()){
      print('Co co hoi');
    }
    else{
       print('Khong co co hoi');
    }
   }
  void nhapSinhVien(){
    int i=0;
    while(true){
      i++;
      print('Thong Tin Sinh Vien ${i}');
      sinhVien sv=new sinhVien();
      sv.nhap();
      listSV.add(sv);
      if(i==2){
        break;
      }
    }
  }
  void nhapGiangvien(){
    int i=0;
    while(true){
      i++;
      print('Thong Tin Giang Vien ${i}');
      giangVien gv=new giangVien();
      gv.nhap();
      listGV.add(gv);
      if(i==2){
        break;
      }
    }
  }
  void xuatSvNu(){
  listSV.forEach((element) {
    if(element.gioiTinh.toString().toLowerCase()=='nu'){
      print('${element.toString()}');
      }
    });
  }
  void xuatGvNu(){
    listGV.forEach((element) {
      if(element.gioiTinh.toString().toLowerCase()=='nu'){
        print('${element.toString()}');
      }
    });
  }
  void menu(){
    print('1.Nhập vào từ bàn phím thông tin của 1 học sinh và 1 giảng viên. Sau đó in ra màn hình thông tin của học sinh, giảng viên đó.');
    print('2. Nhập vào từ bàn phím thông tin của 1 học sinh và 1 giảng viên. Hỏi liệu học sinh đó có cơ hội học giảng viên đó không? (Biết rằng nếu ngành học của học sinh giống với khoa của giáo viên thì học sinh có cơ hội được học giảng viên đó).');
    print('3. Nhập vào từ bàn phím thông tin của 2 học sinh và 2 giảng viên. In ra màn hình thông tin của giảng viên và học sinh có giới tính là nữ.');
    int chon;
    chon=int.parse(stdin.readLineSync());
    switch(chon){
      case 1:
        nhap();
        break;
      case 2:
       nhap();
        kiemTra();
        break;
      case 3:
        nhapSinhVien();
        nhapGiangvien();
        xuatSvNu();
        xuatGvNu();
        break;
    }
  }
}
void main(){
  Menu t=new Menu();
  t.menu();
}