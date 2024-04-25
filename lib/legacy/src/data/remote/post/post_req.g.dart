// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostReq _$PostReqFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['userId'],
  );
  return PostReq(
    title: json['title'] as String,
    content: json['content'] as String?,
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$PostReqToJson(PostReq instance) => <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'userId': instance.userId,
    };
