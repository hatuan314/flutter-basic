
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/bai1/app.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/bai2/home_page_bai2/home_page_bai2.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/bai3/list_sp/list_sp.dart';
import 'package:flutter_basic_app/presentation/journey/buoi8/bai1/products_page/ProvidesCount.dart';
import 'package:flutter_basic_app/presentation/journey/buoi8/bai1/products_page/products_page.dart';

import 'package:flutter_basic_app/presentation/journey/learn/home_screen.dart';
import 'package:provider/provider.dart';
import 'list_screen.dart';

class LearnRoutes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.listScreen: (context) => ListScreen(),
      RouteList.homeScreen: (context) => MyHomePage(),
      RouteList.buoi7bai1:(context)=>buoi7bai1(),
      RouteList.buoi7bai2:(context)=>home_pagebai2(),
      RouteList.buoi7bai3:(context)=>list_SP(),
      RouteList.buoi8bai1:(context)=> MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>ProvidesCount(),)
        ],
        child:  buoi8ProductPage(),
      )
    };
  }
}