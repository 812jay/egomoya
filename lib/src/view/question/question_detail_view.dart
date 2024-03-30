import 'dart:developer';

import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/question/question_detail_view_model.dart';
import 'package:egomoya/src/view/question/widget/comment_box.dart';
import 'package:egomoya/src/view/question/widget/content_image.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:egomoya/util/app_theme.dart';
import 'package:egomoya/util/helper/datetime_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class QuestionDetailView extends StatelessWidget {
  const QuestionDetailView({
    super.key,
    required this.postId,
  });
  final int postId;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: QuestionDetailViewModel(
        postId: postId,
        postModel: context.read(),
      ),
      builder: (context, viewModel) {
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Consumer<QuestionDetailViewModel>(
            builder: (context, value, child) {
              final data = value.postData;
              return Scaffold(
                appBar: BaseAppBar(
                  title: '질문 상세',
                  actions: [
                    GestureDetector(
                      onTap: () => viewModel.onTapMore(context),
                      child: const AssetIcon(
                        'assets/icons/more.svg',
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 9),
                  ],
                ),
                body: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _QuestionDetailHead(
                                      title: data?.title ?? '',
                                      userId: data?.user.nickname ?? '익명',
                                      writedAt: DateTime.now().subtract(
                                        const Duration(seconds: 1),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    _QuestDetailContent(
                                      content: data?.content ?? '',
                                      imageUrlList: data?.imageList
                                              ?.map((e) => e.imageUrl)
                                              .toList() ??
                                          [],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 8,
                                color: context.color.lightGrayBackground,
                              ),
                              const SizedBox(height: 25),
                              //댓글 목록
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: _QuestDetailCommentList(
                                  commentList: [],
                                ),
                              ),
                              const SizedBox(height: 25),
                            ],
                          ),
                        ),
                      ),
                      //댓글 등록
                      _QuestionDetailAddComment(
                        controller: viewModel.commentAddController,
                        onSubmit: () {
                          log('댓글 등록');
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
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
    required this.writedAt,
    required this.userId,
  });
  final String title;
  final DateTime writedAt;
  final String userId;

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
          '$userId • ${writedAt.formatRelativeDateTime()}',
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
            return ContentImageBox(imageUrl: imageUrlList[index]);
          },
        ),
      ],
    );
  }
}

class _QuestDetailCommentList extends StatelessWidget {
  const _QuestDetailCommentList({
    super.key,
    required this.commentList,
  });
  final List commentList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '댓글',
          style: context.typo.body1.bold,
        ),
        const SizedBox(height: 25),
        ListView.separated(
          shrinkWrap: true,
          itemCount: 3,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: 25),
          itemBuilder: (context, index) {
            return CommentBox(
              content: 'comment$index',
              commentId: 0,
              onTapReply: (postId) {},
              userId: '요고요고$index',
              writedAt: DateTime.now().subtract(
                Duration(
                  days: index,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _QuestionDetailAddComment extends StatelessWidget {
  const _QuestionDetailAddComment({
    super.key,
    required this.controller,
    this.onSubmit,
  });
  final TextEditingController controller;
  final GestureTapCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(500),
                    ],
                    decoration: InputDecoration(
                      fillColor: context.color.lightGrayBackground,
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      hintText: '알고있는 상품이라면 댓글을 달아주세요!',
                      hintStyle: context.typo.body2.subText,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onSubmit,
                  child: Container(
                    width: 60,
                    alignment: Alignment.center,
                    child: Text(
                      '등록',
                      style: context.typo.body2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
