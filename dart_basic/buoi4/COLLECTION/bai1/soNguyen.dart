import 'dart:math';

class SoNguyen{
  List<int> soNguyen=List(20);
  List<int> soNguyento=[];
 Map<String,dynamic> map={};
 Random random=new Random();
  void laySo(){
    for(int i=0;i<soNguyen.length;i++){
      soNguyen[i]=random.nextInt(50);
    }
  }
  void hienThi(){
map.addAll({'songuyen':soNguyen});
    print('so Nguyen:${map['songuyen']}');
  }
  void soNguyenTo(){
     for(int i=0;i<soNguyen.length;i++){
          if(kiemTra(soNguyen[i])){
           soNguyento.add(soNguyen[i]);
      }
     }
     map.addAll({'soNguyento':soNguyento});
     print('so Nguyen To:${map['soNguyento']}');
  }
  bool kiemTra(int value){
if(value==2){
  return true;
}
    if(value<2){
      return false;
    }
    else{
      for(int i=2;i<value;i++){
        if(value%i==0){
          return false;
        }
      }
    }
    return true;
  }
void sapXep(){
    soNguyen.sort();
    hienThi();
}
void thayThe(){
    int vitri=random.nextInt(20);
    print('Thay The Vi tri Thu ${vitri}');
    soNguyen[vitri]=random.nextInt(100);
    hienThi();
  }
}
void main(){
  SoNguyen t=new SoNguyen();
  t.laySo();
  print('Hien Thi');
  t.hienThi();
  print('Danh Sach So Nguyen To');
  t.soNguyenTo();
  print('Sắp Xếp');
  t.sapXep();
  t.thayThe();

}