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
    this.postId,
    required this.title,
    required this.content,
    required this.userId,
    this.images,
  });
  final int? postId;
  final String title;
  final String content;
  final String userId;
  final List<PostImage>? images;

  @override
  String toString() {
    return 'PostContent(postId: $postId, title: $title, content: $content, userId: $userId, images: $images)';
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
