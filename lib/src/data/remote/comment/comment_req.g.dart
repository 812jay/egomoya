// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentReq _$CommentReqFromJson(Map<String, dynamic> json) => CommentReq(
      content: json['content'] as String,
      userId: json['userId'] as String,
      parentId: json['parentId'] as String?,
    );

Map<String, dynamic> _$CommentReqToJson(CommentReq instance) =>
    <String, dynamic>{
      'content': instance.content,
      'userId': instance.userId,
      'parentId': instance.parentId,
    };
