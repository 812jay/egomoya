import 'package:egomoya/src/data/dto/comment/comment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_res.g.dart';

@JsonSerializable()
class CommentRes {
  CommentRes({
    required this.dataList,
    required this.pageInfo,
  });
  @JsonKey(name: 'data')
  final List<CommentDataRes> dataList;
  @JsonKey(name: 'pageInfo')
  final CommentPageInfoRes pageInfo;

  factory CommentRes.fromJson(Map<String, dynamic> json) =>
      _$CommentResFromJson(json);

  Map<String, dynamic> toJson() => _$CommentResToJson(this);
}

extension CommentResExt on CommentRes {
  Comment toDto() => Comment(
        dataList: dataList.map((e) => e.toDto()).toList(),
        pageInfo: pageInfo.toDto(),
      );
}

@JsonSerializable()
class CommentDataRes {
  CommentDataRes({
    required this.id,
    required this.content,
    required this.uniqueUserId,
    this.children,
  });
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'uniqueUserId')
  final String uniqueUserId;
  @JsonKey(name: 'children')
  final List<CommentDataRes>? children;

  factory CommentDataRes.fromJson(Map<String, dynamic> json) =>
      _$CommentDataResFromJson(json);

  Map<String, dynamic> toJson() => _$CommentDataResToJson(this);
}

extension CommentDataResExt on CommentDataRes {
  CommentData toDto() => CommentData(
        id: id,
        content: content,
        uniqueUserId: uniqueUserId,
        children: children?.map((e) => e.toDto()).toList(),
      );
}

@JsonSerializable()
class CommentPageInfoRes {
  CommentPageInfoRes({
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

  factory CommentPageInfoRes.fromJson(Map<String, dynamic> json) =>
      _$CommentPageInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$CommentPageInfoResToJson(this);
}

extension CommentPageInfoResExt on CommentPageInfoRes {
  CommentPageInfo toDto() => CommentPageInfo(
        pageNumber: pageNumber,
        pageSize: pageSize,
        last: last,
      );
}
