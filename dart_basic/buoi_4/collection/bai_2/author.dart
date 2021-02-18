import 'dart:convert';

import 'dart:io';

class Author {
  String name;
  String authorID;

  void import() {
    print('Nhập thông tin tác giả: ');
    print('Nhập mã tác giả : ');
    authorID = stdin.readLineSync();
    print('Nhập tên : ');
    name = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
  }

  @override
  String toString() {
    return 'Author{name: $name, authorID: $authorID}';
  }
}
