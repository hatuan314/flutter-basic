import 'dart:collection';

void main()
{
  List a = List(); //growable
  // Map hoạt động theo key : value
  Map  mapInfo= {
    'hoTen' : 'Pham Doan Hieu',
    'lop': 'CT3D',
  };
  Map<String,dynamic>  mapInfo2= {
    'hoTen' : 'Pham Doan Hieu',
    'lop': 'CT3D',
    'soDienThoai': ['0941716670','123456789']
  };

  print('$mapInfo2');

  ///JSON

}