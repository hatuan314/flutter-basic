import 'dart:io';

import 'person.dart';
import 'student.dart';
import 'teacher.dart';

void main() {
  while (true) {
    menu();
    int chon = int.parse(stdin.readLineSync());
    switch (chon) {
      case 1:
        Student sv = Student();
        Teacher gv = Teacher();
        sv.import();
        gv.import();
        print(sv.toString()+'\n'+gv.toString());
        break;
      case 2:
        Student sv = Student();
        Teacher gv = Teacher();
        sv.import();
        gv.import();
        if(sv.major==gv.major)
          {
            print(' sinh viên có cơ hội học giảng viên');
          }
        else
          {
            print(' sinh viên không có cơ hội học giảng viên');
          }
        break;
      case 3:
        List <Person>ds =[];
        for(int i=0;i<2;i++)
          {
            Student sv = Student();
            sv.import();
            ds.add(sv);
          }
        for(int i=0;i<2;i++)
          {
              Teacher gv = Teacher();
            gv.import();
            ds.add(gv);
          }
        for(var x in ds)
          if(x.gender.toUpperCase()!='NAM')
              print(x.toString());
          break;
    }
  }
}

void menu() {
  print('1. Nhập 1 học sinh và 1 giảng viên. Sau đó in thông tin của học sinh, giảng viên đó.');
  print('2. Nhập thông tin của 1 học sinh và 1 giảng viên. Hỏi liệu học sinh đó có cơ hội học giảng viên đó không? ');
  print('3. Nhập thông tin của 2 học sinh và 2 giảng viên. In thông tin của giảng viên và học sinh có giới tính là nữ.');
  print('Nhập chức năng: ');
}
