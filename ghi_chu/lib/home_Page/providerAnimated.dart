import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:ghi_chu/__mock__/costranisn.dart';

class providerAnimated with ChangeNotifier, DiagnosticableTreeMixin{
  constHomePage data;
  providerAnimated(BuildContext context){
    data=constHomePage(context);
    print('${data.list}213221');
  }
  void indate(){
    print('$data');
  }
}