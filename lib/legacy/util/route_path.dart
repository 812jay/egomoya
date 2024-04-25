// import 'package:egomoya/legacy/src/data/dto/post/post.dart';
// import 'package:egomoya/legacy/src/view/main/main_view.dart';
// import 'package:egomoya/legacy/src/view/profile/profile_view.dart';
// import 'package:egomoya/legacy/src/view/profile/profile_view_model.dart';
// import 'package:egomoya/legacy/src/view/question/question_add_view.dart';
// import 'package:egomoya/legacy/src/view/question/question_detail_view.dart';
// import 'package:egomoya/legacy/src/view/sign_in/sign_in_view.dart';
// import 'package:egomoya/legacy/src/view/sign_up/sign_up_view.dart';
// import 'package:egomoya/legacy/src/view/sign_up/sign_up_view_model.dart';
// import 'package:egomoya/legacy/src/view/splash_view.dart';
// import 'package:egomoya/legacy/theme/component/constrained_screen.dart';
// import 'package:flutter/material.dart';

// abstract class RoutePath {
//   static const String splash = 'splash';
//   static const String main = 'main';
//   static const String signIn = 'signIn';
//   static const String signUp = 'signUp';
//   static const String profile = 'profile';
//   static const String questionAdd = 'questionAdd';
//   static const String questionDetail = 'questionDetail';

//   static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
//     late final Widget page;
//     switch (settings.name) {
//       case RoutePath.splash:
//         page = const SplashView();
//         break;
//       case RoutePath.main:
//         page = const MainView();
//         break;
//       case RoutePath.signIn:
//         page = const SignInView();
//         break;
//       case RoutePath.signUp:
//         final SignUpViewArgument? args =
//             settings.arguments as SignUpViewArgument?;
//         page = SignUpView(args: args);
//         break;
//       case RoutePath.profile:
//         final ProfileViewArgument args =
//             settings.arguments as ProfileViewArgument;
//         page = ProfileView(args: args);
//         break;
//       case RoutePath.questionAdd:
//         final PostData? postData = settings.arguments as PostData?;
//         page = QuestionAddView(
//           postData: postData,
//         );
//         break;
//       case RoutePath.questionDetail:
//         final int postId = settings.arguments as int;
//         page = QuestionDetailView(
//           postId: postId,
//         );
//         break;
//     }
//     return MaterialPageRoute(
//       builder: (context) => ConstrainedScreen(child: page),
//     );
//   }
// }
