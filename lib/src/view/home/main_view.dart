import 'package:egomoya/src/repo/celeb_repo.dart';
import 'package:egomoya/src/repo/image_repo.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/home/main_view_model.dart';
import 'package:egomoya/theme/component/main_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: MainViewModel(
        celebRepo: context.read<CelebRepo>(),
        imageRepo: context.read<ImageRepo>(),
      ),
      builder: (context, viewModel) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                const MainSliverAppBar(),
              ];
            },
            body: ListView.builder(
              itemCount: 1,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 20,
              ),
              itemBuilder: (context, index) {
                return Text('${viewModel.celebList}');
              },
            ),
          ),
        );
      },
    );
  }
}
