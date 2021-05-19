
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi5/buoi5_routes.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/buoi6_routes.dart';
import 'package:flutter_basic_app/presentation/journey/learn/learn_routes.dart';

import 'journey/buoi_10/b10_routes.dart';
import 'journey/buoi_12/b12_routes.dart';
import 'journey/buoi_7/buoi_7_routes.dart';
import 'journey/buoi_8/buoi_8_routes.dart';
import 'journey/buoi_9/b9_routes.dart';

class Routes {
  static Map<String, WidgetBuilder> _getCombinedRoutes() => {
    ...Buoi5Routes.getAll(),
    ...Buoi6Routes.getAll(),
    ...Buoi7Routes.getAll(),
    ...Buoi8Routes.getAll(),
    ...Buoi9Routes.getAll(),
    ...Buoi10Routes.getAll(),
    ...Buoi12Routes.getAll(),
    ...LearnRoutes.getAll(),
  };

  static Map<String, WidgetBuilder> getAll() => _getCombinedRoutes();

  // static Route<dynamic> generateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case RouteList.loginVerifyCode:
  //     case RouteList.createDevicePIN:
  //     case RouteList.createProfile:
  //       return MaterialPageRoute(
  //           builder: LoginRoutes.getRoutesWithSettings(settings)[settings.name],
  //           settings: settings);
  //     case RouteList.enterPIN:
  //       if (settings.arguments != null) {
  //         return MaterialPageRoute(
  //             builder:
  //             LoginRoutes.getRoutesWithSettings(settings)[settings.name],
  //             settings: settings);
  //       }
  //       return PageRouteBuilder(
  //           pageBuilder: (context, animation, secondaryAnimation) =>
  //               BlocProvider(
  //                   create: (_) => Injector.resolve<EnterPinBloc>()
  //                     ..add(EnterPinInitialEvent()),
  //                   child: EnterPINScreen()));
  //     case RouteList.categoriesList:
  //       return MaterialPageRoute(
  //           builder:
  //           PersonalRoutes.getRoutesWithSettings(settings)[settings.name],
  //           settings: settings);
  //     case RouteList.addGoal:
  //       return MaterialPageRoute<GoalDetailEntity>(
  //           builder: GoalRoutes.getRoutesWithSettings(settings)[settings.name],
  //           settings: settings);
  //     case RouteList.personalExpense:
  //     case RouteList.whoPaid:
  //     case RouteList.forWho:
  //     case RouteList.showImage:
  //     case RouteList.showItemImage:
  //     case RouteList.debt:
  //       return MaterialPageRoute(
  //           builder: TransactionRoutes.getRoutesWithSettings(
  //               settings)[settings.name],
  //           settings: settings);
  //     case RouteList.noti:
  //     case RouteList.home:
  //       return MaterialPageRoute(
  //           builder: HomeRoutes.getRoutesWithSettings(settings)[settings.name],
  //           settings: settings);
  //   }
  // }
}


