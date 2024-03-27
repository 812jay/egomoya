// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostReq _$PostReqFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['id', 'images', 'password'],
  );
  return PostReq(
    id: json['id'] as int?,
    title: json['title'] as String,
    content: json['content'] as String,
    imageList: (json['images'] as List<dynamic>?)
        ?.map((e) => PostImageReq.fromJson(e as Map<String, dynamic>))
        .toList(),
    password: json['password'] as int?,
  );
}

Map<String, dynamic> _$PostReqToJson(PostReq instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['title'] = instance.title;
  val['content'] = instance.content;
  writeNotNull('images', instance.imageList);
  writeNotNull('password', instance.password);
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
