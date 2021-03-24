
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Pages/home_page/home_page.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Pages/products_page/products_page.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Pages/welcome_page/welcome_page.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai2/Layout/Index.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai3/Thong_tin.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai3/Widets/History.dart';
class Buoi6Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.buoi6Bai1welcome:(context)=>WelcomePage(),
      RouteList.buoi6Bai1index:(context)=>HomePage(),
      RouteList.buoi6Bai1thongTin:(context)=>ProductPage(),
      //bai2
      RouteList.buoi6bai2index:(context)=>indexbai2(),
      //bai3
      RouteList.buoi6bai3thongtinkhachhang:(context)=>thongTinKhachhang(),
      RouteList.buoi6bai3history:(context)=>history(),
    };
  }
}
