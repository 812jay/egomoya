import 'package:cached_network_image/cached_network_image.dart';
import 'package:egomoya/src/model/comment/comment.dart';
import 'package:egomoya/src/repo/comment_repo.dart';
import 'package:egomoya/src/repo/question_repo.dart';
import 'package:egomoya/src/repo/user_repo.dart';
import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/src/service/user_service.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/question/question_detail_view_model.dart';
import 'package:egomoya/src/view/question/widget/comment_box.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:egomoya/theme/foundation/app_theme.dart';
import 'package:egomoya/util/helper/datetime_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        commentRepo: context.read<CommentRepo>(),
        userService: context.read<UserService>(),
      ),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: BaseAppBar(title: viewModel.question?.title ?? ''),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _QuestionDetailHead(
                          title: viewModel.question?.title ?? '',
                          nickname: viewModel.question?.user?.nickName ?? '',
                          updatedAt:
                              viewModel.question?.updatedAt ?? DateTime.now(),
                        ),
                        _QuestDetailContent(
                          imageUrlList: viewModel.question?.imgPathList ?? [],
                        ),
                        _QuestDetailCommentList(
                          commentList: viewModel.commentList,
                          curUserId: viewModel.uid,
                          onTapReply: ({parentId, nickname, content}) {},
                          onTapMore: (commentId) => viewModel.onTapCommentMore(
                            context,
                            commentId: commentId,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //댓글 등록
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 10,
                ),
                child: _QuestionDetailAddComment(
                  controller: viewModel.commentAddController,
                  isSignedIn: viewModel.isSignedIn,
                  onSubmit: () => viewModel.onTapAddComment(context),
                  onTapTextField: () => viewModel.onTapCommentField(context),
                ),
              ),
            ],
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
            return _QuestionImageBox(imageUrl: imageUrlList[index]);
          },
        ),
      ],
    );
  }
}

class _QuestionImageBox extends StatelessWidget {
  const _QuestionImageBox({
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

class _QuestDetailCommentList extends StatelessWidget {
  const _QuestDetailCommentList({
    super.key,
    required this.commentList,
    this.curUserId,
    required this.onTapReply,
    required this.onTapMore,
  });
  final List<CommentRes> commentList;
  final String? curUserId;
  final Function({
    int? parentId,
    String? nickname,
    String? content,
  }) onTapReply;
  final Function(String commentId) onTapMore;

  @override
  Widget build(BuildContext context) {
    if (commentList.isEmpty) {
      return SizedBox(
        height: 100,
        child: Center(
          child: Text(
            '내가 알고있는 상품이라면\n댓글을 남겨주세요',
            style: context.typo.body2.subText,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '댓글 ${commentList.length}',
          style: context.typo.body1.bold,
        ),
        const SizedBox(height: 25),
        ListView.separated(
          shrinkWrap: true,
          itemCount: commentList.length,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const Divider(thickness: 0.5),
          itemBuilder: (context, index) {
            final comment = commentList[index];
            return Column(
              children: [
                CommentBox(
                  commentId: comment.commentId,
                  nickname: comment.user?.nickName ?? '',
                  updatedAt: comment.updatedAt,
                  content: comment.content,
                  isCurUser: curUserId == comment.user?.uid,
                  onTapReply: ({content, nickname, parentId}) {},
                  onTapMore: onTapMore,
                )
              ],
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
    this.onTapTextField,
    this.onSubmit,
    required this.isSignedIn,
    this.replyText,
  });
  final TextEditingController controller;
  final GestureTapCallback? onTapTextField;
  final GestureTapCallback? onSubmit;
  final bool isSignedIn;
  final String? replyText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (replyText != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                replyText!,
                style: context.typo.body2.subColor.bold,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    onTap: onTapTextField,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    readOnly: !isSignedIn,
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
                InkWell(
                  onTap: onSubmit,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 60,
                    height: 60,
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
