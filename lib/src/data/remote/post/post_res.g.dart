// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRes _$PostResFromJson(Map<String, dynamic> json) => PostRes(
      contentList: (json['content'] as List<dynamic>?)
          ?.map((e) => PostContentRes.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: json['pageable'] == null
          ? null
          : PostPageableRes.fromJson(json['pageable'] as Map<String, dynamic>),
      last: json['last'] as bool?,
      totalPages: json['totalPages'] as int?,
      totalElements: json['totalElements'] as int?,
      size: json['size'] as int?,
      first: json['first'] as bool?,
      number: json['number'] as int?,
      sort: json['sort'] == null
          ? null
          : PostSortRes.fromJson(json['sort'] as Map<String, dynamic>),
      numberOfElements: json['numberOfElements'] as int?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$PostResToJson(PostRes instance) => <String, dynamic>{
      'content': instance.contentList,
      'pageable': instance.pageable,
      'last': instance.last,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'sort': instance.sort,
      'size': instance.size,
      'number': instance.number,
      'first': instance.first,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
    };

PostContentRes _$PostContentResFromJson(Map<String, dynamic> json) =>
    PostContentRes(
      postId: json['postId'] as int?,
      title: json['title'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$PostContentResToJson(PostContentRes instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'title': instance.title,
      'content': instance.content,
    };

PostPageableRes _$PostPageableResFromJson(Map<String, dynamic> json) =>
    PostPageableRes(
      pageNumber: json['pageNumber'] as int?,
      pageSize: json['pageSize'] as int?,
      postSort: json['postSort'] == null
          ? null
          : PostSortRes.fromJson(json['postSort'] as Map<String, dynamic>),
      offset: json['offset'] as int?,
      paged: json['paged'] as bool?,
      unpaged: json['unpaged'] as bool?,
    );

Map<String, dynamic> _$PostPageableResToJson(PostPageableRes instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'postSort': instance.postSort,
      'offset': instance.offset,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };

PostSortRes _$PostSortResFromJson(Map<String, dynamic> json) => PostSortRes(
      sorted: json['sorted'] as bool?,
      empty: json['empty'] as bool?,
      unsorted: json['unsorted'] as bool?,
    );

Map<String, dynamic> _$PostSortResToJson(PostSortRes instance) =>
    <String, dynamic>{
      'sorted': instance.sorted,
      'empty': instance.empty,
      'unsorted': instance.unsorted,
    };
