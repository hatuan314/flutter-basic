class UserInfo{
  Map<String, dynamic> _data= {
    'hoTen' : 'Pham Doan Hieu',
    'lop': 'CT3D',
};


  Map<String, dynamic> get data => _data;

  void xuatData()
  {
    _data.forEach((key, value) {
      print('$key = $value');
    });
  }
}
void main()
{
  UserInfo userInfo = UserInfo();/*
  print('ho ten la: ${userInfo.data['hoTen']}');
  userInfo.data['hoTen'] = 'Nguyen Van Minh';
  print('ho ten la: ${userInfo.data['hoTen']}');*/
  print('${userInfo.data.containsKey('hoTen')}');
  //userInfo.xuatData();
}