// import 'dart:convert';

// import 'package:egomoya/legacy/src/data/remote/comment/comment_req.dart';
// import 'package:egomoya/legacy/src/data/remote/comment/comment_res.dart';
// import 'package:egomoya/legacy/src/repository/base_repo.dart';

// class CommentRepo extends BaseRepo {
//   Future<CommentRes?> fetchComment(int postId) async {
//     final response = await dio.get('$prefix/api/comments/$postId');
//     final result = CommentRes.fromJson(response.data);
//     return result;
//   }

//   Future<void> registComment({
//     required int postId,
//     required CommentReq req,
//   }) async {
//     await dio.post(
//       '$prefix/api/comments/$postId',
//       data: jsonEncode(req),
//     );
//   }

//   Future<void> deleteComment(int commentId) async {
//     await dio.delete('$prefix/api/comments/$commentId');
//   }

//   Future<int> fetchCommentCnt(int postId) async {
//     final response = await dio.get('$prefix/api/comments/count/$postId');
//     final int result = response.data;
//     return result;
//   }
// }
