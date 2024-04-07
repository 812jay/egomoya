import 'dart:developer';

import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/util/app_theme.dart';
import 'package:egomoya/util/helper/perf_helper.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({
    super.key,
  });

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initRoute();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_icon.png',
              width: 60,
            ),
            const SizedBox(height: 30),
            Image.asset(
              'assets/images/logo_text.png',
              width: 260,
            ),
            const SizedBox(height: 30),
            Text(
              '셀럽들의 아이템, 궁금하다면',
              style: context.typo.subTitle2.pointColor,
            )
          ],
        ),
      ),
    );
  }

  Future<void> initRoute() async {
    final prefs = await SharedPreferences.getInstance();
    var prefHelper = PrefHelper(prefs);
    final String userId = prefHelper.userId;
    await Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        log('userId: $userId');
        if (userId.isNotEmpty) {
          Navigator.pushReplacementNamed(context, RoutePath.main);
        } else {
          Navigator.pushReplacementNamed(context, RoutePath.signIn);
        }
      },
    );
  }
}
