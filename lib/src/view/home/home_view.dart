import 'package:egomoya/src/model/post_model.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/home/home_view_model.dart';
import 'package:egomoya/src/view/home/widget/post_title.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:egomoya/theme/component/box/question_box.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: HomeViewModel(
        PostModel(),
      ),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: const BaseAppBar(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PostTitle(
                      onTap: () => Navigator.pushNamed(
                        context,
                        RoutePath.postList,
                      ),
                      title: '요고 궁금해요 TOP 3',
                    ),
                    const SizedBox(height: 26),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 13),
                      itemBuilder: (context, index) {
                        return QuestionBox(
                          onTap: () => Navigator.pushNamed(
                            context,
                            RoutePath.questionDetail,
                            arguments: index,
                          ),
                          title: 'title$index',
                          content: 'content$index',
                          writedAt: DateTime.now().subtract(
                            const Duration(days: 1),
                          ),
                          commentCnt: 3,
                        );
                      },
                    )
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
