import 'package:egomoya/src/repo/celeb_repo.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/home/home_view.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(providers: [
      Provider(
        create: (context) => CelebRepo(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeService(),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) => child ?? const HomeView(),
            )
          ],
        );
      },
      initialRoute: RoutePath.splash,
      theme: context.themeService.themeData,
      onGenerateRoute: RoutePath.onGenerateRoute,
    );
  }
}


// import 'package:egomoya/legacy/src/model/comment_model.dart';
// import 'package:egomoya/legacy/src/model/post_model.dart';
// import 'package:egomoya/legacy/src/model/user_model.dart';
// import 'package:egomoya/legacy/src/service/dialog_service.dart';
// import 'package:egomoya/legacy/src/service/post_service.dart';
// import 'package:egomoya/legacy/src/service/theme_service.dart';
// import 'package:egomoya/legacy/src/view/main/main_view.dart';
// import 'package:egomoya/legacy/util/helper/perf_helper.dart';
// import 'package:egomoya/legacy/util/route_path.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final prefs = await SharedPreferences.getInstance();
//   runApp(
//     const MyApp(),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       navigatorKey: navigatorKey,
//       debugShowCheckedModeBanner: false,
//       builder: (context, child) {
//         return Overlay(
//           initialEntries: [
//             OverlayEntry(
//               builder: (context) => child ?? const MainView(),
//             )
//           ],
//         );
//       },
//       initialRoute: RoutePath.splash,
//       onGenerateRoute: RoutePath.onGenerateRoute,
//     );
//   }
// }
