// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentReq _$CommentReqFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['parentId'],
  );
  return CommentReq(
    content: json['content'] as String,
    userId: json['userId'] as String,
    parentId: json['parentId'] as int?,
  );
}

Map<String, dynamic> _$CommentReqToJson(CommentReq instance) {
  final val = <String, dynamic>{
    'content': instance.content,
    'userId': instance.userId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parentId', instance.parentId);
  return val;
}
