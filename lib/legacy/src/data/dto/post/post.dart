// import 'package:egomoya/legacy/src/data/dto/image/img.dart';
// import 'package:egomoya/legacy/src/data/dto/user/user.dart';

// class Post {
//   const Post({
//     required this.dataList,
//     required this.pageInfo,
//   });
//   final List<PostData> dataList;
//   final PostPageInfo pageInfo;

//   @override
//   String toString() {
//     return 'Post(dataList: $dataList, pageInfo: $pageInfo)';
//   }
// }

// class PostData {
//   PostData({
//     required this.postId,
//     required this.title,
//     required this.content,
//     this.imageList,
//     required this.user,
//     this.commentCnt,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//   final int postId;
//   final String title;
//   final String content;
//   final List<Img>? imageList;
//   final User user;
//   int? commentCnt;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   @override
//   String toString() {
//     return 'PostData(postId: $postId, title: $title, content: $content, imageList: $imageList, user: $user, commentCnt: $commentCnt, createdAt: $createdAt, updatedAt: $updatedAt)';
//   }
// }

// //image

// // class PostImage {
// //   PostImage({
// //     required this.postId,
// //     required this.imageUrl,
// //   });
// //   final int? postId;
// //   final String imageUrl;

// //   @override
// //   String toString() {
// //     return 'PostImage(postId: $postId, imageUrl: $imageUrl)';
// //   }
// // }

// class PostPageInfo {
//   PostPageInfo({
//     required this.pageNumber,
//     required this.pageSize,
//     required this.last,
//   });
//   final int pageNumber;
//   final int pageSize;
//   final bool last;

//   @override
//   String toString() {
//     return 'PostPageInfo(pageNumber: $pageNumber, pageSize: $pageSize, last: $last)';
//   }
// }
