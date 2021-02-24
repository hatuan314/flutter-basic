Future<int> getData() async {
  print('loading, đang tính 20x5');
  await Future.delayed(Duration(seconds: 3));
  /// need time to process
  return 20*5;
}

void main() async {
// đảm bảo getDAta chạy xong, thì thông báo lấy dữ liệu thành công
  print('Start');
  int luong=0;
  luong = await getData();
  luong = luong+5;
  print('luong = $luong');










  getData().then((value) async {
    print('luong = ${value + 5}');
    /// need time to process
  }).whenComplete(() {
    print('Đã xử lí xong');
  });
}
