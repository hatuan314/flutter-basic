//Sách có các thuộc tính: Mã sách, tên sách, mã tác giả, mã nhà xuất bản
import 'dart:convert';
import 'dart:io';

class Book{
  String bookID;
  String name;
  String authorID;
  String publisherID;
  void import()
  {
    print('Nhập thông tin sách: ');
    print('Nhập mã sách : ');
    bookID = stdin.readLineSync();
    print('Nhập tên : ');
    name = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    print('Nhập mã tác giả : ');
    authorID = stdin.readLineSync();
    print('Nhập mã nhà xuất bản : ');
    publisherID = stdin.readLineSync();
  }

  @override
  String toString() {
    return 'Book{bookID: $bookID, name: $name, authorID: $authorID, publisherID: $publisherID}';
  }
}