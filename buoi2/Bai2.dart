

main()
{
  var bai2 = Bai2('CT03','Luong','HNam',3,4,3);
  print(bai2.avg());
  print(bai2.tien_thi_lai());
}



class Bai2
{
  String maSV;
  String tenSV;
  String queQuan;
  double toanA1;
  double toanA3;
  double nguyenLy1;
  Bai2(this.maSV,this.tenSV,this.queQuan,this.toanA1,this.toanA3,this.nguyenLy1);
  Bai2.empty();
  double avg()
  {
    return (toanA1+toanA3+nguyenLy1)/3;
  }
  double tien_thi_lai()
  {
    double sum=0;
    if(toanA1<4)sum=sum+90000;
    if(toanA3<4)sum=sum+90000;
    if(nguyenLy1<4)sum=sum+90000;
    return sum;
  }









  void set_maSV(String maSV)
  {
    this.maSV=maSV;
  }
  String get_maSV()
  {
    return this.maSV;
  }
  void set_tenSV()
  {
    this.tenSV=tenSV;
  }
  String get_tenSV()
  {
    return this.tenSV;
  }
  String get_queQuan()
  {
    return this.queQuan;
  }
  void set_queQuan(String quequan)
  {
    this.queQuan=quequan;
  }
  double get_toanA1()
  {
    return this.toanA1;
  }
  void set_toanA1(double toanA1)
  {
    this.toanA1=toanA1;
  }
  double get_toanA3()
  {
    return this.toanA3;
  }
  void set_toanA3(double toanA3)
  {
    this.toanA3=toanA3;
  }
  double get_nguyenLy1()
  {
    return this.nguyenLy1;
  }
  void set_nguyenLy1(double nguyenLy1)
  {
    this.nguyenLy1=nguyenLy1;
  }
}