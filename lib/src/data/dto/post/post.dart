class Post {
  const Post({
    required this.contentList,
    this.pageable,
    this.last,
    this.totalPages,
    this.totalElements,
    this.size,
    this.first,
    this.number,
    this.sort,
    this.numberOfElements,
    this.empty,
  });
  final List<PostContent> contentList;
  final PostPageable? pageable;
  final bool? last;
  final int? totalPages;
  final int? totalElements;
  final int? size;
  final bool? first;
  final int? number;
  final PostSort? sort;
  final int? numberOfElements;
  final bool? empty;

  @override
  String toString() {
    return 'Post(contentList: $contentList, pageable: $pageable, last: $last, totalPages: $totalPages, totalElements: $totalElements, size: $size, first: $first, number: $number, sort: $sort, numberOfElements: $numberOfElements, empty: $empty)';
  }
}

//content
class PostContent {
  PostContent({
    this.postId,
    required this.title,
    required this.content,
  });
  final int? postId;
  final String title;
  final String content;

  @override
  String toString() {
    return 'PostContent(postId: $postId, title: $title, content: $content)';
  }
}

//pageable
class PostPageable {
  PostPageable({
    this.pageNumber,
    this.pageSize,
    this.postSort,
    this.offset,
    this.paged,
    this.unpaged,
  });
  final int? pageNumber;
  final int? pageSize;
  final PostSort? postSort;
  final int? offset;
  final bool? paged;
  final bool? unpaged;

  @override
  String toString() {
    return 'PostPageable(pageNumber: $pageNumber, pageSize: $pageSize, postSort: $postSort, offset: $offset, paged: $paged, unpaged: $unpaged)';
  }
}

//sort
class PostSort {
  PostSort({
    this.sorted,
    this.empty,
    this.unsorted,
  });
  final bool? sorted;
  final bool? empty;
  final bool? unsorted;

  @override
  String toString() {
    return 'PostSort(sorted: $sorted, empty: $empty, unsorted: $unsorted)';
  }
}
