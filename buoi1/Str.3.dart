import 'dart:io';

main(List<String> args) {
  String s=null;
  while(true)
  {
    
    print('1. Nhap chuoi');
    print('2. In hoa');
    print('3. In thuong'); 
    print('Lua chon : ');
    switch(stdin.readLineSync()){
      case '1' :
      {
        if(s!=null)
        {
          print(s.toUpperCase());
        }
        break;
      }
      case '2':
      {
        if(s!=null)
        {
          print(s.toLowerCase());
        }
        break;
      }
      case '3':
      {
        exit(0);
        break;
      }
      default:break;
    }

  }
}