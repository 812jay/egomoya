import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/src/model/user/user.dart';
import 'package:egomoya/util/helper/datetime_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class QuestionRes with _$QuestionRes {
  const factory QuestionRes({
    required String questionId,
    required String title,
    required String content,
    required String uid,
    UserRes? user,
    @Default([]) List<String> imgNameList,
    @Default([]) List<String> imgPathList,
    int? commentCnt,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
    @Default(0) int viewCnt,
  }) = _QuestionRes;
  factory QuestionRes.fromJson(Map<String, dynamic> json) =>
      _$QuestionResFromJson(json);
}

@freezed
class QuestionReq with _$QuestionReq {
  const factory QuestionReq({
    required String questionId,
    required String title,
    required String content,
    required String uid,
    @Default([]) List<String> imgNameList,
    @DateTimeConverter() required Timestamp createdAt,
    @DateTimeConverter() required Timestamp updatedAt,
  }) = _QuestionReq;
  factory QuestionReq.fromJson(Map<String, dynamic> json) =>
      _$QuestionReqFromJson(json);
}
