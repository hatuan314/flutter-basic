 import 'dart:io';

 class bai2 {

   static void nhapmang(List a,int n)
  {
  for(int i=0;i<n;i++)
  {
  print("a[${i}]=");
  a[i]=int.parse(stdin.readLineSync());
  }
  }
   static int cong(List a,int n)
  {
  int t=0;
  for(int i=0;i<n;i++){
  t=t+a[i];
  }
  return t;

  }

}
 void main()
 {
   int n;
   n=int.parse(stdin.readLineSync());
   List a=new List(n);
   bai2.nhapmang(a,n);
   print("tong cac phan tu cua mang = ${bai2.cong(a, n)}");
 }