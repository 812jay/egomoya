import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/post/post_list_view_model.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:egomoya/theme/component/box/question_box.dart';
import 'package:flutter/material.dart';

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: PostListViewModel(),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: const BaseAppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('최신순'),
                  ],
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return QuestionBox(
                        title: 'title$index',
                        content: 'content$index',
                        writedAt:
                            DateTime.now().subtract(const Duration(days: 6)),
                        commentCnt: 3,
                      );
                    },
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
