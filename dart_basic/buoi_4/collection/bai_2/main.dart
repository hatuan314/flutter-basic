/*Hệ thống quản lý gồm các chức năng sau:
- Nhập:
     + Nhập sách.
     + Nhập thông tin tác giả.
     + Nhập thông tin nhà xuất bản.
- Tìm kiếm sách theo tên tác giả và hiển thị chúng với các thông tin sau: Tên sách, tên nhà xuất bản, tên tác giả.
- Sửa thông tin sách.
- Nhập vào tên tác giả và xuất ra màn hình số sách của tác giả đó.
*/
import 'dart:io';
import 'author.dart';
import 'book.dart';
import 'publisher.dart';

void main(){
  List booksList = List();
  List authorsList = List();
  List publishersList = List();
  while(true)
    {
      menu();
      var chon = int.parse(stdin.readLineSync());
      switch (chon) {
        case 1:
          Book b = Book();
          b.import();
          booksList.add(b);
          break;
        case 2:
          Author tg = Author();
          tg.import();
          authorsList.add(tg);
          break;
        case 3:
          Publisher nxb = Publisher();
          nxb.import();
          publishersList.add(nxb);
          break;
        case 4:
          print('Nhập tên tác giả ');
          String author= stdin.readLineSync();
          for(Author x in authorsList)
            {
              if(x.name == author)
                {
                  for(Book y in booksList)
                    {
                      if(x.authorID == y.authorID)
                        {
                          for(Publisher z in publishersList)
                            {
                              if(z.publisherID == y.publisherID)
                                {
                                  print('Book: ${y.name}, Publisher: ${z.name}, Author: ${x.name}');
                                }
                            }
                        }
                    }
                }
            }
          break;
        case 5:
          print('Nhập mã sách cần sửa: ');
          String id = stdin.readLineSync();
          for(Book x in booksList)
            {
              if(id==x.bookID)
                {
                  x.import();
                }
            }
          break;
        case 6:
          print('Nhập tên tác giả ');
          int count=0;
          String author= stdin.readLineSync();
          for(Author x in authorsList) {
            if (x.name == author) {
              for (Book y in booksList) {
                if (x.authorID == y.authorID) {
                  count ++;
                }
              }
            }
          }
          print('Tác giả có ${count} sách');
          break;

      }
    }
}
void menu(){
  print('1.Nhập sách');
  print('2.Nhập thông tin tác giả');
  print('3.Nhập thông tin nhà xuất bản');
  print('4.Tìm kiếm sách theo tên tác giả');
  print('5.Sửa thông tin sách');
  print('6.Nhập tên, hiển thị số sách của tác giả');
  print('Chọn chức năng : ');
}