import 'package:egomoya/src/model/post_model.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/home/home_view_model.dart';
import 'package:egomoya/src/view/home/widget/question_box.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '요고 궁금해요 TOP 3',
                            style: context.typo.subtitle1,
                          ),
                        ),
                        Text(
                          '더 보기',
                          style: context.typo.body2,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                        ),
                      ],
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
                          title: 'title$index',
                          content: 'content$index',
                          writedAt: DateTime.now().subtract(
                            const Duration(days: 364),
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
