import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egomoya/util/helper/datetime_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String profileImgName,
    required String email,
    required String signInWith,
    String? nickName,
    String? description,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
