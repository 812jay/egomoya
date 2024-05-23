import 'package:egomoya/src/model/main/main_category.dart';
import 'package:egomoya/src/repo/celeb_repo.dart';
import 'package:egomoya/src/repo/image_repo.dart';
import 'package:egomoya/src/repo/question_repo.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/celeb_service.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/home/main_view_model.dart';
import 'package:egomoya/src/view/home/page/celeb_view.dart';
import 'package:egomoya/src/view/home/page/home_view.dart';
import 'package:egomoya/src/view/home/page/question_view.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
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
        userRepo: context.read<UserRepo>(),
        questionRepo: context.read<QuestionRepo>(),
        userService: context.read<UserService>(),
        celebService: context.read<CelebService>(),
      ),
      builder: (context, viewModel) {
        List<Widget> pageList = [
          HomeView(
            celebList: viewModel.celebList,
            questionList: viewModel.questionList,
            onTapCategory: (index) => viewModel.onTapCategory(index),
            onTapQuestion: (questionId) => viewModel.navigateToQuestionDetail(
              context,
              questionId: questionId,
            ),
          ),
          CelebView(
            celebList: viewModel.selectedCelebList,
            selectedCelebCategory: viewModel.selectedCelebCategory,
            onTapCelebCategory: viewModel.onTapCelebCategory,
          ),
          const QuestionView(),
        ];
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                MainSliverAppBar(
                  user: viewModel.user,
                ),
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                    context,
                  ),
                  sliver: SliverPersistentHeader(
                    delegate: MainHeaderDelegate(
                      itemCnt: viewModel.categoryList.length,
                      categoryList: viewModel.categoryList,
                      onTapCategory: (index) => viewModel.onTapCategory(index),
                    ),
                  ),
                ),
              ];
            },
            floatHeaderSlivers: true,
            body: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pageList.length,
              itemBuilder: (context, index) {
                return pageList[viewModel.selectedCategoryIndex];
              },
            ),
          ),
          floatingActionButton: viewModel.selectedCategoryIndex == 2
              ? Button.iconText(
                  context,
                  iconPath: AssetIconType.pencel.path,
                  onTap: () => viewModel.navigateToQuestionAdd(context),
                  text: '글쓰기',
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}

class MainHeaderDelegate extends SliverPersistentHeaderDelegate {
  MainHeaderDelegate({
    required this.itemCnt,
    required this.categoryList,
    required this.onTapCategory,
  });
  final int itemCnt;
  final List<MainCategory> categoryList;
  final void Function(int) onTapCategory;
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      height: 50,
      decoration: BoxDecoration(color: context.color.white),
      padding: const EdgeInsets.only(left: 20),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCnt,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categoryList[index];
          return Button.category(
            context,
            text: category.title,
            isActive: category.isActive,
            onTap: () => onTapCategory(index),
          );
        },
      ),
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
