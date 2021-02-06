class A {
  void m() {
    print("method m");
  }
}

mixin MyMixin {
  void f(){
    print("method f");
  }
}

mixin MyMixin2 {
  void f(){
    print("method f2");
  }
}

class B extends A with MyMixin2,MyMixin{

}
void main()
{
  B b= B();
  b.f();
  b.m();
}
