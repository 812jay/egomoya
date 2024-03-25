import 'package:egomoya/src/view/home/home_view.dart';
import 'package:egomoya/src/view/question/question_add_view.dart';
import 'package:egomoya/src/view/sign_in/sign_in_view.dart';
import 'package:egomoya/theme/component/constrained_screen.dart';
import 'package:flutter/material.dart';

abstract class RoutePath {
  static const String home = 'home';
  static const String signIn = 'signIn';
  static const String questionAdd = 'questionAdd';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final Widget page;
    switch (settings.name) {
      case RoutePath.home:
        page = const HomeView();
        break;
      case RoutePath.signIn:
        page = const SignInView();
        break;
      case RoutePath.questionAdd:
        page = const QuestionAddView();
        break;
    }
    return MaterialPageRoute(
      builder: (context) => ConstrainedScreen(child: page),
    );
  }
}
