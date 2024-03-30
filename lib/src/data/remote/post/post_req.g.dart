// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostReq _$PostReqFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['images', 'password', 'nickname', 'userId'],
  );
  return PostReq(
    title: json['title'] as String,
    content: json['content'] as String,
    imageList: (json['images'] as List<dynamic>?)
        ?.map((e) => PostImageReq.fromJson(e as Map<String, dynamic>))
        .toList(),
    password: json['password'] as int?,
    nickname: json['nickname'] as String,
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

  writeNotNull('images', instance.imageList);
  writeNotNull('password', instance.password);
  val['nickname'] = instance.nickname;
  val['userId'] = instance.userId;
  return val;
}

PostImageReq _$PostImageReqFromJson(Map<String, dynamic> json) => PostImageReq(
      id: json['id'] as int,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PostImageReqToJson(PostImageReq instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };
