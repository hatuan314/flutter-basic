// Bài 3: Tạo 1 đối tượng sản phẩm với các thuộc tính: - Mã sản phẩm - Tên sản phẩm - Giá mua vào -
// Giá bán ra - Số lượng sản phẩm
// Hỏi nếu bán hết toàn bộ sản phẩm đó trong kho thì chủ cửa hàng sẽ lãi bao nhiêu tiền.
// Nếu chỉ bán hết 2/3 số lượng hàng thì chủ hàng sẽ lỗ/lãi bao nhiêu tiền. -----------tùy tâm---------

class Product{
  String ProID;
  String name;
  double listing;
  double retail;
  int amount;

  Product(this.ProID, this.name, this.listing, this.retail, this.amount);

  double profit(){
    return (amount)*(retail - listing);
  }
}