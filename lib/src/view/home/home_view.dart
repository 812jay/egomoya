import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/home/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView(
        viewModel: HomeViewModel(),
        builder: (context, viewModel) {
          return SafeArea(
            child: Column(
              children: [
                Text(
                  'hello',
                  style: context.typo.body2,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
