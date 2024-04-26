import 'package:egomoya/src/view/home/main_view.dart';
import 'package:egomoya/src/view/splash_view.dart';
import 'package:egomoya/theme/component/constraint_view.dart';
import 'package:flutter/material.dart';

abstract class RoutePath {
  static const String splash = 'splash';
  static const String main = 'main';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final Widget page;
    switch (settings.name) {
      case RoutePath.splash:
        page = const SplashView();
        break;
      case RoutePath.main:
        page = const MainView();
        break;
    }
    return MaterialPageRoute(
      builder: (context) => ConstrainedView(child: page),
    );
  }
}
