import 'dart:io';

Future<int> nhap() async {
  int a,b;
  print('Nhap a');
  a=int.parse(stdin.readLineSync());
  print('nhap b');
  b=int.parse(stdin.readLineSync());
 await Future.delayed(Duration(seconds: 5));
 return a+b;
}
void main(){
  print('Tint Tong 2 so');
  nhap().then((value) {
    print('TOng:${value}');
  }).whenComplete(() {
    print('Da Xong');
  });

}