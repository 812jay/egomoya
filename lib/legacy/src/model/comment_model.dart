// import 'package:egomoya/legacy/src/data/dto/comment/comment.dart';
// import 'package:egomoya/legacy/src/data/remote/comment/comment_req.dart';
// import 'package:egomoya/legacy/src/data/remote/comment/comment_res.dart';
// import 'package:egomoya/legacy/src/repository/comment_repo.dart';
// import 'package:egomoya/legacy/util/helper/perf_helper.dart';
// import 'package:egomoya/legacy/util/request_result.dart';

// class CommentModel {
//   CommentModel(this._pref);
//   final PrefHelper _pref;
//   final CommentRepo _commentRepo = CommentRepo();

//   String get userId => _pref.userId;

//   Future<RequestResult<Comment?>> fetchComment(int postId) =>
//       handleRequest(() async {
//         final response = await _commentRepo.fetchComment(postId);
//         final result = response?.toDto();
//         return result;
//       });

//   Future<RequestResult<void>> registComment({
//     required int postId,
//     required String content,
//     int? parentId,
//   }) =>
//       handleRequest(() async {
//         await _commentRepo.registComment(
//           postId: postId,
//           req: CommentReq(
//             content: content,
//             userId: userId,
//             parentId: parentId,
//           ),
//         );
//       });

//   Future<RequestResult<void>> deleteComment(int commentId) =>
//       handleRequest(() async {
//         await _commentRepo.deleteComment(commentId);
//       });
// }
