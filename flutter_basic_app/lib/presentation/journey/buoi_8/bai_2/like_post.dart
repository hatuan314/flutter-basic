import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Like with ChangeNotifier,DiagnosticableTreeMixin
{
  bool like = false;
  void likePost()
  {
    like=true;
    notifyListeners();
  }
  void unlikePost()
  {
    like=false;
    notifyListeners();
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(FlagProperty('like', value: like));
  }
}