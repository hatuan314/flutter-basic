import 'dart:io';

import 'bai5.dart';

void main()
{
  while(true)
  {
    //print(DateTime.now());
    inMenu();
    var chon = int.parse(stdin.readLineSync());
    HangHoa hh= HangHoa();
    hh.nhap();
    switch(chon)
    {
      case 1:

        print(hh.toString());
        break;
      case 2:
        print('Tien hang = ${hh.tienHang()}');
        break;
      case 3:
        if(hh.HSD.isAfter(DateTime.now()))
          print('HSD con ${hh.hsdConLai().inDays} ngay');
        else
          print('da het han');
        break;
    }
  }
}
void inMenu()
{
  print('1.Nhập và in hàng hóa\n2.Tính tổng tiền hàng\n3.Hàng còn dùng được bao nhiêu ngày ?\n Chọn chức năng cần sử dụng ');
}