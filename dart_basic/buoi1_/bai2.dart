import 'Dart:math';
main()
{
Random rd= new Random();
List<List<int>> matrix = new List<List<int>>();
taoMang(matrix);
inMang(matrix);
print('Cac phan tu thuoc duong cheo chinh : ');
cheoChinh(matrix);
int n=rd.nextInt(3);
print('Cac so nguyen to trong hang ${n}  : ');
sntTrongHang(matrix,n);
int m=rd.nextInt(3);
print('Cac so chinh phuong trong cot ${m}  : ');
scpTrongCot(matrix,m);
print('Tong cua hang ${n}  : ${tongHang(matrix,n)}');
}
taoMang(List matrix)
{
Random rd= new Random();
for (var i = 0; i < 4; i++) {
List<int> list = new List<int>();

for (var j = 0; j < 4; j++) {
int k=rd.nextInt(100);
list.add(k);
}
matrix.add(list);
}
}
inMang(List matrix)
{
for(int i=0;i<4;i++)
{
print(matrix[i]);
}
}
cheoChinh(List matrix)
{
for(int i=0;i<4;i++)
{
print(matrix[i][i]);
}
}
bool soNguyenTo(int a)
{
if(a<2)
return false;
if(a==2)
return true;
for(int i=2;i<a;i++)
{
if(a%i==0)
return false;
}
return true;
}
sntTrongHang(List matrix,int n)
{
for(int i=0;i<4;i++)
if(soNguyenTo(matrix[n][i]))
{
print(matrix[n][i]);
}

}
bool soChinhPhuong( int n)
{
if(((sqrt(n).toInt())*(sqrt(n).toInt()))==n)
return true;
return false;
}
scpTrongCot(List matrix,int n)
{
for(int i=0;i<4;i++)
if(soChinhPhuong(matrix[i][n]))
{
print(matrix[i][n]);
}
}
int tongHang(List matrix, int n)
{
int sum=0;
for(int i=0;i<4;i++)
sum+=matrix[n][i];
return sum;
}