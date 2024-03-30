import 'package:egomoya/src/model/post_model.dart';
import 'package:egomoya/src/model/user_model.dart';
import 'package:egomoya/src/repository/post_repo.dart';
import 'package:egomoya/src/service/image_service.dart';
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
          create: (contxt) => UserModel(prefHelper),
        ),
        Provider(
          create: (context) => PostRepo(),
        ),
        Provider(
          create: (contxt) => PostModel(),
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
      initialRoute: RoutePath.main,
      onGenerateRoute: RoutePath.onGenerateRoute,
    );
  }
}
