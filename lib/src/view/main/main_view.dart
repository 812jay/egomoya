import 'package:carousel_slider/carousel_slider.dart';
import 'package:egomoya/src/data/dto/celeb/celeb.dart';
import 'package:egomoya/src/data/dto/main/main_category.dart';
import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:egomoya/src/data/enum/celeb_type.dart';
import 'package:egomoya/src/model/user_model.dart';
import 'package:egomoya/src/service/post_service.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/celeb/widget/celeb_card.dart';
import 'package:egomoya/src/view/celeb/widget/celeb_category_form.dart';
import 'package:egomoya/src/view/celeb/widget/celeb_sort_tab.dart';
import 'package:egomoya/src/view/main/main_view_model.dart';
import 'package:egomoya/src/view/main/widget/main_title.dart';
import 'package:egomoya/theme/component/app_bar/main_sliver_app_bar.dart';
import 'package:egomoya/theme/component/box/question_box.dart';
import 'package:egomoya/theme/component/button/button.dart';
import 'package:egomoya/theme/component/button/category_button.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/util/app_theme.dart';
import 'package:egomoya/util/route_path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: MainViewModel(
        context.read<PostService>(),
        context.read<UserModel>(),
      ),
      builder: (context, viewModel) {
        List<Widget> pageList = [
          _MainHome(
            celebList: viewModel.mainCelebList,
            onTapCategory: (index) => viewModel.onTapCategory(index),
            dataList: viewModel.post?.dataList,
          ),
          _MainCeleb(
            celebList: viewModel.selectedCelebPostCategory.isFashion
                ? viewModel.fashionCelebList
                : viewModel.beautyCelebList,
            selectedCelebPostCategory: viewModel.selectedCelebPostCategory,
            onTapCelebCategory: viewModel.onTapCelebCategory,
            onTapCelebSort: viewModel.onTapCelebSort,
            selectedCelebPostSort: viewModel.selectedCelebPostSort,
          ),
          _MainQuestion(
            dataList: viewModel.post?.dataList,
          ),
        ];
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                MainSliverAppBar(isSignedIn: viewModel.isSignedIn),
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
            body: ListView.builder(
              itemCount: 1,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 20,
              ),
              itemBuilder: (context, index) {
                return pageList[viewModel.selectedCategoryIndex];
              },
            ),
          ),
          floatingActionButton: viewModel.selectedCategoryIndex == 2
              ? Button(
                  onPressed: () => viewModel.onTapQuestionAdd(context),
                  backgroundColor: context.color.black,
                  color: context.color.white,
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
          return CategoryButton(
            categoryList[index].title,
            isActive: categoryList[index].isActive,
            index: index,
            onTap: (index) => onTapCategory(index),
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

class _MainHome extends StatelessWidget {
  const _MainHome({
    super.key,
    required this.celebList,
    required this.onTapCategory,
    this.dataList,
  });
  final List<Celeb> celebList;
  final Function(int) onTapCategory;
  final List<PostData>? dataList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MainTitle(
            onTap: () => onTapCategory(1),
            title: '요즘 셀럽들의 PICK! 🛍️',
          ),
        ),
        const SizedBox(height: 26),
        _CelebCarousel(celebList: celebList),
        const SizedBox(height: 70),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MainTitle(
            onTap: () => onTapCategory(2),
            title: '요고 궁금해요 TOP 3 🙋‍♀️',
          ),
        ),
        const SizedBox(height: 26),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _QuestionList(
            postList: dataList,
            limit: 3,
          ),
        ),
      ],
    );
  }
}

class _MainCeleb extends StatelessWidget {
  const _MainCeleb({
    super.key,
    required this.celebList,
    required this.selectedCelebPostCategory,
    required this.onTapCelebCategory,
    required this.onTapCelebSort,
    required this.selectedCelebPostSort,
  });
  final List<Celeb> celebList;
  final CelebPostCategory selectedCelebPostCategory;
  final void Function(CelebPostCategory category) onTapCelebCategory;
  final void Function(CelebPostSort sort) onTapCelebSort;
  final CelebPostSort selectedCelebPostSort;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CelebCategoryForm(
            categoryList: CelebPostCategory.values,
            selectedCategory: selectedCelebPostCategory,
            onTap: onTapCelebCategory,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CelebSortTab(
                  sort: CelebPostSort.latest,
                  onTap: (sort) => onTapCelebSort(sort),
                  isSelected: selectedCelebPostSort.isLatest,
                ),
                const SizedBox(width: 16),
                CelebSortTab(
                  sort: CelebPostSort.like,
                  onTap: (sort) => onTapCelebSort(sort),
                  isSelected: selectedCelebPostSort.isLike,
                ),
              ],
            ),
          ),
          ListView.separated(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: celebList.length,
            itemBuilder: (context, index) {
              final celeb = celebList[index];
              return CelebCard(celeb: celeb);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}

class _CelebCarousel extends StatelessWidget {
  const _CelebCarousel({
    super.key,
    required this.celebList,
  });
  final List<Celeb> celebList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: celebList.length,
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        initialPage: 0,
        enableInfiniteScroll: false,
        height: 400,
        viewportFraction: 0.85,
        enlargeFactor: 0.2,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.easeInOut,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        pauseAutoPlayInFiniteScroll: true,
        autoPlay: true,
      ),
      itemBuilder: (context, index, realIndex) {
        final celeb = celebList[index];
        return CelebCard(celeb: celeb);
      },
    );
  }
}

class _MainQuestion extends StatelessWidget {
  const _MainQuestion({
    super.key,
    this.dataList,
  });
  final List<PostData>? dataList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: _QuestionList(
        postList: dataList,
      ),
    );
  }
}

class _QuestionList extends StatelessWidget {
  const _QuestionList({
    super.key,
    required this.postList,
    this.limit,
  });
  final List<PostData>? postList;
  final int? limit;

  @override
  Widget build(BuildContext context) {
    if (postList == null || postList!.isEmpty) {
      return const _EmptyQuestionBox();
    }
    int postCnt = postList!.length;
    if (limit != null) {
      if (limit! < postList!.length) {
        postCnt = limit!;
      }
    }
    return ListView.separated(
      shrinkWrap: true,
      itemCount: postCnt,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final content = postList![index];
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
          commentCnt: content.commentCnt ?? 0,
        );
      },
    );
  }
}

class _EmptyQuestionBox extends StatelessWidget {
  const _EmptyQuestionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AssetIcon(
          'assets/images/logo_icon.png',
          size: 100,
        ),
        Text(
          textAlign: TextAlign.center,
          '요고 궁금 게시글이 없어요.\n게시글을 등록해주세요.',
          style: context.typo.subTitle3.subText,
        ),
      ],
    );
  }
}
