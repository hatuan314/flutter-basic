import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi5/screen_1.dart';
import 'package:flutter_basic_app/presentation/journey/buoi5/screen_2.dart';

class Buoi5Routes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.b5Src1: (context) {
        return B5Screen1();
      },
      RouteList.b5Src2: (context) => B5Screen2(),
    };
  }

  // static Map<String, WidgetBuilder> getRoutesWithSettings(
  //     RouteSettings settings) {
  //   final args = settings.arguments as Map<String, dynamic> ?? {};
  //
  //   return {
  //     RouteList.loginVerifyCode: (context) {
  //       final phone = args[VerifyOtpConstant.keyArgPhone];
  //       final id = args[VerifyOtpConstant.keyArgVerifyId];
  //       return BlocProvider(
  //         create: (_) => OtpBoxBloc(),
  //         child: VerifyOTPScreen(phone, id),
  //       );
  //     },
  //     RouteList.createDevicePIN: (context) {
  //       return BlocProvider(
  //           create: (_) => Injector.resolve<CreatePinBloc>(),
  //           child: CreatePINScreen(
  //               settingsEntity: args[KeyConstants.userSettingsKey]));
  //     },
  //     RouteList.enterPIN: (context) {
  //       final isDeletePassCode = args[SecurityMenuConstants.deletePassCodeKey];
  //       final previousRoute = args[KeyConstants.argPreviousRouteKey];
  //       final userSettings = args[KeyConstants.userSettingsKey];
  //
  //       return BlocProvider(
  //           create: (_) => Injector.resolve<EnterPinBloc>()
  //             ..add(EnterPinInitialEvent(previousRoute: previousRoute)),
  //           child: EnterPINScreen(
  //               previousRoute: previousRoute,
  //               newSettings: userSettings,
  //               isDeletePassCode: isDeletePassCode));
  //     },
  //     RouteList.createProfile: (context) {
  //       final currentRoute = args[KeyConstants.routeKey];
  //       return BlocProvider(
  //         create: (_) => Injector.resolve<ProfileBloc>(),
  //         child: CreateProfileScreen(currentRoute: currentRoute),
  //       );
  //     }
  //   };
  // }
}
