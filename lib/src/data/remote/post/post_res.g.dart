// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRes _$PostResFromJson(Map<String, dynamic> json) => PostRes(
      dataList: (json['data'] as List<dynamic>)
          .map((e) => PostDataRes.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageInfo:
          PostPageInfoRes.fromJson(json['pageInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostResToJson(PostRes instance) => <String, dynamic>{
      'data': instance.dataList,
      'pageInfo': instance.pageInfo,
    };

PostDataRes _$PostDataResFromJson(Map<String, dynamic> json) => PostDataRes(
      postId: json['postId'] as int?,
      title: json['title'] as String,
      content: json['content'] as String,
      userId: json['userId'] as String,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => PostImageRes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostDataResToJson(PostDataRes instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'title': instance.title,
      'content': instance.content,
      'userId': instance.userId,
      'images': instance.images,
    };

PostImageRes _$PostImageResFromJson(Map<String, dynamic> json) => PostImageRes(
      postId: json['postId'] as int?,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$PostImageResToJson(PostImageRes instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'imageUrl': instance.imageUrl,
    };

PostPageInfoRes _$PostPageInfoResFromJson(Map<String, dynamic> json) =>
    PostPageInfoRes(
      pageNumber: json['pageNumber'] as int,
      pageSize: json['pageSize'] as int,
      last: json['last'] as bool,
    );

Map<String, dynamic> _$PostPageInfoResToJson(PostPageInfoRes instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'last': instance.last,
    };
