import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7_gridview/learn_grid_view.dart';
import 'package:flutter_basic_app/presentation/journey/buoi8_state/counter_provider.dart';
import 'package:flutter_basic_app/presentation/journey/buoi8_state/splash_screen.dart';
import 'package:flutter_basic_app/presentation/journey/buoi8_state/provider_screen.dart';
import 'package:provider/provider.dart';

class Buoi8Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.b8Splash: (context) => SplashScreen(),
      RouteList.b8Scr1: (context) => MultiProvider(providers: [
            ChangeNotifierProvider(create: (context) => CounterProvider())
          ], child: ProviderScreen()),
    };
  }
}
