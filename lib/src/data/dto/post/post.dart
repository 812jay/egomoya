import 'package:egomoya/src/data/dto/user/user.dart';

class Post {
  const Post({
    required this.dataList,
    required this.pageInfo,
  });
  final List<PostData> dataList;
  final PostPageInfo pageInfo;

  @override
  String toString() {
    return 'Post(dataList: $dataList, pageInfo: $pageInfo)';
  }
}

//content
class PostData {
  PostData({
    required this.postId,
    required this.title,
    required this.content,
    this.imageList,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });
  final int? postId;
  final String title;
  final String content;
  final List<PostImage>? imageList;
  final User user;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  String toString() {
    return 'PostContent(postId: $postId, title: $title, content: $content, imageList: $imageList, user: $user, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

//image

class PostImage {
  PostImage({
    required this.postId,
    required this.imageUrl,
  });
  final int? postId;
  final String imageUrl;

  @override
  String toString() {
    return 'PostImage(postId: $postId, imageUrl: $imageUrl)';
  }
}

//pageable
class PostPageInfo {
  PostPageInfo({
    required this.pageNumber,
    required this.pageSize,
    required this.last,
  });
  final int pageNumber;
  final int pageSize;
  final bool last;

  @override
  String toString() {
    return 'PostPageable(pageNumber: $pageNumber, pageSize: $pageSize, last: $last)';
  }
}
