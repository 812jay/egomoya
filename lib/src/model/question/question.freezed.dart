// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuestionRes _$QuestionResFromJson(Map<String, dynamic> json) {
  return _QuestionRes.fromJson(json);
}

/// @nodoc
mixin _$QuestionRes {
  String get questionId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  List<String> get imgNameList => throw _privateConstructorUsedError;
  List<String> get imgPathList => throw _privateConstructorUsedError;
  int? get commentCnt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionResCopyWith<QuestionRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionResCopyWith<$Res> {
  factory $QuestionResCopyWith(
          QuestionRes value, $Res Function(QuestionRes) then) =
      _$QuestionResCopyWithImpl<$Res, QuestionRes>;
  @useResult
  $Res call(
      {String questionId,
      String title,
      String content,
      String uid,
      List<String> imgNameList,
      List<String> imgPathList,
      int? commentCnt,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class _$QuestionResCopyWithImpl<$Res, $Val extends QuestionRes>
    implements $QuestionResCopyWith<$Res> {
  _$QuestionResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? title = null,
    Object? content = null,
    Object? uid = null,
    Object? imgNameList = null,
    Object? imgPathList = null,
    Object? commentCnt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      imgNameList: null == imgNameList
          ? _value.imgNameList
          : imgNameList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imgPathList: null == imgPathList
          ? _value.imgPathList
          : imgPathList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commentCnt: freezed == commentCnt
          ? _value.commentCnt
          : commentCnt // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$QuestionResImplCopyWith<$Res>
    implements $QuestionResCopyWith<$Res> {
  factory _$$QuestionResImplCopyWith(
          _$QuestionResImpl value, $Res Function(_$QuestionResImpl) then) =
      __$$QuestionResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String questionId,
      String title,
      String content,
      String uid,
      List<String> imgNameList,
      List<String> imgPathList,
      int? commentCnt,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class __$$QuestionResImplCopyWithImpl<$Res>
    extends _$QuestionResCopyWithImpl<$Res, _$QuestionResImpl>
    implements _$$QuestionResImplCopyWith<$Res> {
  __$$QuestionResImplCopyWithImpl(
      _$QuestionResImpl _value, $Res Function(_$QuestionResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? title = null,
    Object? content = null,
    Object? uid = null,
    Object? imgNameList = null,
    Object? imgPathList = null,
    Object? commentCnt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$QuestionResImpl(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      imgNameList: null == imgNameList
          ? _value._imgNameList
          : imgNameList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imgPathList: null == imgPathList
          ? _value._imgPathList
          : imgPathList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commentCnt: freezed == commentCnt
          ? _value.commentCnt
          : commentCnt // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$QuestionResImpl implements _QuestionRes {
  const _$QuestionResImpl(
      {required this.questionId,
      required this.title,
      required this.content,
      required this.uid,
      final List<String> imgNameList = const [],
      final List<String> imgPathList = const [],
      this.commentCnt,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt})
      : _imgNameList = imgNameList,
        _imgPathList = imgPathList;

  factory _$QuestionResImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionResImplFromJson(json);

  @override
  final String questionId;
  @override
  final String title;
  @override
  final String content;
  @override
  final String uid;
  final List<String> _imgNameList;
  @override
  @JsonKey()
  List<String> get imgNameList {
    if (_imgNameList is EqualUnmodifiableListView) return _imgNameList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imgNameList);
  }

  final List<String> _imgPathList;
  @override
  @JsonKey()
  List<String> get imgPathList {
    if (_imgPathList is EqualUnmodifiableListView) return _imgPathList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imgPathList);
  }

  @override
  final int? commentCnt;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'QuestionRes(questionId: $questionId, title: $title, content: $content, uid: $uid, imgNameList: $imgNameList, imgPathList: $imgPathList, commentCnt: $commentCnt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionResImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            const DeepCollectionEquality()
                .equals(other._imgNameList, _imgNameList) &&
            const DeepCollectionEquality()
                .equals(other._imgPathList, _imgPathList) &&
            (identical(other.commentCnt, commentCnt) ||
                other.commentCnt == commentCnt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      questionId,
      title,
      content,
      uid,
      const DeepCollectionEquality().hash(_imgNameList),
      const DeepCollectionEquality().hash(_imgPathList),
      commentCnt,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionResImplCopyWith<_$QuestionResImpl> get copyWith =>
      __$$QuestionResImplCopyWithImpl<_$QuestionResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionResImplToJson(
      this,
    );
  }
}

abstract class _QuestionRes implements QuestionRes {
  const factory _QuestionRes(
          {required final String questionId,
          required final String title,
          required final String content,
          required final String uid,
          final List<String> imgNameList,
          final List<String> imgPathList,
          final int? commentCnt,
          @TimestampConverter() required final DateTime createdAt,
          @TimestampConverter() required final DateTime updatedAt}) =
      _$QuestionResImpl;

  factory _QuestionRes.fromJson(Map<String, dynamic> json) =
      _$QuestionResImpl.fromJson;

  @override
  String get questionId;
  @override
  String get title;
  @override
  String get content;
  @override
  String get uid;
  @override
  List<String> get imgNameList;
  @override
  List<String> get imgPathList;
  @override
  int? get commentCnt;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$QuestionResImplCopyWith<_$QuestionResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuestionReq _$QuestionReqFromJson(Map<String, dynamic> json) {
  return _QuestionReq.fromJson(json);
}

/// @nodoc
mixin _$QuestionReq {
  String get questionId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  List<String> get imgNameList => throw _privateConstructorUsedError;
  @DateTimeConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionReqCopyWith<QuestionReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionReqCopyWith<$Res> {
  factory $QuestionReqCopyWith(
          QuestionReq value, $Res Function(QuestionReq) then) =
      _$QuestionReqCopyWithImpl<$Res, QuestionReq>;
  @useResult
  $Res call(
      {String questionId,
      String title,
      String content,
      String uid,
      List<String> imgNameList,
      @DateTimeConverter() Timestamp createdAt,
      @DateTimeConverter() Timestamp updatedAt});
}

/// @nodoc
class _$QuestionReqCopyWithImpl<$Res, $Val extends QuestionReq>
    implements $QuestionReqCopyWith<$Res> {
  _$QuestionReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? title = null,
    Object? content = null,
    Object? uid = null,
    Object? imgNameList = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      imgNameList: null == imgNameList
          ? _value.imgNameList
          : imgNameList // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$QuestionReqImplCopyWith<$Res>
    implements $QuestionReqCopyWith<$Res> {
  factory _$$QuestionReqImplCopyWith(
          _$QuestionReqImpl value, $Res Function(_$QuestionReqImpl) then) =
      __$$QuestionReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String questionId,
      String title,
      String content,
      String uid,
      List<String> imgNameList,
      @DateTimeConverter() Timestamp createdAt,
      @DateTimeConverter() Timestamp updatedAt});
}

/// @nodoc
class __$$QuestionReqImplCopyWithImpl<$Res>
    extends _$QuestionReqCopyWithImpl<$Res, _$QuestionReqImpl>
    implements _$$QuestionReqImplCopyWith<$Res> {
  __$$QuestionReqImplCopyWithImpl(
      _$QuestionReqImpl _value, $Res Function(_$QuestionReqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? title = null,
    Object? content = null,
    Object? uid = null,
    Object? imgNameList = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$QuestionReqImpl(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      imgNameList: null == imgNameList
          ? _value._imgNameList
          : imgNameList // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$QuestionReqImpl implements _QuestionReq {
  const _$QuestionReqImpl(
      {required this.questionId,
      required this.title,
      required this.content,
      required this.uid,
      final List<String> imgNameList = const [],
      @DateTimeConverter() required this.createdAt,
      @DateTimeConverter() required this.updatedAt})
      : _imgNameList = imgNameList;

  factory _$QuestionReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionReqImplFromJson(json);

  @override
  final String questionId;
  @override
  final String title;
  @override
  final String content;
  @override
  final String uid;
  final List<String> _imgNameList;
  @override
  @JsonKey()
  List<String> get imgNameList {
    if (_imgNameList is EqualUnmodifiableListView) return _imgNameList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imgNameList);
  }

  @override
  @DateTimeConverter()
  final Timestamp createdAt;
  @override
  @DateTimeConverter()
  final Timestamp updatedAt;

  @override
  String toString() {
    return 'QuestionReq(questionId: $questionId, title: $title, content: $content, uid: $uid, imgNameList: $imgNameList, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionReqImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            const DeepCollectionEquality()
                .equals(other._imgNameList, _imgNameList) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, questionId, title, content, uid,
      const DeepCollectionEquality().hash(_imgNameList), createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionReqImplCopyWith<_$QuestionReqImpl> get copyWith =>
      __$$QuestionReqImplCopyWithImpl<_$QuestionReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionReqImplToJson(
      this,
    );
  }
}

abstract class _QuestionReq implements QuestionReq {
  const factory _QuestionReq(
          {required final String questionId,
          required final String title,
          required final String content,
          required final String uid,
          final List<String> imgNameList,
          @DateTimeConverter() required final Timestamp createdAt,
          @DateTimeConverter() required final Timestamp updatedAt}) =
      _$QuestionReqImpl;

  factory _QuestionReq.fromJson(Map<String, dynamic> json) =
      _$QuestionReqImpl.fromJson;

  @override
  String get questionId;
  @override
  String get title;
  @override
  String get content;
  @override
  String get uid;
  @override
  List<String> get imgNameList;
  @override
  @DateTimeConverter()
  Timestamp get createdAt;
  @override
  @DateTimeConverter()
  Timestamp get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$QuestionReqImplCopyWith<_$QuestionReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
