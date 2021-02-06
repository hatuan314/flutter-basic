import 'dart:io';
import 'dart:math';

main()
{
  stdout.write('m = ');
  int m = int.parse(stdin.readLineSync());
  stdout.write('n = ');
  int n = int.parse(stdin.readLineSync());
  var matr = new Matrix(m, n);
  matr.show_matrix();
  matr.duong_cheo_chinh();
  matr.in_hang(2);
  matr.chinh_phuong_cua_cot(2);
  print(matr.tong_hang(2));
}



class Matrix
{
  int m;
  int n;
  List<List> matr = new List.empty(growable: true);
  Matrix(this.m,this.n)
  {
    for(int i=0;i<m;i++)
    {
      List ele = new List.empty(growable:true);
      for(int j=0;j<n;j++)
      {
        stdout.write('matrix[$i][$j] = ');
        ele.add(int.parse(stdin.readLineSync()));
        
      }
      matr.add(ele);
    }
  }
  void chinh_phuong_cua_cot(int i)
  {
    stdout.write('\ncac so chinh phuong cua cot $i la : ');
    i=i-1;
    for(int j=0;j<m;j++)
    {
      if(chinh_phuong(matr[j][i]))stdout.write(matr[j][i].toString()+' ');
    }
  }
  bool chinh_phuong(int i)
  {
    if(pow(sqrt(i), 2)==i) return true;
    return false;
  }
  void duong_cheo_chinh()
  {
    stdout.write('\nduong cheo chinh : ');
    int len;
    if(m>n)len=n;else len=m;
    for(int i=0;i<len;i++)stdout.write(matr[i][i].toString()+' ');
  }
  void in_hang(int i)
  {
    stdout.write('\nhang $i : ');
    i=i-1;
    matr[i].forEach((element) {stdout.write(element.toString()+' ');});
  }
  int tong_hang(int i)
  {
    stdout.write('\ntong hang $i : ');
    i=i-1;
    int sum=0;
    matr[i].forEach((element) {sum=sum+element;});
    return sum;
  }
  void show_matrix()
  {
    if(m>0&&n>0)
    {
      for(int i=0;i<m;i++)
      {
        for(int j=0;j<n;j++)
        {
          stdout.write(matr[i][j].toString()+' ');
        }
        print('');
      }
    }
  }
}