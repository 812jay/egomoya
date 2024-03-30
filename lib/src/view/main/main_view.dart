import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/main/main_view_model.dart';
import 'package:egomoya/src/view/main/widget/post_title.dart';
import 'package:egomoya/theme/component/app_bar/main_sliver_app_bar.dart';
import 'package:egomoya/theme/component/box/question_box.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:egomoya/theme/component/button/category_button.dart';
import 'package:egomoya/util/route_path.dart';
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
        List<Widget> pageList = [
          const _MainHome(),
          const _MainCelebrity(),
          const _MainQuestion(),
        ];
        return Scaffold(
          body: SafeArea(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  const MainSliverAppBar(),
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                    sliver: SliverPersistentHeader(
                      delegate: MainHeaderDelegate(),
                    ),
                  ),
                ];
              },
              floatHeaderSlivers: true,
              body: Consumer<MainViewModel>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: 1,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    itemBuilder: (context, index) {
                      return pageList[value.selectedCategoryIndex];
                    },
                  );
                },
              ),
            ),
          ),
          floatingActionButton: Consumer<MainViewModel>(
            builder: (context, value, child) {
              return value.selectedCategoryIndex == 1
                  ? Button(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        RoutePath.questionAdd,
                      ),
                      backgroundColor: context.color.black,
                      color: context.color.white,
                      text: '글쓰기',
                    )
                  : const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}

class MainHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Consumer<MainViewModel>(
      builder: (context, value, child) {
        return Container(
          height: 50,
          decoration: BoxDecoration(color: context.color.white),
          padding: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: value.categoryList.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              return CategoryButton(
                value.categoryList[index].title,
                isActive: value.categoryList[index].isActive,
                index: index,
                onTap: (index) => value.onTapCategory(index),
              );
            },
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class _MainHome extends StatelessWidget {
  const _MainHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewModel>(
      builder: (context, value, child) {
        return Column(
          children: [
            PostTitle(
              onTap: () => value.onTapCategory(2),
              title: '요고 궁금해요 TOP 3',
            ),
            const SizedBox(height: 26),
            value.post?.dataList == null
                ? const Text('none')
                : ListView.separated(
                    shrinkWrap: true,
                    itemCount: value.post!.dataList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 13),
                    itemBuilder: (context, index) {
                      final content = value.post!.dataList[index];
                      return QuestionBox(
                        onTap: () => Navigator.pushNamed(
                          context,
                          RoutePath.questionDetail,
                          arguments: content.postId,
                        ),
                        title: content.title,
                        content: content.content,
                        writedAt: content.createdAt,
                        imgList: content.imageList ?? [],
                        commentCnt: 3,
                      );
                    },
                  ),
          ],
        );
      },
    );
  }
}

class _MainCelebrity extends StatelessWidget {
  const _MainCelebrity({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('_MainCelebrity'),
      ],
    );
  }
}

class _MainQuestion extends StatelessWidget {
  const _MainQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('_MainQuestion'),
      ],
    );
  }
}
