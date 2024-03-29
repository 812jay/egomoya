import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/home/home_view.dart';
import 'package:egomoya/src/view/main/main_view_model.dart';
import 'package:egomoya/theme/component/app_bar/main_app_bar.dart';
import 'package:egomoya/theme/component/button/category_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: MainViewModel(
        context.read(),
      ),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: const MainAppBar(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 44,
                      child: Consumer<MainViewModel>(
                          builder: (context, value, child) {
                        return ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: value.categoryList.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 8),
                          itemBuilder: (context, index) {
                            return CategoryButton(
                              value.categoryList[index].title,
                              isActive: value.categoryList[index].isActive,
                              index: index,
                              onTap: value.onTapCategory,
                            );
                          },
                        );
                      }),
                    ),
                    const SizedBox(height: 28),
                    const HomeView(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
