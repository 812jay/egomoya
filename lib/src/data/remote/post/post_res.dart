import 'package:egomoya/src/data/dto/post/post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_res.g.dart';

@JsonSerializable()
class PostRes {
  const PostRes({
    required this.dataList,
    required this.pageInfo,
  });
  @JsonKey(name: 'data')
  final List<PostDataRes> dataList;
  @JsonKey(name: 'pageInfo')
  final PostPageInfoRes pageInfo;

  factory PostRes.fromJson(Map<String, dynamic> json) =>
      _$PostResFromJson(json);

  Map<String, dynamic> toJson() => _$PostResToJson(this);
}

extension PostResExt on PostRes {
  Post toDto() => Post(
        dataList: dataList.map((e) => e.toDto()).toList(),
        pageInfo: pageInfo.toDto(),
      );
}

//content
@JsonSerializable()
class PostDataRes {
  PostDataRes({
    this.postId,
    required this.title,
    required this.content,
    required this.userId,
    this.images,
  });
  @JsonKey(name: 'postId')
  final int? postId;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'userId')
  final String userId;
  @JsonKey(name: 'images')
  final List<PostImageRes>? images;

  factory PostDataRes.fromJson(Map<String, dynamic> json) =>
      _$PostDataResFromJson(json);

  Map<String, dynamic> toJson() => _$PostDataResToJson(this);
}

extension PostDataResExt on PostDataRes {
  PostData toDto() => PostData(
        postId: postId,
        title: title,
        content: content,
        userId: userId,
        images: images?.map((e) => e.toDto()).toList() ?? [],
      );
}

//image

//content
@JsonSerializable()
class PostImageRes {
  PostImageRes({
    required this.postId,
    required this.imageUrl,
  });
  @JsonKey(name: 'postId')
  final int? postId;
  @JsonKey(name: 'imageUrl')
  final String imageUrl;

  factory PostImageRes.fromJson(Map<String, dynamic> json) =>
      _$PostImageResFromJson(json);

  Map<String, dynamic> toJson() => _$PostImageResToJson(this);
}

extension PostImageResExt on PostImageRes {
  PostImage toDto() => PostImage(
        postId: postId,
        imageUrl: imageUrl,
      );
}

//pageInfo
@JsonSerializable()
class PostPageInfoRes {
  PostPageInfoRes({
    required this.pageNumber,
    required this.pageSize,
    required this.last,
  });
  @JsonKey(name: 'pageNumber')
  final int pageNumber;
  @JsonKey(name: 'pageSize')
  final int pageSize;
  @JsonKey(name: 'last')
  final bool last;

  factory PostPageInfoRes.fromJson(Map<String, dynamic> json) =>
      _$PostPageInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$PostPageInfoResToJson(this);
}

extension PostPageableResExt on PostPageInfoRes {
  PostPageInfo toDto() => PostPageInfo(
        pageNumber: pageNumber,
        pageSize: pageSize,
        last: last,
      );
}
