// ignore_for_file: constant_identifier_names
import 'package:expensify/screens/auth/signin.dart';
import 'package:expensify/screens/auth/signup.dart';
import 'package:expensify/screens/onboarding/on_boarding_view.dart';
import 'package:expensify/screens/onboarding/startup_view.dart';
import 'package:expensify/screens/pages/homescreen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String ROUTE_SPLASH = '/splash_screen';
  static const String ON_BOARDING_SCREEN = "/on_boarding_scrren";
  static const String SIGN_IN_SCREEN = '/sign_in_screen';
  static const String SIGN_UP_SCREEN = '/sign_up_screen';
  static const String HOME_SCREEN = "/home_screen";

  static Map<String, WidgetBuilder> getRoute() => {
    ROUTE_SPLASH: (context) => StartupView(),
    ON_BOARDING_SCREEN: (context) => OnBoardingView(),
    SIGN_IN_SCREEN: (context) => SignInPage(),
    SIGN_UP_SCREEN: (context) => SignUpPage(),
    HOME_SCREEN: (context) => Homescreen(),
  };
}
