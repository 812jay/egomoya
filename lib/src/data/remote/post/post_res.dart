import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_res.g.dart';

@JsonSerializable()
class PostRes {
  const PostRes({
    this.contentList,
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
  @JsonKey(name: 'content')
  final List<PostContentRes>? contentList;
  @JsonKey(name: 'pageable')
  final PostPageableRes? pageable;
  @JsonKey(name: 'last')
  final bool? last;
  @JsonKey(name: 'totalPages')
  final int? totalPages;
  @JsonKey(name: 'totalElements')
  final int? totalElements;
  @JsonKey(name: 'sort')
  final PostSortRes? sort;
  @JsonKey(name: 'size')
  final int? size;
  @JsonKey(name: 'number')
  final int? number;
  @JsonKey(name: 'first')
  final bool? first;
  @JsonKey(name: 'numberOfElements')
  final int? numberOfElements;
  @JsonKey(name: 'empty')
  final bool? empty;

  factory PostRes.fromJson(Map<String, dynamic> json) =>
      _$PostResFromJson(json);

  Map<String, dynamic> toJson() => _$PostResToJson(this);
}

extension PostResExt on PostRes {
  Post toDto() => Post(
        contentList: contentList?.map((e) => e.toDto()).toList() ?? [],
        pageable: pageable?.toDto(),
        last: last,
        totalPages: totalPages,
        totalElements: totalElements,
        size: size,
        first: first,
        number: number,
        sort: sort?.toDto(),
        numberOfElements: numberOfElements,
        empty: empty,
      );
}

//content
@JsonSerializable()
class PostContentRes {
  PostContentRes({
    this.postId,
    required this.title,
    required this.content,
  });
  @JsonKey(name: 'postId')
  final int? postId;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'content')
  final String content;

  factory PostContentRes.fromJson(Map<String, dynamic> json) =>
      _$PostContentResFromJson(json);

  Map<String, dynamic> toJson() => _$PostContentResToJson(this);
}

extension PostContentResExt on PostContentRes {
  PostContent toDto() => PostContent(
        postId: postId,
        title: title,
        content: content,
      );
}

//pageable
@JsonSerializable()
class PostPageableRes {
  PostPageableRes({
    this.pageNumber,
    this.pageSize,
    this.postSort,
    this.offset,
    this.paged,
    this.unpaged,
  });
  @JsonKey(name: 'pageNumber')
  final int? pageNumber;
  @JsonKey(name: 'pageSize')
  final int? pageSize;
  @JsonKey(name: 'postSort')
  final PostSortRes? postSort;
  @JsonKey(name: 'offset')
  final int? offset;
  @JsonKey(name: 'paged')
  final bool? paged;
  @JsonKey(name: 'unpaged')
  final bool? unpaged;

  factory PostPageableRes.fromJson(Map<String, dynamic> json) =>
      _$PostPageableResFromJson(json);

  Map<String, dynamic> toJson() => _$PostPageableResToJson(this);
}

extension PostPageableResExt on PostPageableRes {
  PostPageable toDto() => PostPageable(
        pageNumber: pageNumber,
        pageSize: pageSize,
        postSort: postSort?.toDto(),
        offset: offset,
        paged: paged,
        unpaged: unpaged,
      );
}

//sort
@JsonSerializable()
class PostSortRes {
  PostSortRes({
    this.sorted,
    this.empty,
    this.unsorted,
  });
  @JsonKey(name: 'sorted')
  final bool? sorted;
  @JsonKey(name: 'empty')
  final bool? empty;
  @JsonKey(name: 'unsorted')
  final bool? unsorted;

  factory PostSortRes.fromJson(Map<String, dynamic> json) =>
      _$PostSortResFromJson(json);

  Map<String, dynamic> toJson() => _$PostSortResToJson(this);
}

extension PostSortResExt on PostSortRes {
  PostSort toDto() => PostSort(
        sorted: sorted,
        empty: empty,
        unsorted: unsorted,
      );
}
