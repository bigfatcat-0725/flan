// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get accessToken => throw _privateConstructorUsedError;
  String? get tokenType => throw _privateConstructorUsedError;
  UserInfo? get userInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({String? accessToken, String? tokenType, UserInfo? userInfo});

  $UserInfoCopyWith<$Res>? get userInfo;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? tokenType = freezed,
    Object? userInfo = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res>? get userInfo {
    if (_value.userInfo == null) {
      return null;
    }

    return $UserInfoCopyWith<$Res>(_value.userInfo!, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? accessToken, String? tokenType, UserInfo? userInfo});

  @override
  $UserInfoCopyWith<$Res>? get userInfo;
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? tokenType = freezed,
    Object? userInfo = freezed,
  }) {
    return _then(_$_UserModel(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_UserModel implements _UserModel {
  const _$_UserModel({this.accessToken, this.tokenType, this.userInfo});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final String? accessToken;
  @override
  final String? tokenType;
  @override
  final UserInfo? userInfo;

  @override
  String toString() {
    return 'UserModel(accessToken: $accessToken, tokenType: $tokenType, userInfo: $userInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, tokenType, userInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final String? accessToken,
      final String? tokenType,
      final UserInfo? userInfo}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String? get accessToken;
  @override
  String? get tokenType;
  @override
  UserInfo? get userInfo;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  String? get email => throw _privateConstructorUsedError;
  int? get proposal => throw _privateConstructorUsedError;
  int? get followingCnt => throw _privateConstructorUsedError;
  int? get userLevel => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  int? get noticeAlram => throw _privateConstructorUsedError;
  String? get snsId => throw _privateConstructorUsedError;
  int? get point => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  int? get questionAlram => throw _privateConstructorUsedError;
  String? get snsType => throw _privateConstructorUsedError;
  String? get auth => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  int? get answerAlram => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  int? get commentAlram => throw _privateConstructorUsedError;
  dynamic? get statusMemo => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get rememberToken => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  int? get pCommentAlram => throw _privateConstructorUsedError;
  int? get nameSearch => throw _privateConstructorUsedError;
  dynamic? get deletedAt => throw _privateConstructorUsedError;
  String? get memo => throw _privateConstructorUsedError;
  dynamic? get emailVerifiedAt => throw _privateConstructorUsedError;
  int? get seq => throw _privateConstructorUsedError;
  int? get unknownQ => throw _privateConstructorUsedError;
  String? get lastLogin => throw _privateConstructorUsedError;
  int? get followCnt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {String? email,
      int? proposal,
      int? followingCnt,
      int? userLevel,
      String? password,
      int? noticeAlram,
      String? snsId,
      int? point,
      String? nickname,
      int? questionAlram,
      String? snsType,
      String? auth,
      String? photo,
      int? answerAlram,
      String? status,
      String? createdAt,
      String? phoneNumber,
      int? commentAlram,
      dynamic? statusMemo,
      String? updatedAt,
      String? rememberToken,
      String? address,
      int? pCommentAlram,
      int? nameSearch,
      dynamic? deletedAt,
      String? memo,
      dynamic? emailVerifiedAt,
      int? seq,
      int? unknownQ,
      String? lastLogin,
      int? followCnt});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? proposal = freezed,
    Object? followingCnt = freezed,
    Object? userLevel = freezed,
    Object? password = freezed,
    Object? noticeAlram = freezed,
    Object? snsId = freezed,
    Object? point = freezed,
    Object? nickname = freezed,
    Object? questionAlram = freezed,
    Object? snsType = freezed,
    Object? auth = freezed,
    Object? photo = freezed,
    Object? answerAlram = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? phoneNumber = freezed,
    Object? commentAlram = freezed,
    Object? statusMemo = freezed,
    Object? updatedAt = freezed,
    Object? rememberToken = freezed,
    Object? address = freezed,
    Object? pCommentAlram = freezed,
    Object? nameSearch = freezed,
    Object? deletedAt = freezed,
    Object? memo = freezed,
    Object? emailVerifiedAt = freezed,
    Object? seq = freezed,
    Object? unknownQ = freezed,
    Object? lastLogin = freezed,
    Object? followCnt = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      proposal: freezed == proposal
          ? _value.proposal
          : proposal // ignore: cast_nullable_to_non_nullable
              as int?,
      followingCnt: freezed == followingCnt
          ? _value.followingCnt
          : followingCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      userLevel: freezed == userLevel
          ? _value.userLevel
          : userLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      noticeAlram: freezed == noticeAlram
          ? _value.noticeAlram
          : noticeAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      snsId: freezed == snsId
          ? _value.snsId
          : snsId // ignore: cast_nullable_to_non_nullable
              as String?,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      questionAlram: freezed == questionAlram
          ? _value.questionAlram
          : questionAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      snsType: freezed == snsType
          ? _value.snsType
          : snsType // ignore: cast_nullable_to_non_nullable
              as String?,
      auth: freezed == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      answerAlram: freezed == answerAlram
          ? _value.answerAlram
          : answerAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      commentAlram: freezed == commentAlram
          ? _value.commentAlram
          : commentAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      statusMemo: freezed == statusMemo
          ? _value.statusMemo
          : statusMemo // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      pCommentAlram: freezed == pCommentAlram
          ? _value.pCommentAlram
          : pCommentAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      nameSearch: freezed == nameSearch
          ? _value.nameSearch
          : nameSearch // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      unknownQ: freezed == unknownQ
          ? _value.unknownQ
          : unknownQ // ignore: cast_nullable_to_non_nullable
              as int?,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      followCnt: freezed == followCnt
          ? _value.followCnt
          : followCnt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInfoCopyWith<$Res> implements $UserInfoCopyWith<$Res> {
  factory _$$_UserInfoCopyWith(
          _$_UserInfo value, $Res Function(_$_UserInfo) then) =
      __$$_UserInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      int? proposal,
      int? followingCnt,
      int? userLevel,
      String? password,
      int? noticeAlram,
      String? snsId,
      int? point,
      String? nickname,
      int? questionAlram,
      String? snsType,
      String? auth,
      String? photo,
      int? answerAlram,
      String? status,
      String? createdAt,
      String? phoneNumber,
      int? commentAlram,
      dynamic? statusMemo,
      String? updatedAt,
      String? rememberToken,
      String? address,
      int? pCommentAlram,
      int? nameSearch,
      dynamic? deletedAt,
      String? memo,
      dynamic? emailVerifiedAt,
      int? seq,
      int? unknownQ,
      String? lastLogin,
      int? followCnt});
}

/// @nodoc
class __$$_UserInfoCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$_UserInfo>
    implements _$$_UserInfoCopyWith<$Res> {
  __$$_UserInfoCopyWithImpl(
      _$_UserInfo _value, $Res Function(_$_UserInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? proposal = freezed,
    Object? followingCnt = freezed,
    Object? userLevel = freezed,
    Object? password = freezed,
    Object? noticeAlram = freezed,
    Object? snsId = freezed,
    Object? point = freezed,
    Object? nickname = freezed,
    Object? questionAlram = freezed,
    Object? snsType = freezed,
    Object? auth = freezed,
    Object? photo = freezed,
    Object? answerAlram = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? phoneNumber = freezed,
    Object? commentAlram = freezed,
    Object? statusMemo = freezed,
    Object? updatedAt = freezed,
    Object? rememberToken = freezed,
    Object? address = freezed,
    Object? pCommentAlram = freezed,
    Object? nameSearch = freezed,
    Object? deletedAt = freezed,
    Object? memo = freezed,
    Object? emailVerifiedAt = freezed,
    Object? seq = freezed,
    Object? unknownQ = freezed,
    Object? lastLogin = freezed,
    Object? followCnt = freezed,
  }) {
    return _then(_$_UserInfo(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      proposal: freezed == proposal
          ? _value.proposal
          : proposal // ignore: cast_nullable_to_non_nullable
              as int?,
      followingCnt: freezed == followingCnt
          ? _value.followingCnt
          : followingCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      userLevel: freezed == userLevel
          ? _value.userLevel
          : userLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      noticeAlram: freezed == noticeAlram
          ? _value.noticeAlram
          : noticeAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      snsId: freezed == snsId
          ? _value.snsId
          : snsId // ignore: cast_nullable_to_non_nullable
              as String?,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      questionAlram: freezed == questionAlram
          ? _value.questionAlram
          : questionAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      snsType: freezed == snsType
          ? _value.snsType
          : snsType // ignore: cast_nullable_to_non_nullable
              as String?,
      auth: freezed == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      answerAlram: freezed == answerAlram
          ? _value.answerAlram
          : answerAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      commentAlram: freezed == commentAlram
          ? _value.commentAlram
          : commentAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      statusMemo: freezed == statusMemo
          ? _value.statusMemo
          : statusMemo // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      pCommentAlram: freezed == pCommentAlram
          ? _value.pCommentAlram
          : pCommentAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      nameSearch: freezed == nameSearch
          ? _value.nameSearch
          : nameSearch // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      unknownQ: freezed == unknownQ
          ? _value.unknownQ
          : unknownQ // ignore: cast_nullable_to_non_nullable
              as int?,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      followCnt: freezed == followCnt
          ? _value.followCnt
          : followCnt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_UserInfo implements _UserInfo {
  const _$_UserInfo(
      {this.email,
      this.proposal,
      this.followingCnt,
      this.userLevel,
      this.password,
      this.noticeAlram,
      this.snsId,
      this.point,
      this.nickname,
      this.questionAlram,
      this.snsType,
      this.auth,
      this.photo,
      this.answerAlram,
      this.status,
      this.createdAt,
      this.phoneNumber,
      this.commentAlram,
      this.statusMemo,
      this.updatedAt,
      this.rememberToken,
      this.address,
      this.pCommentAlram,
      this.nameSearch,
      this.deletedAt,
      this.memo,
      this.emailVerifiedAt,
      this.seq,
      this.unknownQ,
      this.lastLogin,
      this.followCnt});

  factory _$_UserInfo.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoFromJson(json);

  @override
  final String? email;
  @override
  final int? proposal;
  @override
  final int? followingCnt;
  @override
  final int? userLevel;
  @override
  final String? password;
  @override
  final int? noticeAlram;
  @override
  final String? snsId;
  @override
  final int? point;
  @override
  final String? nickname;
  @override
  final int? questionAlram;
  @override
  final String? snsType;
  @override
  final String? auth;
  @override
  final String? photo;
  @override
  final int? answerAlram;
  @override
  final String? status;
  @override
  final String? createdAt;
  @override
  final String? phoneNumber;
  @override
  final int? commentAlram;
  @override
  final dynamic? statusMemo;
  @override
  final String? updatedAt;
  @override
  final String? rememberToken;
  @override
  final String? address;
  @override
  final int? pCommentAlram;
  @override
  final int? nameSearch;
  @override
  final dynamic? deletedAt;
  @override
  final String? memo;
  @override
  final dynamic? emailVerifiedAt;
  @override
  final int? seq;
  @override
  final int? unknownQ;
  @override
  final String? lastLogin;
  @override
  final int? followCnt;

  @override
  String toString() {
    return 'UserInfo(email: $email, proposal: $proposal, followingCnt: $followingCnt, userLevel: $userLevel, password: $password, noticeAlram: $noticeAlram, snsId: $snsId, point: $point, nickname: $nickname, questionAlram: $questionAlram, snsType: $snsType, auth: $auth, photo: $photo, answerAlram: $answerAlram, status: $status, createdAt: $createdAt, phoneNumber: $phoneNumber, commentAlram: $commentAlram, statusMemo: $statusMemo, updatedAt: $updatedAt, rememberToken: $rememberToken, address: $address, pCommentAlram: $pCommentAlram, nameSearch: $nameSearch, deletedAt: $deletedAt, memo: $memo, emailVerifiedAt: $emailVerifiedAt, seq: $seq, unknownQ: $unknownQ, lastLogin: $lastLogin, followCnt: $followCnt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfo &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.proposal, proposal) ||
                other.proposal == proposal) &&
            (identical(other.followingCnt, followingCnt) ||
                other.followingCnt == followingCnt) &&
            (identical(other.userLevel, userLevel) ||
                other.userLevel == userLevel) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.noticeAlram, noticeAlram) ||
                other.noticeAlram == noticeAlram) &&
            (identical(other.snsId, snsId) || other.snsId == snsId) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.questionAlram, questionAlram) ||
                other.questionAlram == questionAlram) &&
            (identical(other.snsType, snsType) || other.snsType == snsType) &&
            (identical(other.auth, auth) || other.auth == auth) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.answerAlram, answerAlram) ||
                other.answerAlram == answerAlram) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.commentAlram, commentAlram) ||
                other.commentAlram == commentAlram) &&
            const DeepCollectionEquality()
                .equals(other.statusMemo, statusMemo) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.rememberToken, rememberToken) ||
                other.rememberToken == rememberToken) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.pCommentAlram, pCommentAlram) ||
                other.pCommentAlram == pCommentAlram) &&
            (identical(other.nameSearch, nameSearch) ||
                other.nameSearch == nameSearch) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            const DeepCollectionEquality()
                .equals(other.emailVerifiedAt, emailVerifiedAt) &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.unknownQ, unknownQ) ||
                other.unknownQ == unknownQ) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.followCnt, followCnt) ||
                other.followCnt == followCnt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        email,
        proposal,
        followingCnt,
        userLevel,
        password,
        noticeAlram,
        snsId,
        point,
        nickname,
        questionAlram,
        snsType,
        auth,
        photo,
        answerAlram,
        status,
        createdAt,
        phoneNumber,
        commentAlram,
        const DeepCollectionEquality().hash(statusMemo),
        updatedAt,
        rememberToken,
        address,
        pCommentAlram,
        nameSearch,
        const DeepCollectionEquality().hash(deletedAt),
        memo,
        const DeepCollectionEquality().hash(emailVerifiedAt),
        seq,
        unknownQ,
        lastLogin,
        followCnt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoCopyWith<_$_UserInfo> get copyWith =>
      __$$_UserInfoCopyWithImpl<_$_UserInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {final String? email,
      final int? proposal,
      final int? followingCnt,
      final int? userLevel,
      final String? password,
      final int? noticeAlram,
      final String? snsId,
      final int? point,
      final String? nickname,
      final int? questionAlram,
      final String? snsType,
      final String? auth,
      final String? photo,
      final int? answerAlram,
      final String? status,
      final String? createdAt,
      final String? phoneNumber,
      final int? commentAlram,
      final dynamic? statusMemo,
      final String? updatedAt,
      final String? rememberToken,
      final String? address,
      final int? pCommentAlram,
      final int? nameSearch,
      final dynamic? deletedAt,
      final String? memo,
      final dynamic? emailVerifiedAt,
      final int? seq,
      final int? unknownQ,
      final String? lastLogin,
      final int? followCnt}) = _$_UserInfo;

  factory _UserInfo.fromJson(Map<String, dynamic> json) = _$_UserInfo.fromJson;

  @override
  String? get email;
  @override
  int? get proposal;
  @override
  int? get followingCnt;
  @override
  int? get userLevel;
  @override
  String? get password;
  @override
  int? get noticeAlram;
  @override
  String? get snsId;
  @override
  int? get point;
  @override
  String? get nickname;
  @override
  int? get questionAlram;
  @override
  String? get snsType;
  @override
  String? get auth;
  @override
  String? get photo;
  @override
  int? get answerAlram;
  @override
  String? get status;
  @override
  String? get createdAt;
  @override
  String? get phoneNumber;
  @override
  int? get commentAlram;
  @override
  dynamic? get statusMemo;
  @override
  String? get updatedAt;
  @override
  String? get rememberToken;
  @override
  String? get address;
  @override
  int? get pCommentAlram;
  @override
  int? get nameSearch;
  @override
  dynamic? get deletedAt;
  @override
  String? get memo;
  @override
  dynamic? get emailVerifiedAt;
  @override
  int? get seq;
  @override
  int? get unknownQ;
  @override
  String? get lastLogin;
  @override
  int? get followCnt;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoCopyWith<_$_UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
