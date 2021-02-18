import 'bai3.dart';

void main()
{
  SanPham sp = SanPham();
  sp.nhap();
  print('Neu ban het se lai ${sp.banHet()}');
  if(sp.ban2_3()<0)
    print('Neu ban 2/3 se lo ${sp.ban2_3()*-1}');
  else
    print('Neu ban 2/3 se lai ${sp.ban2_3()}');
}