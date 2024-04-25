import 'package:egomoya/src/repo/celeb_repo.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView(
        viewModel: HomeViewModel(celebRepo: context.read<CelebRepo>()),
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
