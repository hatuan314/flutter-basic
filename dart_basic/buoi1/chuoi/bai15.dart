import 'dart:io';
void menu(){
  print('Nhập Mỗi chuỗi');
  String a=stdin.readLineSync();
  int chon;
  print('1.Viết hoa Toàn bộ chuỗi');
  print('2.viết thường toàn bộ chuỗi');
  print('3.thoát');
  chon=int.parse(stdin.readLineSync());
  switch(chon){
    case 1:

      print('${a.toUpperCase()}');
      break;
    case 2:
      print('${a.toLowerCase()}');
      break;
    case 3:
      return ;
  }
}
void main(){
  menu();

}