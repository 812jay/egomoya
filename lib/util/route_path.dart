import 'package:egomoya/src/view/home/main_view.dart';
import 'package:egomoya/src/view/profile/edit_profile_view.dart';
import 'package:egomoya/src/view/profile/edit_profile_view_model.dart';
import 'package:egomoya/src/view/profile/profile_view.dart';
import 'package:egomoya/src/view/profile/profile_view_model.dart';
import 'package:egomoya/src/view/question/question_add_view.dart';
import 'package:egomoya/src/view/question/question_add_view_model.dart';
import 'package:egomoya/src/view/question/question_detail_view.dart';
import 'package:egomoya/src/view/question/question_detail_view_model.dart';
import 'package:egomoya/src/view/sign_in/sign_in_view.dart';
import 'package:egomoya/src/view/sign_up/sign_up_view.dart';
import 'package:egomoya/src/view/sign_up/sign_up_view_model.dart';
import 'package:egomoya/src/view/splash_view.dart';
import 'package:egomoya/theme/component/constraint_view.dart';
import 'package:flutter/material.dart';

abstract class RoutePath {
  static const String splash = 'splash';
  static const String main = 'main';
  static const String signIn = 'signIn';
  static const String signUp = 'signUp';
  static const String profile = 'profile';
  static const String editProfile = 'editProfile';
  static const String questionAdd = 'questionAdd';
  static const String questionDetail = 'questionDetail';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final Widget page;
    switch (settings.name) {
      case RoutePath.splash:
        page = const SplashView();
        break;
      case RoutePath.main:
        page = const MainView();
        break;
      case RoutePath.signIn:
        page = const SignInView();
        break;
      case RoutePath.signUp:
        final args = settings.arguments as SignUpViewArgument;
        page = SignUpView(args: args);
        break;
      case RoutePath.profile:
        final args = settings.arguments as ProfileViewArgument;
        page = ProfileView(args: args);
        break;
      case RoutePath.editProfile:
        final args = settings.arguments as EditProfileViewArgument;
        page = EditProfileView(args: args);
        break;
      case RoutePath.questionAdd:
        final args = settings.arguments as QuestionAddViewArgument;
        page = QuestionAddView(args: args);
        break;
      case RoutePath.questionDetail:
        final args = settings.arguments as QuestionDetailViewArgument;
        page = QuestionDetailView(args: args);
        break;
    }
    return MaterialPageRoute(
      builder: (context) => ConstrainedView(child: page),
    );
  }
}
