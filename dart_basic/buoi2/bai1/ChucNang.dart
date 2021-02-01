import 'dart:io';

import 'package:untitled8/buoi2/bai1/ThuocTinh.dart';

class Chucnang{
 static Thuoctinh t;
static String rutGon(int tuSo,int maSo) {
  int i = 0;
  int kiemtra = 0;
  t = new Thuoctinh(tuSo, maSo);
  while (true) {
    i++;
    if (t.tuSo % i == 0 && t.mauSo % i == 0 && i!=1) {
      kiemtra = 1;
      break;
    }
    if (i == t.tuSo) {
      break;
    }
  }
  if(t.tuSo==t.mauSo){
    return "1";
  }
  if(t.tuSo==0){
    return '0';
  }
  if (kiemtra == 0) {
    return "${t.tuSo}" + "/" + "${t.mauSo}";
  }
  else {
    return "${t.tuSo / i}" + "/" + "${t.mauSo / i}";
  }


}
  static void menu(){
    print('1.hiện thị phân số:');
    print('2.Rút Gọn Phân Số');
    print('3.Các Phép Tính');
    int n;
    n=int.parse(stdin.readLineSync());
    switch(n){
      case 1:
        print('Nhập Tử số Và Mẫu Số');
        var tuSo=int.parse(stdin.readLineSync());
        var maSo=int.parse(stdin.readLineSync());
        t=new Thuoctinh(tuSo, maSo);
        print('${t.tuSo}/${t.mauSo}');
        break;
      case 2:
        print('Nhập Tử số Và Mẫu Số');
        var tuSo=int.parse(stdin.readLineSync());
        var maSo=int.parse(stdin.readLineSync());
        print('${rutGon(tuSo, maSo)}');
        break;
    case 3:
      print('Nhập Phân Số a;');
      var tuSoa=int.parse(stdin.readLineSync());
      var maSoa=int.parse(stdin.readLineSync());
      print('Nhập Phân số B');
      var tuSob=int.parse(stdin.readLineSync());
      var maSob=int.parse(stdin.readLineSync());
      phepTinh(tuSoa, maSoa, tuSob, maSob);
        break;
    }
  }
static void phepTinh(int tusoa,int masoa,int tuSob,int maSob){
  var tuso;
  var mauso;
  tuso=tusoa*maSob+tuSob*masoa;
  mauso=masoa*maSob;
  print('a+b=${rutGon(tuso, mauso)}');
  tuso=tusoa*maSob-tuSob*masoa;
  mauso=masoa*maSob;
  print('a-b=${rutGon(tuso, mauso)}');
  tuso=tusoa*tuSob;
  mauso=masoa*maSob;
  print('a*b=${rutGon(tuso, mauso)}');
}
}
void main(){
  Chucnang.menu();
}