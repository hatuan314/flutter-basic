import 'dart:convert';

import 'dart:io';

class Publisher {
  String name;
  String address;
  String publisherID;

  void import() {
    print('Nhập thông tin tác giả: ');
    print('Nhập mã tác giả : ');
    publisherID = stdin.readLineSync();
    print('Nhập tên : ');
    name = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    print('Nhập địa chỉ : ');
    address = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
  }

  @override
  String toString() {
    return 'Publisher{name: $name, address: $address, publisherID: $publisherID}';
  }
}