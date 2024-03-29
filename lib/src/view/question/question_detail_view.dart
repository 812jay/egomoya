import 'dart:developer';

import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/question/question_detail_view_model.dart';
import 'package:egomoya/src/view/question/widget/comment_box.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:egomoya/util/app_theme.dart';
import 'package:egomoya/util/helper/datetime_helper.dart';
import 'package:flutter/material.dart';

class QuestionDetailView extends StatelessWidget {
  const QuestionDetailView({
    super.key,
    required this.postId,
  });
  final int postId;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: QuestionDetailViewModel(postId: postId),
      builder: (context, viewModel) {
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            appBar: BaseAppBar(
              title: Text(
                '질문 상세',
                style: context.typo.subTitle3,
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _QuestionDetailHead(
                            title: 'Title',
                            userId: '요고1212',
                            writedAt: DateTime.now().subtract(
                              const Duration(seconds: 1),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const _QuestDetailContent(
                            content: 'content',
                            imageUrlList: [],
                          ),
                          const SizedBox(height: 25),
                          const Divider(height: 1, color: Colors.black),
                          const SizedBox(height: 25),
                          //댓글 목록
                          const _QuestDetailCommentList(
                            commentList: [],
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ),
                  //댓글 등록
                  _QuestionDetailAddComment(
                    controller: viewModel.commentAddController,
                    onSubmit: () {},
                  ),
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
    this.imageUrlList,
  });
  final String? content;
  final List<String>? imageUrlList;

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
          itemCount: 3,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            return Container(
              height: 284,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text('image$index'),
              ),
            );
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
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            decoration: const BoxDecoration(),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: controller,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        fillColor: context.color.lightGrayBackground,
                        filled: true,
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        hintText: '알고있는 상품이라면 댓글을 달아주세요!',
                        hintStyle: context.typo.body2.subText,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onSubmit;
                    log('등록');
                  },
                  child: Container(
                    width: 60,
                    alignment: Alignment.center,
                    child: const Text(
                      '등록',
                      style: TextStyle(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
