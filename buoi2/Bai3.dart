


main(List<String> args) {
  var bai3 = Bai3('abc','abc',50000,70000,100);
  print(bai3.lai(50));
}


class Bai3
{
  String maSP;
  String tenSP;
  double giaMua;
  double giaBan;
  int soluong;
  Bai3(this.maSP,this.tenSP,this.giaMua,this.giaBan,this.soluong);
  double lai(int so_luong_da_ban)
  {
    return so_luong_da_ban*(giaBan-giaMua);
  }
}