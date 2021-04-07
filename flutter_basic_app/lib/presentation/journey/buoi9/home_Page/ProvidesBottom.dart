import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/screen_util.dart';

class ProvidesBottom with ChangeNotifier, DiagnosticableTreeMixin {
  double witdh1 = ScreenUtil().setWidth(110),
      witdh2 = ScreenUtil().setWidth(55),
      witdh3 = ScreenUtil().setWidth(55),
      witdh4 = ScreenUtil().setWidth(55);
  double opacity1 = 1, opacity2 = 0, opacity3 = 0, opacity4 = 0;
  bool h1 = true, h2 = false, h3 = false, h4 = false;
  void listen(
      double witdh1,
      double witdh2,
      double witdh3,
      double witdh4,
      double opacity1,
      double opacity2,
      double opacity3,
      double opacity4,
      bool h1,
      bool h2,
      bool h3,
      bool h4) {
    this.witdh1 = witdh1;
    this.witdh2 = witdh2;
    this.witdh3 = witdh3;
    this.witdh4 = witdh4;
    this.opacity1 = opacity1;
    this.opacity2 = opacity2;
    this.opacity3 = opacity3;
    this.opacity4 = opacity4;
    this.h1 = h1;
    this.h2 = h2;
    this.h3 = h3;
    this.h4 = h4;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
