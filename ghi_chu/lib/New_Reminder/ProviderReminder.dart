
import 'package:flutter/foundation.dart';

class providerReminder with ChangeNotifier, DiagnosticableTreeMixin{
        String title='';
        String note='';
        var valuestime;
      static var getluestime;
        bool butoon=false;
        void bottonAdd(String title){
          if(title.length>0){
            butoon=true;
          }
          notifyListeners();
        }
        void getvaluetime(var values){
          valuestime=values;
          print('$valuestime');
    getluestime=valuestime;
    notifyListeners();
  }
        void getvalue(String title,String node){
          this.title=title;
          this.note=note;
        }
}