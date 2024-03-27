import 'package:egomoya/src/repository/post_repo.dart';
import 'package:egomoya/src/service/image_service.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/home/home_view.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => PostRepo(),
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
              builder: (context) => child ?? const HomeView(),
            )
          ],
        );
      },
      theme: context.themeService.themeData,
      initialRoute: RoutePath.home,
      onGenerateRoute: RoutePath.onGenerateRoute,
    );
  }
}
