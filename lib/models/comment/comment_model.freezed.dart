// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return _CommentModel.fromJson(json);
}

/// @nodoc
mixin _$CommentModel {
  Users? get users => throw _privateConstructorUsedError;
  Comment? get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentModelCopyWith<CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentModelCopyWith<$Res> {
  factory $CommentModelCopyWith(
          CommentModel value, $Res Function(CommentModel) then) =
      _$CommentModelCopyWithImpl<$Res, CommentModel>;
  @useResult
  $Res call({Users? users, Comment? comment});

  $UsersCopyWith<$Res>? get users;
  $CommentCopyWith<$Res>? get comment;
}

/// @nodoc
class _$CommentModelCopyWithImpl<$Res, $Val extends CommentModel>
    implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Users?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as Comment?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsersCopyWith<$Res>? get users {
    if (_value.users == null) {
      return null;
    }

    return $UsersCopyWith<$Res>(_value.users!, (value) {
      return _then(_value.copyWith(users: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentCopyWith<$Res>? get comment {
    if (_value.comment == null) {
      return null;
    }

    return $CommentCopyWith<$Res>(_value.comment!, (value) {
      return _then(_value.copyWith(comment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CommentModelCopyWith<$Res>
    implements $CommentModelCopyWith<$Res> {
  factory _$$_CommentModelCopyWith(
          _$_CommentModel value, $Res Function(_$_CommentModel) then) =
      __$$_CommentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Users? users, Comment? comment});

  @override
  $UsersCopyWith<$Res>? get users;
  @override
  $CommentCopyWith<$Res>? get comment;
}

/// @nodoc
class __$$_CommentModelCopyWithImpl<$Res>
    extends _$CommentModelCopyWithImpl<$Res, _$_CommentModel>
    implements _$$_CommentModelCopyWith<$Res> {
  __$$_CommentModelCopyWithImpl(
      _$_CommentModel _value, $Res Function(_$_CommentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
    Object? comment = freezed,
  }) {
    return _then(_$_CommentModel(
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Users?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as Comment?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentModel implements _CommentModel {
  const _$_CommentModel({this.users, this.comment});

  factory _$_CommentModel.fromJson(Map<String, dynamic> json) =>
      _$$_CommentModelFromJson(json);

  @override
  final Users? users;
  @override
  final Comment? comment;

  @override
  String toString() {
    return 'CommentModel(users: $users, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentModel &&
            (identical(other.users, users) || other.users == users) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, users, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentModelCopyWith<_$_CommentModel> get copyWith =>
      __$$_CommentModelCopyWithImpl<_$_CommentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentModelToJson(
      this,
    );
  }
}

abstract class _CommentModel implements CommentModel {
  const factory _CommentModel({final Users? users, final Comment? comment}) =
      _$_CommentModel;

  factory _CommentModel.fromJson(Map<String, dynamic> json) =
      _$_CommentModel.fromJson;

  @override
  Users? get users;
  @override
  Comment? get comment;
  @override
  @JsonKey(ignore: true)
  _$$_CommentModelCopyWith<_$_CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  String? get reply => throw _privateConstructorUsedError;
  int? get likes => throw _privateConstructorUsedError;
  dynamic? get updatedAt => throw _privateConstructorUsedError;
  int? get pSeq => throw _privateConstructorUsedError;
  int? get pageSeq => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  int? get seq => throw _privateConstructorUsedError;
  int? get userSeq => throw _privateConstructorUsedError;
  String? get remaining => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {String? reply,
      int? likes,
      dynamic? updatedAt,
      int? pSeq,
      int? pageSeq,
      String? photo,
      String? createdAt,
      int? seq,
      int? userSeq,
      String? remaining});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reply = freezed,
    Object? likes = freezed,
    Object? updatedAt = freezed,
    Object? pSeq = freezed,
    Object? pageSeq = freezed,
    Object? photo = freezed,
    Object? createdAt = freezed,
    Object? seq = freezed,
    Object? userSeq = freezed,
    Object? remaining = freezed,
  }) {
    return _then(_value.copyWith(
      reply: freezed == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      pSeq: freezed == pSeq
          ? _value.pSeq
          : pSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSeq: freezed == pageSeq
          ? _value.pageSeq
          : pageSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      userSeq: freezed == userSeq
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      remaining: freezed == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$_CommentCopyWith(
          _$_Comment value, $Res Function(_$_Comment) then) =
      __$$_CommentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? reply,
      int? likes,
      dynamic? updatedAt,
      int? pSeq,
      int? pageSeq,
      String? photo,
      String? createdAt,
      int? seq,
      int? userSeq,
      String? remaining});
}

/// @nodoc
class __$$_CommentCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$_Comment>
    implements _$$_CommentCopyWith<$Res> {
  __$$_CommentCopyWithImpl(_$_Comment _value, $Res Function(_$_Comment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reply = freezed,
    Object? likes = freezed,
    Object? updatedAt = freezed,
    Object? pSeq = freezed,
    Object? pageSeq = freezed,
    Object? photo = freezed,
    Object? createdAt = freezed,
    Object? seq = freezed,
    Object? userSeq = freezed,
    Object? remaining = freezed,
  }) {
    return _then(_$_Comment(
      reply: freezed == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      pSeq: freezed == pSeq
          ? _value.pSeq
          : pSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSeq: freezed == pageSeq
          ? _value.pageSeq
          : pageSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      userSeq: freezed == userSeq
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      remaining: freezed == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Comment implements _Comment {
  const _$_Comment(
      {this.reply,
      this.likes,
      this.updatedAt,
      this.pSeq,
      this.pageSeq,
      this.photo,
      this.createdAt,
      this.seq,
      this.userSeq,
      this.remaining});

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$$_CommentFromJson(json);

  @override
  final String? reply;
  @override
  final int? likes;
  @override
  final dynamic? updatedAt;
  @override
  final int? pSeq;
  @override
  final int? pageSeq;
  @override
  final String? photo;
  @override
  final String? createdAt;
  @override
  final int? seq;
  @override
  final int? userSeq;
  @override
  final String? remaining;

  @override
  String toString() {
    return 'Comment(reply: $reply, likes: $likes, updatedAt: $updatedAt, pSeq: $pSeq, pageSeq: $pageSeq, photo: $photo, createdAt: $createdAt, seq: $seq, userSeq: $userSeq, remaining: $remaining)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Comment &&
            (identical(other.reply, reply) || other.reply == reply) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            (identical(other.pSeq, pSeq) || other.pSeq == pSeq) &&
            (identical(other.pageSeq, pageSeq) || other.pageSeq == pageSeq) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.userSeq, userSeq) || other.userSeq == userSeq) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reply,
      likes,
      const DeepCollectionEquality().hash(updatedAt),
      pSeq,
      pageSeq,
      photo,
      createdAt,
      seq,
      userSeq,
      remaining);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      __$$_CommentCopyWithImpl<_$_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {final String? reply,
      final int? likes,
      final dynamic? updatedAt,
      final int? pSeq,
      final int? pageSeq,
      final String? photo,
      final String? createdAt,
      final int? seq,
      final int? userSeq,
      final String? remaining}) = _$_Comment;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  String? get reply;
  @override
  int? get likes;
  @override
  dynamic? get updatedAt;
  @override
  int? get pSeq;
  @override
  int? get pageSeq;
  @override
  String? get photo;
  @override
  String? get createdAt;
  @override
  int? get seq;
  @override
  int? get userSeq;
  @override
  String? get remaining;
  @override
  @JsonKey(ignore: true)
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}

Users _$UsersFromJson(Map<String, dynamic> json) {
  return _Users.fromJson(json);
}

/// @nodoc
mixin _$Users {
  String? get email => throw _privateConstructorUsedError;
  String? get auth => throw _privateConstructorUsedError;
  int? get followingCnt => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get snsId => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get snsType => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  dynamic? get deletedAt => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get lastLogin => throw _privateConstructorUsedError;
  dynamic? get emailVerifiedAt => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get rememberToken => throw _privateConstructorUsedError;
  String? get memo => throw _privateConstructorUsedError;
  int? get seq => throw _privateConstructorUsedError;
  int? get userLevel => throw _privateConstructorUsedError;
  int? get followCnt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersCopyWith<Users> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersCopyWith<$Res> {
  factory $UsersCopyWith(Users value, $Res Function(Users) then) =
      _$UsersCopyWithImpl<$Res, Users>;
  @useResult
  $Res call(
      {String? email,
      String? auth,
      int? followingCnt,
      String? password,
      String? createdAt,
      String? snsId,
      String? nickname,
      String? updatedAt,
      String? snsType,
      String? photo,
      dynamic? deletedAt,
      String? status,
      String? phoneNumber,
      String? lastLogin,
      dynamic? emailVerifiedAt,
      String? address,
      String? rememberToken,
      String? memo,
      int? seq,
      int? userLevel,
      int? followCnt});
}

/// @nodoc
class _$UsersCopyWithImpl<$Res, $Val extends Users>
    implements $UsersCopyWith<$Res> {
  _$UsersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? auth = freezed,
    Object? followingCnt = freezed,
    Object? password = freezed,
    Object? createdAt = freezed,
    Object? snsId = freezed,
    Object? nickname = freezed,
    Object? updatedAt = freezed,
    Object? snsType = freezed,
    Object? photo = freezed,
    Object? deletedAt = freezed,
    Object? status = freezed,
    Object? phoneNumber = freezed,
    Object? lastLogin = freezed,
    Object? emailVerifiedAt = freezed,
    Object? address = freezed,
    Object? rememberToken = freezed,
    Object? memo = freezed,
    Object? seq = freezed,
    Object? userLevel = freezed,
    Object? followCnt = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      auth: freezed == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String?,
      followingCnt: freezed == followingCnt
          ? _value.followingCnt
          : followingCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      snsId: freezed == snsId
          ? _value.snsId
          : snsId // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      snsType: freezed == snsType
          ? _value.snsType
          : snsType // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      userLevel: freezed == userLevel
          ? _value.userLevel
          : userLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      followCnt: freezed == followCnt
          ? _value.followCnt
          : followCnt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsersCopyWith<$Res> implements $UsersCopyWith<$Res> {
  factory _$$_UsersCopyWith(_$_Users value, $Res Function(_$_Users) then) =
      __$$_UsersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      String? auth,
      int? followingCnt,
      String? password,
      String? createdAt,
      String? snsId,
      String? nickname,
      String? updatedAt,
      String? snsType,
      String? photo,
      dynamic? deletedAt,
      String? status,
      String? phoneNumber,
      String? lastLogin,
      dynamic? emailVerifiedAt,
      String? address,
      String? rememberToken,
      String? memo,
      int? seq,
      int? userLevel,
      int? followCnt});
}

/// @nodoc
class __$$_UsersCopyWithImpl<$Res> extends _$UsersCopyWithImpl<$Res, _$_Users>
    implements _$$_UsersCopyWith<$Res> {
  __$$_UsersCopyWithImpl(_$_Users _value, $Res Function(_$_Users) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? auth = freezed,
    Object? followingCnt = freezed,
    Object? password = freezed,
    Object? createdAt = freezed,
    Object? snsId = freezed,
    Object? nickname = freezed,
    Object? updatedAt = freezed,
    Object? snsType = freezed,
    Object? photo = freezed,
    Object? deletedAt = freezed,
    Object? status = freezed,
    Object? phoneNumber = freezed,
    Object? lastLogin = freezed,
    Object? emailVerifiedAt = freezed,
    Object? address = freezed,
    Object? rememberToken = freezed,
    Object? memo = freezed,
    Object? seq = freezed,
    Object? userLevel = freezed,
    Object? followCnt = freezed,
  }) {
    return _then(_$_Users(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      auth: freezed == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String?,
      followingCnt: freezed == followingCnt
          ? _value.followingCnt
          : followingCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      snsId: freezed == snsId
          ? _value.snsId
          : snsId // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      snsType: freezed == snsType
          ? _value.snsType
          : snsType // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      userLevel: freezed == userLevel
          ? _value.userLevel
          : userLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      followCnt: freezed == followCnt
          ? _value.followCnt
          : followCnt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Users implements _Users {
  const _$_Users(
      {this.email,
      this.auth,
      this.followingCnt,
      this.password,
      this.createdAt,
      this.snsId,
      this.nickname,
      this.updatedAt,
      this.snsType,
      this.photo,
      this.deletedAt,
      this.status,
      this.phoneNumber,
      this.lastLogin,
      this.emailVerifiedAt,
      this.address,
      this.rememberToken,
      this.memo,
      this.seq,
      this.userLevel,
      this.followCnt});

  factory _$_Users.fromJson(Map<String, dynamic> json) =>
      _$$_UsersFromJson(json);

  @override
  final String? email;
  @override
  final String? auth;
  @override
  final int? followingCnt;
  @override
  final String? password;
  @override
  final String? createdAt;
  @override
  final String? snsId;
  @override
  final String? nickname;
  @override
  final String? updatedAt;
  @override
  final String? snsType;
  @override
  final String? photo;
  @override
  final dynamic? deletedAt;
  @override
  final String? status;
  @override
  final String? phoneNumber;
  @override
  final String? lastLogin;
  @override
  final dynamic? emailVerifiedAt;
  @override
  final String? address;
  @override
  final String? rememberToken;
  @override
  final String? memo;
  @override
  final int? seq;
  @override
  final int? userLevel;
  @override
  final int? followCnt;

  @override
  String toString() {
    return 'Users(email: $email, auth: $auth, followingCnt: $followingCnt, password: $password, createdAt: $createdAt, snsId: $snsId, nickname: $nickname, updatedAt: $updatedAt, snsType: $snsType, photo: $photo, deletedAt: $deletedAt, status: $status, phoneNumber: $phoneNumber, lastLogin: $lastLogin, emailVerifiedAt: $emailVerifiedAt, address: $address, rememberToken: $rememberToken, memo: $memo, seq: $seq, userLevel: $userLevel, followCnt: $followCnt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Users &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.auth, auth) || other.auth == auth) &&
            (identical(other.followingCnt, followingCnt) ||
                other.followingCnt == followingCnt) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.snsId, snsId) || other.snsId == snsId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.snsType, snsType) || other.snsType == snsType) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            const DeepCollectionEquality()
                .equals(other.emailVerifiedAt, emailVerifiedAt) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.rememberToken, rememberToken) ||
                other.rememberToken == rememberToken) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.userLevel, userLevel) ||
                other.userLevel == userLevel) &&
            (identical(other.followCnt, followCnt) ||
                other.followCnt == followCnt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        email,
        auth,
        followingCnt,
        password,
        createdAt,
        snsId,
        nickname,
        updatedAt,
        snsType,
        photo,
        const DeepCollectionEquality().hash(deletedAt),
        status,
        phoneNumber,
        lastLogin,
        const DeepCollectionEquality().hash(emailVerifiedAt),
        address,
        rememberToken,
        memo,
        seq,
        userLevel,
        followCnt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsersCopyWith<_$_Users> get copyWith =>
      __$$_UsersCopyWithImpl<_$_Users>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsersToJson(
      this,
    );
  }
}

abstract class _Users implements Users {
  const factory _Users(
      {final String? email,
      final String? auth,
      final int? followingCnt,
      final String? password,
      final String? createdAt,
      final String? snsId,
      final String? nickname,
      final String? updatedAt,
      final String? snsType,
      final String? photo,
      final dynamic? deletedAt,
      final String? status,
      final String? phoneNumber,
      final String? lastLogin,
      final dynamic? emailVerifiedAt,
      final String? address,
      final String? rememberToken,
      final String? memo,
      final int? seq,
      final int? userLevel,
      final int? followCnt}) = _$_Users;

  factory _Users.fromJson(Map<String, dynamic> json) = _$_Users.fromJson;

  @override
  String? get email;
  @override
  String? get auth;
  @override
  int? get followingCnt;
  @override
  String? get password;
  @override
  String? get createdAt;
  @override
  String? get snsId;
  @override
  String? get nickname;
  @override
  String? get updatedAt;
  @override
  String? get snsType;
  @override
  String? get photo;
  @override
  dynamic? get deletedAt;
  @override
  String? get status;
  @override
  String? get phoneNumber;
  @override
  String? get lastLogin;
  @override
  dynamic? get emailVerifiedAt;
  @override
  String? get address;
  @override
  String? get rememberToken;
  @override
  String? get memo;
  @override
  int? get seq;
  @override
  int? get userLevel;
  @override
  int? get followCnt;
  @override
  @JsonKey(ignore: true)
  _$$_UsersCopyWith<_$_Users> get copyWith =>
      throw _privateConstructorUsedError;
}
