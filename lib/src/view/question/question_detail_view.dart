import 'package:cached_network_image/cached_network_image.dart';
import 'package:egomoya/src/repo/question_repo.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/question/question_detail_view_model.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:egomoya/theme/foundation/app_theme.dart';
import 'package:egomoya/util/helper/datetime_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionDetailView extends StatelessWidget {
  const QuestionDetailView({
    super.key,
    required this.args,
  });
  final QuestionDetailViewArgument args;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: QuestionDetailViewModel(
        args: args,
        questionRepo: context.read<QuestionRepo>(),
        userRepo: context.read<UserRepo>(),
      ),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: BaseAppBar(title: viewModel.question?.title ?? ''),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _QuestionDetailHead(
                    title: viewModel.question?.title ?? '',
                    nickname: viewModel.question?.user?.nickName ?? '',
                    updatedAt: viewModel.question?.updatedAt ?? DateTime.now(),
                  ),
                  _QuestDetailContent(
                    imageUrlList: viewModel.question?.imgPathList ?? [],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _QuestionDetailHead extends StatelessWidget {
  const _QuestionDetailHead({
    super.key,
    required this.title,
    required this.updatedAt,
    required this.nickname,
  });
  final String title;
  final DateTime updatedAt;
  final String nickname;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.typo.subTitle3,
        ),
        const SizedBox(height: 8),
        Text(
          '$nickname • ${DateTimeHelper.formatRelativeDateTime(updatedAt)}',
          style: context.typo.body3.subText,
        ),
      ],
    );
  }
}

class _QuestDetailContent extends StatelessWidget {
  const _QuestDetailContent({
    super.key,
    this.content,
    required this.imageUrlList,
  });
  final String? content;
  final List<String> imageUrlList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          content ?? '',
          style: context.typo.body1,
        ),
        const SizedBox(height: 20),
        ListView.separated(
          shrinkWrap: true,
          itemCount: imageUrlList.length,
          padding: EdgeInsets.only(bottom: imageUrlList.isNotEmpty ? 20 : 0),
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            return _ContentImageBox(imageUrl: imageUrlList[index]);
          },
        ),
      ],
    );
  }
}

class _ContentImageBox extends StatelessWidget {
  const _ContentImageBox({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.contain,
        placeholder: (context, url) {
          return Container(
            decoration: BoxDecoration(
              color: context.color.lightGrayBackground,
            ),
          );
        },
      ),
    );
  }
}
