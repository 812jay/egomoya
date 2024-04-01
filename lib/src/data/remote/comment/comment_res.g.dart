// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentRes _$CommentResFromJson(Map<String, dynamic> json) => CommentRes(
      dataList: (json['data'] as List<dynamic>)
          .map((e) => CommentDataRes.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageInfo:
          CommentPageInfoRes.fromJson(json['pageInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentResToJson(CommentRes instance) =>
    <String, dynamic>{
      'data': instance.dataList,
      'pageInfo': instance.pageInfo,
    };

CommentDataRes _$CommentDataResFromJson(Map<String, dynamic> json) =>
    CommentDataRes(
      id: json['id'] as int,
      content: json['content'] as String?,
      user: json['user'] == null
          ? null
          : UserRes.fromJson(json['user'] as Map<String, dynamic>),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => CommentDataRes.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$CommentDataResToJson(CommentDataRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'user': instance.user,
      'children': instance.children,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

CommentPageInfoRes _$CommentPageInfoResFromJson(Map<String, dynamic> json) =>
    CommentPageInfoRes(
      pageNumber: json['pageNumber'] as int,
      pageSize: json['pageSize'] as int,
      last: json['last'] as bool,
    );

Map<String, dynamic> _$CommentPageInfoResToJson(CommentPageInfoRes instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'last': instance.last,
    };
