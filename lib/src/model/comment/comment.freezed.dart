// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentRes _$CommentResFromJson(Map<String, dynamic> json) {
  return _CommentRes.fromJson(json);
}

/// @nodoc
mixin _$CommentRes {
  String? get parentId => throw _privateConstructorUsedError;
  String get questionId => throw _privateConstructorUsedError;
  String get commentId => throw _privateConstructorUsedError;
  UserRes? get user => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<CommentRes>? get children => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentResCopyWith<CommentRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentResCopyWith<$Res> {
  factory $CommentResCopyWith(
          CommentRes value, $Res Function(CommentRes) then) =
      _$CommentResCopyWithImpl<$Res, CommentRes>;
  @useResult
  $Res call(
      {String? parentId,
      String questionId,
      String commentId,
      UserRes? user,
      String content,
      List<CommentRes>? children,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});

  $UserResCopyWith<$Res>? get user;
}

/// @nodoc
class _$CommentResCopyWithImpl<$Res, $Val extends CommentRes>
    implements $CommentResCopyWith<$Res> {
  _$CommentResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parentId = freezed,
    Object? questionId = null,
    Object? commentId = null,
    Object? user = freezed,
    Object? content = null,
    Object? children = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserRes?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<CommentRes>?,
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

  @override
  @pragma('vm:prefer-inline')
  $UserResCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserResCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentResImplCopyWith<$Res>
    implements $CommentResCopyWith<$Res> {
  factory _$$CommentResImplCopyWith(
          _$CommentResImpl value, $Res Function(_$CommentResImpl) then) =
      __$$CommentResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? parentId,
      String questionId,
      String commentId,
      UserRes? user,
      String content,
      List<CommentRes>? children,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});

  @override
  $UserResCopyWith<$Res>? get user;
}

/// @nodoc
class __$$CommentResImplCopyWithImpl<$Res>
    extends _$CommentResCopyWithImpl<$Res, _$CommentResImpl>
    implements _$$CommentResImplCopyWith<$Res> {
  __$$CommentResImplCopyWithImpl(
      _$CommentResImpl _value, $Res Function(_$CommentResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parentId = freezed,
    Object? questionId = null,
    Object? commentId = null,
    Object? user = freezed,
    Object? content = null,
    Object? children = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CommentResImpl(
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserRes?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<CommentRes>?,
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
class _$CommentResImpl implements _CommentRes {
  const _$CommentResImpl(
      {this.parentId,
      required this.questionId,
      required this.commentId,
      this.user,
      this.content = '',
      final List<CommentRes>? children,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt})
      : _children = children;

  factory _$CommentResImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentResImplFromJson(json);

  @override
  final String? parentId;
  @override
  final String questionId;
  @override
  final String commentId;
  @override
  final UserRes? user;
  @override
  @JsonKey()
  final String content;
  final List<CommentRes>? _children;
  @override
  List<CommentRes>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'CommentRes(parentId: $parentId, questionId: $questionId, commentId: $commentId, user: $user, content: $content, children: $children, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentResImpl &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      parentId,
      questionId,
      commentId,
      user,
      content,
      const DeepCollectionEquality().hash(_children),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentResImplCopyWith<_$CommentResImpl> get copyWith =>
      __$$CommentResImplCopyWithImpl<_$CommentResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentResImplToJson(
      this,
    );
  }
}

abstract class _CommentRes implements CommentRes {
  const factory _CommentRes(
          {final String? parentId,
          required final String questionId,
          required final String commentId,
          final UserRes? user,
          final String content,
          final List<CommentRes>? children,
          @TimestampConverter() required final DateTime createdAt,
          @TimestampConverter() required final DateTime updatedAt}) =
      _$CommentResImpl;

  factory _CommentRes.fromJson(Map<String, dynamic> json) =
      _$CommentResImpl.fromJson;

  @override
  String? get parentId;
  @override
  String get questionId;
  @override
  String get commentId;
  @override
  UserRes? get user;
  @override
  String get content;
  @override
  List<CommentRes>? get children;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$CommentResImplCopyWith<_$CommentResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentReq _$CommentReqFromJson(Map<String, dynamic> json) {
  return _CommentReq.fromJson(json);
}

/// @nodoc
mixin _$CommentReq {
  String get questionId => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  String get commentId => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentReqCopyWith<CommentReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentReqCopyWith<$Res> {
  factory $CommentReqCopyWith(
          CommentReq value, $Res Function(CommentReq) then) =
      _$CommentReqCopyWithImpl<$Res, CommentReq>;
  @useResult
  $Res call(
      {String questionId,
      String? parentId,
      String commentId,
      String uid,
      String content,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class _$CommentReqCopyWithImpl<$Res, $Val extends CommentReq>
    implements $CommentReqCopyWith<$Res> {
  _$CommentReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? parentId = freezed,
    Object? commentId = null,
    Object? uid = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$CommentReqImplCopyWith<$Res>
    implements $CommentReqCopyWith<$Res> {
  factory _$$CommentReqImplCopyWith(
          _$CommentReqImpl value, $Res Function(_$CommentReqImpl) then) =
      __$$CommentReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String questionId,
      String? parentId,
      String commentId,
      String uid,
      String content,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class __$$CommentReqImplCopyWithImpl<$Res>
    extends _$CommentReqCopyWithImpl<$Res, _$CommentReqImpl>
    implements _$$CommentReqImplCopyWith<$Res> {
  __$$CommentReqImplCopyWithImpl(
      _$CommentReqImpl _value, $Res Function(_$CommentReqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? parentId = freezed,
    Object? commentId = null,
    Object? uid = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CommentReqImpl(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$CommentReqImpl implements _CommentReq {
  const _$CommentReqImpl(
      {required this.questionId,
      this.parentId,
      required this.commentId,
      required this.uid,
      this.content = '',
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt});

  factory _$CommentReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentReqImplFromJson(json);

  @override
  final String questionId;
  @override
  final String? parentId;
  @override
  final String commentId;
  @override
  final String uid;
  @override
  @JsonKey()
  final String content;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'CommentReq(questionId: $questionId, parentId: $parentId, commentId: $commentId, uid: $uid, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentReqImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, questionId, parentId, commentId,
      uid, content, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentReqImplCopyWith<_$CommentReqImpl> get copyWith =>
      __$$CommentReqImplCopyWithImpl<_$CommentReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentReqImplToJson(
      this,
    );
  }
}

abstract class _CommentReq implements CommentReq {
  const factory _CommentReq(
          {required final String questionId,
          final String? parentId,
          required final String commentId,
          required final String uid,
          final String content,
          @TimestampConverter() required final DateTime createdAt,
          @TimestampConverter() required final DateTime updatedAt}) =
      _$CommentReqImpl;

  factory _CommentReq.fromJson(Map<String, dynamic> json) =
      _$CommentReqImpl.fromJson;

  @override
  String get questionId;
  @override
  String? get parentId;
  @override
  String get commentId;
  @override
  String get uid;
  @override
  String get content;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$CommentReqImplCopyWith<_$CommentReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
