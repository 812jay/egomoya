import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/post/post_list_view_model.dart';
import 'package:egomoya/theme/component/app_bar/main_app_bar.dart';
import 'package:egomoya/theme/component/box/question_box.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:egomoya/theme/res/palette.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: PostListViewModel(),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: const MainAppBar(),
          body: SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('최신순'),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 30,
                    ),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 13),
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return QuestionBox(
                        onTap: () => Navigator.pushNamed(
                          context,
                          RoutePath.questionDetail,
                          arguments: index,
                        ),
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
          floatingActionButton: Button(
            onPressed: () => Navigator.pushNamed(
              context,
              RoutePath.questionAdd,
            ),
            backgroundColor: Palette.black,
            color: Palette.white,
            text: '글쓰기',
          ),
        );
      },
    );
  }
}
