// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostReq _$PostReqFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['password', 'nickname', 'userId'],
  );
  return PostReq(
    title: json['title'] as String,
    content: json['content'] as String?,
    password: json['password'] as String?,
    nickname: json['nickname'] as String?,
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$PostReqToJson(PostReq instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'content': instance.content,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password', instance.password);
  writeNotNull('nickname', instance.nickname);
  val['userId'] = instance.userId;
  return val;
}
