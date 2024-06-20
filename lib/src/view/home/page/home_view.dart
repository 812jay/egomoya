import 'package:carousel_slider/carousel_slider.dart';
import 'package:egomoya/src/model/celeb/celeb.dart';
import 'package:egomoya/src/model/question/question.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/celeb/widget/celeb_card.dart';
import 'package:egomoya/src/view/home/widget/main_title.dart';
import 'package:egomoya/src/view/question/widget/question_box.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/theme/component/icon/asset_icon_type.dart';
import 'package:egomoya/theme/foundation/app_theme.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.celebList,
    required this.questionList,
    required this.onTapCategory,
    required this.onTapQuestion,
  });
  final List<Celeb> celebList;
  final List<QuestionRes> questionList;
  final Function(int) onTapCategory;
  final Function(String) onTapQuestion;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: MainTitle(
              onTap: () => onTapCategory(1),
              title: '요즘 셀럽들의 PICK! 🛍️',
            ),
          ),
          _CelebCarousel(celebList: celebList),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: MainTitle(
              onTap: () => onTapCategory(2),
              title: '요고 궁금해요 TOP 3 🙋‍♀️',
            ),
          ),
          _HomeQuestion(
            questionList: questionList,
            onTap: onTapQuestion,
          ),
          const SizedBox(height: 100),
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
    if (celebList.isEmpty) return const _EmptyCelebBox();
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

class _HomeQuestion extends StatelessWidget {
  const _HomeQuestion({
    super.key,
    required this.questionList,
    required this.onTap,
  });
  final List<QuestionRes> questionList;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    if (questionList.isEmpty) return const _EmptyQuestionBox();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: questionList.length,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final question = questionList[index];
          return QuestionBox(
            onTap: (questionId) => onTap(questionId),
            title: question.title,
            content: question.content,
            writedAt: question.createdAt,
            imgList: question.imgPathList,
            commentCnt: question.commentCnt ?? 0,
            questionId: question.questionId,
            viewCnt: question.viewCnt,
          );
        },
      ),
    );
  }
}

class _EmptyCelebBox extends StatelessWidget {
  const _EmptyCelebBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AssetIcon(
          AssetImageType.logoIcon.path,
          size: 100,
        ),
        Text(
          textAlign: TextAlign.center,
          '셀럽 게시글이 없어요.',
          style: context.typo.subTitle3.subText,
        ),
      ],
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
        AssetIcon(
          AssetImageType.logoIcon.path,
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
