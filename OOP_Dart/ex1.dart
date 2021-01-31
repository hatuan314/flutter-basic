// 1. Khởi tạo đối tượng phân số bao gồm 2 thuộc tính tử số và mẫu số. Sau đó thực hiện các chức năng sau: 1. Nhập vào từ bàn phím 1 phân số bất kì. Hiển thị phân số đó ra màn hình. INPUT: Tử số: 1 Mẫu số: 2 OUTPUT: 1/2
// 2. Nhập vào từ bàn phím 1 phân số bất kì. Hiển thị dạng rút gọn của phân số đó. INPUT: Tử số: 2 Mẫu số: 4 OUTPUT: 1/2
// 3. Nhập vào từ bàn phím 2 phân số a, b bất kì. Thực hiện các phép tính a+b, a-b, a/b, a*b.
// 4. Nhập vào từ bàn phím 1 phân số bất kì. in ra màn hình dạng số thập phân của phân số đó.


import 'dart:io';
import 'dart:math';

int lcm(int a, int b) {
  if ((a == 0) || (b == 0)) {
    return 0;
  }

  return ((a ~/ a.gcd(b)) * b).abs();
}


class fraction {
  int numerator;
  int denominator;
  double value;



  fraction (int numerator, int denominator) {
    this.denominator = denominator;
    this.numerator = numerator;
    this.value = this.numerator/this.denominator;
  }

  display() {
    print('${this.numerator}/${this.denominator}');
  }

  fraction simplify() {
    int d = this.numerator.gcd(this.denominator);
    this.numerator = (this.numerator/(d)).toInt();
    this.denominator = (this.denominator/(d)).toInt();
    return this;
  }


}


void denominator_equalizer(fraction a, fraction b) {
  int lcm1 = lcm(a.denominator, b.denominator);
  int c = (lcm1 ~/ a.denominator);
  int d = (lcm1 ~/ b.denominator);
  a.denominator = a.denominator*c;
  b.denominator = b.denominator*d;
  a.numerator = a.numerator*c;
  b.numerator = b.numerator*d;
}


void operator(fraction a, fraction b) {
  denominator_equalizer(a, b);
  fraction plus = new fraction((a.numerator + b.numerator),a.denominator);
  plus.simplify();
  fraction minus = new fraction((a.numerator - b.numerator),a.denominator);
  minus.simplify();
  a.simplify();
  b.simplify();
  fraction mul = new fraction((a.numerator * b.numerator),(a.denominator * b.denominator));
  fraction div = new fraction((a.numerator * b.denominator),(a.denominator * b.numerator));
  plus.display();
  minus.display();
  mul.display();
  div.display();
}



main() {
  int a = int.parse(stdin.readLineSync());
  int b = int.parse(stdin.readLineSync());
  fraction c = new fraction(a, b);
  fraction d = new fraction(4, 5);
  c.display();
  d.display();
  operator(c, d);
  c.display();
  d.display();
}