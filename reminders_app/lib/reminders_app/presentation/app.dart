import 'package:flutter/material.dart';

import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:reminders_app/reminders_app/common/constants/route_constants.dart';

import 'routes.dart';

class MyApp extends StatelessWidget {
  String get initialRoute {
    return RouteList.b10HomeScreen;
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
     ///  home: (build=>Navigator.pushNamed(context, RouteList.b10HomeScreen)) ,
      routes: Routes.getAll(),
      initialRoute: initialRoute,
    )
    );
  }
}

