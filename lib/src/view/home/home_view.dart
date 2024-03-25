import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/home/home_view_model.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: HomeViewModel(),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutePath.signIn);
                  },
                  child: const Text('로그인'),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      RoutePath.questionAdd,
                    ),
                    child: const Text('게시글 등록'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
