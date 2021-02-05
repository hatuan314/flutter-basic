// Bài 5: Khởi tạo đối tượng Hàng hoá gồm các thuộc tính sau: Tên sản phẩm, số lượng, giá nhập vào,
// giá bán ra, ngày nhập, hạn sử dụng. Sau đó thực hiện các chức năng sau:
// 1. Nhập vào từ bàn phím 1 đối tượng hàng hoá gồm đầy đủ các thuộc tính. In ra màn hình thông tin
// của đối tượng hàng hoá đó.
// 2. Nhập vào từ bàn phím 1 đối tượng hàng hoá gồm đầy đủ các thuộc tính. In ra màn hình tổng số tiền
// hàng của đối tượng hàng hoá đó.
// 3. Nhập vào từ bàn phím 1 đối tượng hàng hoá gồm đầy đủ các thuộc tính. Hỏi đối tượng hàng hoá đó
// còn sử dụng được bao nhiêu ngày.

class Product{
  String name;
  double listing;
  double retail;
  int amount;
  DateTime input_date;
  DateTime expire_date;


  Product(this.name, this.listing, this.retail, this.amount, this.input_date, this.expire_date);

  void return_info() {
    print("${this.name}\n${this.listing}\n${this.retail}\n${this.amount}\n${this.input_date}\n${this.expire_date}");
}


  void print_net_worth() {
    print("${this.amount*this.listing}");
}

  void days_until_expire_date() {
    DateTime d = DateTime.now();
    print(this.expire_date.difference(d));
  }

}