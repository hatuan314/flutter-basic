
import 'dart:io';
main(List<String> args) {
  Bai4 bai4 =Bai4(stdin.readLineSync(),stdin.readLineSync(),DateTime(int.parse(stdin.readLineSync())),stdin.readLineSync());
  print(bai4.isFemale());
  print(bai4.khoa());
}




class Bai4
{
  String hoTen;
  String queQuan;
  DateTime namSinh;
  String maKhoa;
  Bai4(this.hoTen,this.queQuan,this.namSinh,this.maKhoa);

  bool is20()
  {
    if(DateTime.now().year-namSinh.year>20)return true;
    return false;
  }
  bool isFemale()
  {
    RegExp regExp = RegExp(r"[a-z ]*thi[a-z ]*");
    return regExp.hasMatch(this.hoTen);
  }
  String khoa()
  {
    if(this.maKhoa.matchAsPrefix(r"CT")!=null)return "Cong nghe thong tin";
    if(this.maKhoa.matchAsPrefix(r"AT")!=null)return "An toan thong tin";
    if(this.maKhoa.matchAsPrefix(r"DT")!=null)return "Dien Tu Vien Thong";
  }
}