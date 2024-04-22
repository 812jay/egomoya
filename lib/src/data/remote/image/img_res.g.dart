// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'img_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImgRes _$ImgResFromJson(Map<String, dynamic> json) => ImgRes(
      imageUrl: json['imageUrl'] as String,
      userId: json['userId'] as String?,
      postId: json['postId'] as int?,
      uploadName: json['uploadName'] as String,
    );

Map<String, dynamic> _$ImgResToJson(ImgRes instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'userId': instance.userId,
      'postId': instance.postId,
      'uploadName': instance.uploadName,
    };
