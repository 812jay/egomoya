import 'package:egomoya/src/model/comment_model.dart';
import 'package:egomoya/src/model/post_model.dart';
import 'package:egomoya/src/model/user_model.dart';
import 'package:egomoya/src/service/dialog_service.dart';
import 'package:egomoya/src/service/image_service.dart';
import 'package:egomoya/src/service/post_service.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/main/main_view.dart';
import 'package:egomoya/util/helper/perf_helper.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  var prefHelper = PrefHelper(prefs);
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => UserModel(prefHelper),
        ),
        Provider(
          create: (context) => PostModel(prefHelper),
        ),
        Provider(
          create: (context) => CommentModel(prefHelper),
        ),
        ChangeNotifierProvider(
          create: (context) => PostService(context.read()),
        ),
        ChangeNotifierProvider(
          create: (context) => DialogService(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeService(),
        ),
        ChangeNotifierProvider(
          create: (context) => ImageService(),
        ),
      ],
      child: const MyApp(),
    ),
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
              builder: (context) => child ?? const MainView(),
            )
          ],
        );
      },
      theme: context.themeService.themeData,
      initialRoute: RoutePath.splash,
      onGenerateRoute: RoutePath.onGenerateRoute,
    );
  }
}
