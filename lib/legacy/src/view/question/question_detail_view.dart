// import 'package:egomoya/legacy/src/data/dto/comment/comment.dart';
// import 'package:egomoya/legacy/src/model/comment_model.dart';
// import 'package:egomoya/legacy/src/model/post_model.dart';
// import 'package:egomoya/legacy/src/model/user_model.dart';
// import 'package:egomoya/legacy/src/service/dialog_service.dart';
// import 'package:egomoya/legacy/src/service/post_service.dart';
// import 'package:egomoya/legacy/src/service/theme_service.dart';
// import 'package:egomoya/legacy/src/view/base_view.dart';
// import 'package:egomoya/legacy/src/view/question/question_detail_view_model.dart';
// import 'package:egomoya/legacy/src/view/question/widget/comment_box.dart';
// import 'package:egomoya/legacy/src/view/question/widget/content_image.dart';
// import 'package:egomoya/legacy/src/view/question/widget/reply_box.dart';
// import 'package:egomoya/legacy/theme/component/app_bar/base_app_bar.dart';
// import 'package:egomoya/legacy/theme/component/icon/asset_icon.dart';
// import 'package:egomoya/legacy/util/app_theme.dart';
// import 'package:egomoya/legacy/util/helper/datetime_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';

// class QuestionDetailView extends StatelessWidget {
//   const QuestionDetailView({
//     super.key,
//     required this.postId,
//   });
//   final int postId;

//   @override
//   Widget build(BuildContext context) {
//     return BaseView(
//       viewModel: QuestionDetailViewModel(
//         postId: postId,
//         userModel: context.read<UserModel>(),
//         postModel: context.read<PostModel>(),
//         postService: context.read<PostService>(),
//         commentModel: context.read<CommentModel>(),
//         dialogService: context.read<DialogService>(),
//       ),
//       builder: (context, viewModel) {
//         final data = viewModel.postData;
//         return GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus;
//             viewModel.onClearReplyText();
//           },
//           child: Scaffold(
//             appBar: BaseAppBar(
//               title: '질문 상세',
//               actions: [
//                 GestureDetector(
//                   onTap: () => viewModel.onTapMorePost(context),
//                   child: const AssetIcon(
//                     'assets/icons/more.svg',
//                     size: 24,
//                   ),
//                 ),
//                 const SizedBox(width: 9),
//               ],
//             ),
//             body: SafeArea(
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 15),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 _QuestionDetailHead(
//                                   title: data?.title ?? '',
//                                   userId: data?.user.nickname ?? '익명',
//                                   updatedAt: data?.updatedAt ?? DateTime.now(),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 _QuestDetailContent(
//                                   content: data?.content ?? '',
//                                   imageUrlList: data?.imageList
//                                           ?.map((e) => e.imageUrl)
//                                           .toList() ??
//                                       [],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Divider(
//                             thickness: 8,
//                             color: context.color.lightGrayBackground,
//                           ),
//                           const SizedBox(height: 25),
//                           //댓글 목록
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 15),
//                             child: _QuestDetailCommentList(
//                               commentList: viewModel.comment?.dataList,
//                               curUserId: viewModel.userId,
//                               onTapMore: (commentId) =>
//                                   viewModel.onTapMoreComment(context,
//                                       commentId: commentId),
//                               onTapReply: ({content, nickname, parentId}) =>
//                                   viewModel.onTapReply(
//                                 content: content,
//                                 nickname: nickname,
//                                 parentId: parentId,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 25),
//                         ],
//                       ),
//                     ),
//                   ),
//                   //댓글 등록
//                   _QuestionDetailAddComment(
//                     controller: viewModel.commentAddController,
//                     onSubmit: () => viewModel.addComment(),
//                     onTapTextField: () => viewModel.onTapCommentField(context),
//                     isSignedIn: viewModel.isSignedIn,
//                     replyText: viewModel.replyText != null &&
//                             viewModel.curCommentParentId != null
//                         ? viewModel.replyText
//                         : null,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class _QuestionDetailHead extends StatelessWidget {
//   const _QuestionDetailHead({
//     super.key,
//     required this.title,
//     required this.updatedAt,
//     required this.userId,
//   });
//   final String title;
//   final DateTime updatedAt;
//   final String userId;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: context.typo.subTitle3,
//         ),
//         const SizedBox(height: 8),
//         Text(
//           '$userId • ${DateTimeHelper.formatRelativeDateTime(updatedAt)}',
//           style: context.typo.body3.subText,
//         ),
//       ],
//     );
//   }
// }

// class _QuestDetailContent extends StatelessWidget {
//   const _QuestDetailContent({
//     super.key,
//     this.content,
//     required this.imageUrlList,
//   });
//   final String? content;
//   final List<String> imageUrlList;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           content ?? '',
//           style: context.typo.body1,
//         ),
//         const SizedBox(height: 20),
//         ListView.separated(
//           shrinkWrap: true,
//           itemCount: imageUrlList.length,
//           padding: EdgeInsets.only(bottom: imageUrlList.isNotEmpty ? 20 : 0),
//           physics: const NeverScrollableScrollPhysics(),
//           separatorBuilder: (context, index) => const SizedBox(height: 20),
//           itemBuilder: (context, index) {
//             return ContentImageBox(imageUrl: imageUrlList[index]);
//           },
//         ),
//       ],
//     );
//   }
// }

// class _QuestDetailCommentList extends StatelessWidget {
//   const _QuestDetailCommentList({
//     super.key,
//     this.commentList,
//     required this.curUserId,
//     required this.onTapReply,
//     required this.onTapMore,
//   });
//   final List<CommentData>? commentList;
//   final String curUserId;
//   final Function({
//     int? parentId,
//     String? nickname,
//     String? content,
//   }) onTapReply;
//   final Function(int commentId) onTapMore;

//   @override
//   Widget build(BuildContext context) {
//     if (commentList == null || commentList!.isEmpty) {
//       return SizedBox(
//         height: 100,
//         child: Center(
//           child: Text(
//             '내가 알고있는 상품이라면\n댓글을 남겨주세요',
//             style: context.typo.body2.subText,
//             textAlign: TextAlign.center,
//           ),
//         ),
//       );
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           '댓글 ${commentList!.length}',
//           style: context.typo.body1.bold,
//         ),
//         const SizedBox(height: 25),
//         ListView.separated(
//           shrinkWrap: true,
//           itemCount: commentList!.length,
//           physics: const NeverScrollableScrollPhysics(),
//           separatorBuilder: (context, index) => const Divider(thickness: 0.5),
//           itemBuilder: (context, index) {
//             final comment = commentList![index];
//             return Column(
//               children: [
//                 CommentBox(
//                   commentId: comment.id,
//                   isCurUser: comment.user?.userId == curUserId,
//                   content: comment.content,
//                   onTapReply: onTapReply,
//                   nickname: comment.user?.nickname ?? '',
//                   updatedAt: comment.updatedAt,
//                   onTapMore: (commentId) => onTapMore(commentId),
//                 ),
//                 if (comment.children != null) const SizedBox(height: 8),
//                 if (comment.children != null)
//                   ListView.separated(
//                     shrinkWrap: true,
//                     itemCount: comment.children!.length,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       final reply = comment.children![index];
//                       return ReplyBox(
//                         commentId: reply.id,
//                         nickname: reply.user?.nickname ?? '',
//                         content: reply.content,
//                         updatedAt: reply.updatedAt,
//                         onTapMore: (commentId) => onTapMore(commentId),
//                       );
//                     },
//                     separatorBuilder: (context, index) =>
//                         const SizedBox(height: 8),
//                   )
//               ],
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

// class _QuestionDetailAddComment extends StatelessWidget {
//   const _QuestionDetailAddComment({
//     super.key,
//     required this.controller,
//     this.onTapTextField,
//     this.onSubmit,
//     required this.isSignedIn,
//     this.replyText,
//   });
//   final TextEditingController controller;
//   final GestureTapCallback? onTapTextField;
//   final GestureTapCallback? onSubmit;
//   final bool isSignedIn;
//   final String? replyText;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (replyText != null)
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10),
//               child: Text(
//                 replyText!,
//                 style: context.typo.body2.subColor.bold,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//               ),
//             ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: controller,
//                     onTap: onTapTextField,
//                     textAlignVertical: TextAlignVertical.center,
//                     keyboardType: TextInputType.multiline,
//                     minLines: 1,
//                     maxLines: 5,
//                     readOnly: !isSignedIn,
//                     inputFormatters: [
//                       LengthLimitingTextInputFormatter(500),
//                     ],
//                     decoration: InputDecoration(
//                       fillColor: context.color.lightGrayBackground,
//                       filled: true,
//                       focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                         borderSide: BorderSide.none,
//                       ),
//                       hintText: '알고있는 상품이라면 댓글을 달아주세요!',
//                       hintStyle: context.typo.body2.subText,
//                       border: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: onSubmit,
//                   child: Container(
//                     width: 60,
//                     alignment: Alignment.center,
//                     child: Text(
//                       '등록',
//                       style: context.typo.body2,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
