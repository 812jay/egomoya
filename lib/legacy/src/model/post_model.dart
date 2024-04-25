// import 'package:dio/dio.dart';
// import 'package:egomoya/legacy/src/data/dto/post/post.dart';
// import 'package:egomoya/legacy/src/data/remote/image/img_req.dart';
// import 'package:egomoya/legacy/src/data/remote/post/post_req.dart';
// import 'package:egomoya/legacy/src/data/remote/post/post_res.dart';
// import 'package:egomoya/legacy/src/repository/comment_repo.dart';
// import 'package:egomoya/legacy/src/repository/image_repo.dart';
// import 'package:egomoya/legacy/src/repository/post_repo.dart';
// import 'package:egomoya/legacy/util/helper/perf_helper.dart';
// import 'package:egomoya/legacy/util/request_result.dart';

// class PostModel {
//   PostModel(this._pref);
//   final PrefHelper _pref;
//   final PostRepo _postRepo = PostRepo();
//   final ImageRepo _imageRepo = ImageRepo();
//   final CommentRepo _commentRepo = CommentRepo();

//   String get userId => _pref.userId;

//   Future<RequestResult<Post?>> fetchPostList() => handleRequest(() async {
//         final res = await _postRepo.fetchPost();
//         final result = res?.toDto();
//         if (result != null) {
//           for (var post in result.dataList) {
//             final commentCnt = await _commentRepo.fetchCommentCnt(post.postId);
//             post.commentCnt = commentCnt;
//           }
//         }
//         return result;
//       });

//   Future<RequestResult<PostData?>> fetchPostDetail(int postId) =>
//       handleRequest(() async {
//         final res = await _postRepo.fetchPostDetail(postId);
//         final result = res?.toDto();
//         return result;
//       });

//   Future<RequestResult<void>> registPost({
//     required String title,
//     int? postId,
//     String? content,
//     FormData? uploadFormData,
//     required List<String> deleteUploadNameList,
//   }) =>
//       handleRequest(() async {
//         final res = await _postRepo.registPost(
//           postId: postId,
//           req: PostReq(
//             title: title,
//             content: content,
//             userId: userId,
//           ),
//         );
//         if (uploadFormData != null) {
//           await _imageRepo.registPostImageList(
//             postId: res.postId,
//             imageFormData: uploadFormData,
//           );
//         }
//         if (deleteUploadNameList.isNotEmpty) {
//           for (var deleteUploadName in deleteUploadNameList) {
//             await _imageRepo.deleteImage(
//               req: ImgReq(
//                 uploadName: deleteUploadName,
//                 isProfile: false,
//               ),
//             );
//           }
//         }
//       });

//   Future<RequestResult<void>> deletePost(int postId) => handleRequest(() async {
//         await _postRepo.deletePost(
//           postId: postId,
//         );
//       });
// }
