import 'package:egomoya/src/view/main/main_view.dart';
import 'package:egomoya/src/view/post/post_list_view.dart';
import 'package:egomoya/src/view/question/question_add_view.dart';
import 'package:egomoya/src/view/question/question_detail_view.dart';
import 'package:egomoya/src/view/sign_in/sign_in_view.dart';
import 'package:egomoya/src/view/sign_up/sign_up_view.dart';
import 'package:egomoya/theme/component/constrained_screen.dart';
import 'package:flutter/material.dart';

abstract class RoutePath {
  static const String main = 'main';
  static const String signIn = 'signIn';
  static const String signUp = 'signUp';
  static const String postList = 'postList';
  static const String questionAdd = 'questionAdd';
  static const String questionDetail = 'questionDetail';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final Widget page;
    switch (settings.name) {
      case RoutePath.main:
        page = const MainView();
        break;
      case RoutePath.signIn:
        page = const SignInView();
        break;
      case RoutePath.signUp:
        page = const SignUpView();
        break;
      case RoutePath.postList:
        page = const PostListView();
        break;
      case RoutePath.questionAdd:
        page = const QuestionAddView();
        break;
      case RoutePath.questionDetail:
        final int postId = settings.arguments as int;
        page = QuestionDetailView(
          postId: postId,
        );
        break;
    }
    return MaterialPageRoute(
      builder: (context) => ConstrainedScreen(child: page),
    );
  }
}
