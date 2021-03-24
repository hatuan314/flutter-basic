


import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/bai1/constrants/route_constantsbuoi7bai1.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/bai1/src/Images_Page/images_page.dart';


import 'bai1/src/home_page/home_page.dart';
class Buoi7Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      Routebai1.home_page:(context)=>home_page(),
      Routebai1.img:(context)=>image_Page(),
    };
  }
}
