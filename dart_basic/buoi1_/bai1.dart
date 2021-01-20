main()
{
List a=<int>[13,32,2,6,3,36];
xuatMang(a);
print('Max = ${timMax(a)}');
print('Min = ${timMin(a)}');
print('Cac so chan trong mang : ');
soChan(a);
print('Cac so chia het cho 2 va 3 :');
chiaHetCho2Va3(a);
print('Cac uoc cua max la :');
uocCuaMax(a,timMax(a));
print('Boi cua min la :');
boiCuaMin(a,timMin(a));
}
xuatMang(List a)
{
for(int i=0;i<a.length;i++)
{
print('${a[i]}');
}
}
timMax(List a)
{
int max=a[0];
for(int i=0;i<a.length;i++)
{
if(a[i]>max)
{
max=a[i];
}
}
return max;
}

timMin(List a)
{
int min=a[0];
for(int i=0;i<6;i++)
{
if(a[i]<min)
{
min=a[i];
}
}
return min;
}
soChan(List a)
{
for(int i=0;i<6;i++)
{
if(a[i]%2==0)
print('${a[i]}');
}
}
chiaHetCho2Va3( List a)
{
for(int i=0;i<6;i++)
{
if(a[i]%2==0 && a[i]%3==0)
print('${a[i]}');
}
}
uocCuaMax(List a, int max)
{
for(int i=0;i<6;i++)
{
if(max%a[i]==0)
print('${a[i]}');
}
}

boiCuaMin(List a, int min)
{
for(int i=0;i<6;i++)
{
if(a[i]%min==0)
print('${a[i]}');
}
}