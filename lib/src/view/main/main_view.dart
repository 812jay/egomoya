import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/main/main_view_model.dart';
import 'package:egomoya/src/view/main/widget/post_title.dart';
import 'package:egomoya/theme/component/box/question_box.dart';
import 'package:egomoya/theme/component/button/category_button.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
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
          _MainHome(
            onTapQuestionCategory: (index) => viewModel.onTapCategory(index),
          ),
          const _MainCelebrity(),
          const _MainQuestion(),
        ];
        return Scaffold(
          body: SafeArea(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  const _MainAppBar(),
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                    sliver: SliverPersistentHeader(
                      delegate: MainHeaderDelegate(),
                    ),
                  )
                ];
              },
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Consumer<MainViewModel>(
                  builder: (context, value, child) {
                    return PageView.builder(
                      controller: value.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return pageList[index];
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MainAppBar extends StatelessWidget {
  const _MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      floating: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: AssetIcon(
          'assets/svgs/logo.svg',
          color: context.color.error,
          size: 15,
        ),
      ),
      actions: const [
        AssetIcon(
          'assets/icons/alarm.svg',
          size: 22,
        ),
        SizedBox(width: 20),
        AssetIcon(
          'assets/icons/group.svg',
          size: 22,
        ),
        SizedBox(width: 20),
      ],
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
    required this.onTapQuestionCategory,
  });
  final Function(int index) onTapQuestionCategory;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewModel>(
      builder: (context, value, child) {
        return Column(
          children: [
            PostTitle(
              onTap: () => onTapQuestionCategory(2),
              // onTap: () {},
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
                          arguments: index,
                        ),
                        title: content.title,
                        content: content.content,
                        writedAt: DateTime.now().subtract(
                          const Duration(days: 1),
                        ),
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
