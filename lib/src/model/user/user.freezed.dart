// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRes _$UserResFromJson(Map<String, dynamic> json) {
  return _UserRes.fromJson(json);
}

/// @nodoc
mixin _$UserRes {
  String get uid => throw _privateConstructorUsedError;
  String? get profileImgName => throw _privateConstructorUsedError;
  String? get profileImgPath => throw _privateConstructorUsedError;
  String get signInMethod => throw _privateConstructorUsedError;
  String? get nickName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserResCopyWith<UserRes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResCopyWith<$Res> {
  factory $UserResCopyWith(UserRes value, $Res Function(UserRes) then) =
      _$UserResCopyWithImpl<$Res, UserRes>;
  @useResult
  $Res call(
      {String uid,
      String? profileImgName,
      String? profileImgPath,
      String signInMethod,
      String? nickName,
      String? description,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class _$UserResCopyWithImpl<$Res, $Val extends UserRes>
    implements $UserResCopyWith<$Res> {
  _$UserResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? profileImgName = freezed,
    Object? profileImgPath = freezed,
    Object? signInMethod = null,
    Object? nickName = freezed,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      profileImgName: freezed == profileImgName
          ? _value.profileImgName
          : profileImgName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImgPath: freezed == profileImgPath
          ? _value.profileImgPath
          : profileImgPath // ignore: cast_nullable_to_non_nullable
              as String?,
      signInMethod: null == signInMethod
          ? _value.signInMethod
          : signInMethod // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserResImplCopyWith<$Res> implements $UserResCopyWith<$Res> {
  factory _$$UserResImplCopyWith(
          _$UserResImpl value, $Res Function(_$UserResImpl) then) =
      __$$UserResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String? profileImgName,
      String? profileImgPath,
      String signInMethod,
      String? nickName,
      String? description,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class __$$UserResImplCopyWithImpl<$Res>
    extends _$UserResCopyWithImpl<$Res, _$UserResImpl>
    implements _$$UserResImplCopyWith<$Res> {
  __$$UserResImplCopyWithImpl(
      _$UserResImpl _value, $Res Function(_$UserResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? profileImgName = freezed,
    Object? profileImgPath = freezed,
    Object? signInMethod = null,
    Object? nickName = freezed,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserResImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      profileImgName: freezed == profileImgName
          ? _value.profileImgName
          : profileImgName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImgPath: freezed == profileImgPath
          ? _value.profileImgPath
          : profileImgPath // ignore: cast_nullable_to_non_nullable
              as String?,
      signInMethod: null == signInMethod
          ? _value.signInMethod
          : signInMethod // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResImpl implements _UserRes {
  const _$UserResImpl(
      {required this.uid,
      this.profileImgName,
      this.profileImgPath,
      required this.signInMethod,
      this.nickName,
      this.description,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt});

  factory _$UserResImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResImplFromJson(json);

  @override
  final String uid;
  @override
  final String? profileImgName;
  @override
  final String? profileImgPath;
  @override
  final String signInMethod;
  @override
  final String? nickName;
  @override
  final String? description;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserRes(uid: $uid, profileImgName: $profileImgName, profileImgPath: $profileImgPath, signInMethod: $signInMethod, nickName: $nickName, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.profileImgName, profileImgName) ||
                other.profileImgName == profileImgName) &&
            (identical(other.profileImgPath, profileImgPath) ||
                other.profileImgPath == profileImgPath) &&
            (identical(other.signInMethod, signInMethod) ||
                other.signInMethod == signInMethod) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      profileImgName,
      profileImgPath,
      signInMethod,
      nickName,
      description,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResImplCopyWith<_$UserResImpl> get copyWith =>
      __$$UserResImplCopyWithImpl<_$UserResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResImplToJson(
      this,
    );
  }
}

abstract class _UserRes implements UserRes {
  const factory _UserRes(
      {required final String uid,
      final String? profileImgName,
      final String? profileImgPath,
      required final String signInMethod,
      final String? nickName,
      final String? description,
      @TimestampConverter() required final DateTime createdAt,
      @TimestampConverter() required final DateTime updatedAt}) = _$UserResImpl;

  factory _UserRes.fromJson(Map<String, dynamic> json) = _$UserResImpl.fromJson;

  @override
  String get uid;
  @override
  String? get profileImgName;
  @override
  String? get profileImgPath;
  @override
  String get signInMethod;
  @override
  String? get nickName;
  @override
  String? get description;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$UserResImplCopyWith<_$UserResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserReq _$UserReqFromJson(Map<String, dynamic> json) {
  return _UserReq.fromJson(json);
}

/// @nodoc
mixin _$UserReq {
  String get uid => throw _privateConstructorUsedError;
  String? get profileImgName => throw _privateConstructorUsedError;
  String get signInMethod => throw _privateConstructorUsedError;
  String? get nickName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @DateTimeConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserReqCopyWith<UserReq> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserReqCopyWith<$Res> {
  factory $UserReqCopyWith(UserReq value, $Res Function(UserReq) then) =
      _$UserReqCopyWithImpl<$Res, UserReq>;
  @useResult
  $Res call(
      {String uid,
      String? profileImgName,
      String signInMethod,
      String? nickName,
      String? description,
      @DateTimeConverter() Timestamp createdAt,
      @DateTimeConverter() Timestamp updatedAt});
}

/// @nodoc
class _$UserReqCopyWithImpl<$Res, $Val extends UserReq>
    implements $UserReqCopyWith<$Res> {
  _$UserReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? profileImgName = freezed,
    Object? signInMethod = null,
    Object? nickName = freezed,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      profileImgName: freezed == profileImgName
          ? _value.profileImgName
          : profileImgName // ignore: cast_nullable_to_non_nullable
              as String?,
      signInMethod: null == signInMethod
          ? _value.signInMethod
          : signInMethod // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserReqImplCopyWith<$Res> implements $UserReqCopyWith<$Res> {
  factory _$$UserReqImplCopyWith(
          _$UserReqImpl value, $Res Function(_$UserReqImpl) then) =
      __$$UserReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String? profileImgName,
      String signInMethod,
      String? nickName,
      String? description,
      @DateTimeConverter() Timestamp createdAt,
      @DateTimeConverter() Timestamp updatedAt});
}

/// @nodoc
class __$$UserReqImplCopyWithImpl<$Res>
    extends _$UserReqCopyWithImpl<$Res, _$UserReqImpl>
    implements _$$UserReqImplCopyWith<$Res> {
  __$$UserReqImplCopyWithImpl(
      _$UserReqImpl _value, $Res Function(_$UserReqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? profileImgName = freezed,
    Object? signInMethod = null,
    Object? nickName = freezed,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserReqImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      profileImgName: freezed == profileImgName
          ? _value.profileImgName
          : profileImgName // ignore: cast_nullable_to_non_nullable
              as String?,
      signInMethod: null == signInMethod
          ? _value.signInMethod
          : signInMethod // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserReqImpl implements _UserReq {
  const _$UserReqImpl(
      {required this.uid,
      this.profileImgName,
      required this.signInMethod,
      this.nickName,
      this.description,
      @DateTimeConverter() required this.createdAt,
      @DateTimeConverter() required this.updatedAt});

  factory _$UserReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserReqImplFromJson(json);

  @override
  final String uid;
  @override
  final String? profileImgName;
  @override
  final String signInMethod;
  @override
  final String? nickName;
  @override
  final String? description;
  @override
  @DateTimeConverter()
  final Timestamp createdAt;
  @override
  @DateTimeConverter()
  final Timestamp updatedAt;

  @override
  String toString() {
    return 'UserReq(uid: $uid, profileImgName: $profileImgName, signInMethod: $signInMethod, nickName: $nickName, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserReqImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.profileImgName, profileImgName) ||
                other.profileImgName == profileImgName) &&
            (identical(other.signInMethod, signInMethod) ||
                other.signInMethod == signInMethod) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, profileImgName,
      signInMethod, nickName, description, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserReqImplCopyWith<_$UserReqImpl> get copyWith =>
      __$$UserReqImplCopyWithImpl<_$UserReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserReqImplToJson(
      this,
    );
  }
}

abstract class _UserReq implements UserReq {
  const factory _UserReq(
      {required final String uid,
      final String? profileImgName,
      required final String signInMethod,
      final String? nickName,
      final String? description,
      @DateTimeConverter() required final Timestamp createdAt,
      @DateTimeConverter() required final Timestamp updatedAt}) = _$UserReqImpl;

  factory _UserReq.fromJson(Map<String, dynamic> json) = _$UserReqImpl.fromJson;

  @override
  String get uid;
  @override
  String? get profileImgName;
  @override
  String get signInMethod;
  @override
  String? get nickName;
  @override
  String? get description;
  @override
  @DateTimeConverter()
  Timestamp get createdAt;
  @override
  @DateTimeConverter()
  Timestamp get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$UserReqImplCopyWith<_$UserReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
