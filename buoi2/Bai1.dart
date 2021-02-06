import 'dart:math';
main()
{
  var bai1 = Bai1.empty();
  bai1.thap_phan(1.125);
}
class Bai1
{
  int a;
  int b;
  Bai1(this.a,this.b);
  Bai1.empty();

  void show()
  {
    print(a.toString()+'/'+b.toString());
  }
  void rut_gon()
  {
    print((a/gcd(a,b)).toInt().toString()+'/'+(b/gcd(a,b)).toInt().toString());
  }
  int gcd(int a, int b)
  {
    if(b==0)return a;
    return gcd(b,a%b);
  }
  void sum()
  {
    print('a+b = '+(a+b).toString());
  }
  void sub()
  {
    print('a-b = '+(a-b).toString());
  }
  void div()
  {
    print('a/b = '+(a/b).toString());
  }
  void mul()
  {
    print('a*b = '+(a*b).toString());
  }
  void thap_phan(double c )
  {
    int mau = pow(10,c.toString().length);
    set_a((c*mau).toInt());
    set_b(mau);
    rut_gon();
  }
  


  void set_a(int a )
  {
    this.a=a;
  }  
  void set_b(int b)
  {
    this.b=b;
  }
  int get_a()
  {
    return a;
  }
  int get_b()
  {
    return b;
  }

}