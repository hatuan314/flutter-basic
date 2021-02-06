import 'dart:io';

main(List<String> args) {
  stdout.write("ten : ");
  String ten = stdin.readLineSync();
  stdout.write("so Luong :");
  int soLuong= int.parse(stdin.readLineSync());
  stdout.write("gia nhap :");
  double giaNhap = double.parse(stdin.readLineSync());
  stdout.write("gia ban :");
  double giaBan = double.parse(stdin.readLineSync());
  stdout.write("ngay nhap : ");
  int year_in,month_in,day_in = int.parse(stdin.readLineSync());
  stdout.write("han su dung : ");
  int year,month,day = int.parse(stdin.readLineSync());
  Bai5 bai5 = Bai5(ten,soLuong,giaNhap,giaBan,DateTime(year:year_in,month:month_in,day:day_in),DateTime(year:year,month:month,day:day));
}



class Bai5
{
  String ten;
  int soLuong;
  double giaNhap;
  double giaBan;
  DateTime ngayNhap;
  DateTime hanSD;
  Bai5(this.ten,this.soLuong,this.giaNhap,this.giaBan,this.ngayNhap,this.hanSD);

  void show()
  {
    print('ten : ${ten}');
    print('so luong : ${soLuong}');
    print('gia nhap : ${ngayNhap}');
    print('gia ban : ${giaBan}');
    print('ngay nhap : ${ngayNhap.year}/${ngayNhap.month}/${ngayNhap.day}');
    print('han su dung : ${hanSD.year}/${hanSD.month}/${hanSD.day}');
  }
}