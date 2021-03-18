import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/routes.dart';
import 'package:flutter_screenutil/screenutil_init.dart';

class MyApp extends StatelessWidget {
  String get initialRoute {
    return RouteList.listScreen;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(400, 700),
      allowFontScaling: true,
      builder: () => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'MS'
      ),
      // home: Screen2(),
      routes: Routes.getAll(),
      initialRoute: initialRoute,
    )
    );
  }
}

