 import 'dart:io';

class bai12 {
  static List tichmatran=new List.generate(100, (index)=>List(100));
 
  static void nhapmangA(List a,int n){
  for(int i=0;i<n;i++)
  {
       for(int j=0;j<n;j++)
       {
           print("a[$i][$j]=");
           a[i][j]=int.parse(stdin.readLineSync());
       }
  }
  }
  static void nhapmangB(List b,int n){
  for(int i=0;i<n;i++)
  {
       for(int j=0;j<n;j++)
       {
         print("a[$i][$j]=");
         b[i][j]=int.parse(stdin.readLineSync());
       }
  }
  }
  static void tich(List a,int n,List b){
  for(int i=0;i<n;i++)
  {
       for(int j=0;j<n;j++)
       {
         tichmatran[i][j]=0;
         for(int k=0;k<n;k++)
         {
          tichmatran[i][j]=tichmatran[i][j]+a[i][k]*b[k][j];
         }
       }
  }
  int g=1;
  for(int i=0;i<n;i++)
  {
      for(int j=0;j<n;j++)
      {
        if(i==j)
        {
           g=g*tichmatran[i][j];
        }
      }
  }
  if(g==1)
  {
    print("B la ma tran nghic dao cau A");
  }
  else
    {
        print("B khong phai la ma tran nghich dao cua A");
    }
  }
}
  void main(){
 int n;
 print("nhap kich co cua 2 ma tran A va B");
 n=int.parse(stdin.readLineSync());
 List<List<num>> a=new List.generate(n, (index)=>List(n));
 List<List<num>> b=new List.generate(n, (index)=>List(n));
 print("nhap cac phan tu cua ma tran A:");
 bai12.nhapmangA(a,n);
 print("nhap cac phan tu cua ma tran B:");
 bai12.nhapmangB(b,n);
 bai12.tich(a,n,b);
 }