// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionResImpl _$$QuestionResImplFromJson(Map<String, dynamic> json) =>
    _$QuestionResImpl(
      questionId: json['questionId'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      uid: json['uid'] as String,
      user: json['user'] == null
          ? null
          : UserRes.fromJson(json['user'] as Map<String, dynamic>),
      imgNameList: (json['imgNameList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      imgPathList: (json['imgPathList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      commentCnt: json['commentCnt'] as int?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
      viewCnt: json['viewCnt'] as int? ?? 0,
    );

Map<String, dynamic> _$$QuestionResImplToJson(_$QuestionResImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'title': instance.title,
      'content': instance.content,
      'uid': instance.uid,
      'user': instance.user,
      'imgNameList': instance.imgNameList,
      'imgPathList': instance.imgPathList,
      'commentCnt': instance.commentCnt,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'viewCnt': instance.viewCnt,
    };

_$QuestionReqImpl _$$QuestionReqImplFromJson(Map<String, dynamic> json) =>
    _$QuestionReqImpl(
      questionId: json['questionId'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      uid: json['uid'] as String,
      imgNameList: (json['imgNameList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as DateTime),
      updatedAt:
          const DateTimeConverter().fromJson(json['updatedAt'] as DateTime),
    );

Map<String, dynamic> _$$QuestionReqImplToJson(_$QuestionReqImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'title': instance.title,
      'content': instance.content,
      'uid': instance.uid,
      'imgNameList': instance.imgNameList,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeConverter().toJson(instance.updatedAt),
    };
