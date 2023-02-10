// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PageModel _$PageModelFromJson(Map<String, dynamic> json) {
  return _PageModel.fromJson(json);
}

/// @nodoc
mixin _$PageModel {
  @JsonKey(name: 'Users')
  Users? get users => throw _privateConstructorUsedError;
  @JsonKey(name: 'Pages')
  Pages? get pages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageModelCopyWith<PageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageModelCopyWith<$Res> {
  factory $PageModelCopyWith(PageModel value, $Res Function(PageModel) then) =
      _$PageModelCopyWithImpl<$Res, PageModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Users') Users? users,
      @JsonKey(name: 'Pages') Pages? pages});

  $UsersCopyWith<$Res>? get users;
  $PagesCopyWith<$Res>? get pages;
}

/// @nodoc
class _$PageModelCopyWithImpl<$Res, $Val extends PageModel>
    implements $PageModelCopyWith<$Res> {
  _$PageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
    Object? pages = freezed,
  }) {
    return _then(_value.copyWith(
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Users?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as Pages?,
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
  $PagesCopyWith<$Res>? get pages {
    if (_value.pages == null) {
      return null;
    }

    return $PagesCopyWith<$Res>(_value.pages!, (value) {
      return _then(_value.copyWith(pages: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PageModelCopyWith<$Res> implements $PageModelCopyWith<$Res> {
  factory _$$_PageModelCopyWith(
          _$_PageModel value, $Res Function(_$_PageModel) then) =
      __$$_PageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Users') Users? users,
      @JsonKey(name: 'Pages') Pages? pages});

  @override
  $UsersCopyWith<$Res>? get users;
  @override
  $PagesCopyWith<$Res>? get pages;
}

/// @nodoc
class __$$_PageModelCopyWithImpl<$Res>
    extends _$PageModelCopyWithImpl<$Res, _$_PageModel>
    implements _$$_PageModelCopyWith<$Res> {
  __$$_PageModelCopyWithImpl(
      _$_PageModel _value, $Res Function(_$_PageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
    Object? pages = freezed,
  }) {
    return _then(_$_PageModel(
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Users?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as Pages?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_PageModel implements _PageModel {
  const _$_PageModel(
      {@JsonKey(name: 'Users') this.users, @JsonKey(name: 'Pages') this.pages});

  factory _$_PageModel.fromJson(Map<String, dynamic> json) =>
      _$$_PageModelFromJson(json);

  @override
  @JsonKey(name: 'Users')
  final Users? users;
  @override
  @JsonKey(name: 'Pages')
  final Pages? pages;

  @override
  String toString() {
    return 'PageModel(users: $users, pages: $pages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageModel &&
            (identical(other.users, users) || other.users == users) &&
            (identical(other.pages, pages) || other.pages == pages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, users, pages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageModelCopyWith<_$_PageModel> get copyWith =>
      __$$_PageModelCopyWithImpl<_$_PageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PageModelToJson(
      this,
    );
  }
}

abstract class _PageModel implements PageModel {
  const factory _PageModel(
      {@JsonKey(name: 'Users') final Users? users,
      @JsonKey(name: 'Pages') final Pages? pages}) = _$_PageModel;

  factory _PageModel.fromJson(Map<String, dynamic> json) =
      _$_PageModel.fromJson;

  @override
  @JsonKey(name: 'Users')
  Users? get users;
  @override
  @JsonKey(name: 'Pages')
  Pages? get pages;
  @override
  @JsonKey(ignore: true)
  _$$_PageModelCopyWith<_$_PageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Pages _$PagesFromJson(Map<String, dynamic> json) {
  return _Pages.fromJson(json);
}

/// @nodoc
mixin _$Pages {
  dynamic? get updatedAt => throw _privateConstructorUsedError;
  int? get userSeq => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  int? get private => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get seq => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  int? get themeSeq => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  int? get likes => throw _privateConstructorUsedError;
  int? get viewCnt => throw _privateConstructorUsedError;
  int? get commentCnt => throw _privateConstructorUsedError;
  String? get remaining => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PagesCopyWith<Pages> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagesCopyWith<$Res> {
  factory $PagesCopyWith(Pages value, $Res Function(Pages) then) =
      _$PagesCopyWithImpl<$Res, Pages>;
  @useResult
  $Res call(
      {dynamic? updatedAt,
      int? userSeq,
      String? title,
      String? photo,
      String? tag,
      int? private,
      String? status,
      int? seq,
      String? createdAt,
      int? themeSeq,
      String? content,
      int? likes,
      int? viewCnt,
      int? commentCnt,
      String? remaining});
}

/// @nodoc
class _$PagesCopyWithImpl<$Res, $Val extends Pages>
    implements $PagesCopyWith<$Res> {
  _$PagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedAt = freezed,
    Object? userSeq = freezed,
    Object? title = freezed,
    Object? photo = freezed,
    Object? tag = freezed,
    Object? private = freezed,
    Object? status = freezed,
    Object? seq = freezed,
    Object? createdAt = freezed,
    Object? themeSeq = freezed,
    Object? content = freezed,
    Object? likes = freezed,
    Object? viewCnt = freezed,
    Object? commentCnt = freezed,
    Object? remaining = freezed,
  }) {
    return _then(_value.copyWith(
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      userSeq: freezed == userSeq
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      private: freezed == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      themeSeq: freezed == themeSeq
          ? _value.themeSeq
          : themeSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      viewCnt: freezed == viewCnt
          ? _value.viewCnt
          : viewCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      commentCnt: freezed == commentCnt
          ? _value.commentCnt
          : commentCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      remaining: freezed == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PagesCopyWith<$Res> implements $PagesCopyWith<$Res> {
  factory _$$_PagesCopyWith(_$_Pages value, $Res Function(_$_Pages) then) =
      __$$_PagesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic? updatedAt,
      int? userSeq,
      String? title,
      String? photo,
      String? tag,
      int? private,
      String? status,
      int? seq,
      String? createdAt,
      int? themeSeq,
      String? content,
      int? likes,
      int? viewCnt,
      int? commentCnt,
      String? remaining});
}

/// @nodoc
class __$$_PagesCopyWithImpl<$Res> extends _$PagesCopyWithImpl<$Res, _$_Pages>
    implements _$$_PagesCopyWith<$Res> {
  __$$_PagesCopyWithImpl(_$_Pages _value, $Res Function(_$_Pages) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedAt = freezed,
    Object? userSeq = freezed,
    Object? title = freezed,
    Object? photo = freezed,
    Object? tag = freezed,
    Object? private = freezed,
    Object? status = freezed,
    Object? seq = freezed,
    Object? createdAt = freezed,
    Object? themeSeq = freezed,
    Object? content = freezed,
    Object? likes = freezed,
    Object? viewCnt = freezed,
    Object? commentCnt = freezed,
    Object? remaining = freezed,
  }) {
    return _then(_$_Pages(
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      userSeq: freezed == userSeq
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      private: freezed == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      themeSeq: freezed == themeSeq
          ? _value.themeSeq
          : themeSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      viewCnt: freezed == viewCnt
          ? _value.viewCnt
          : viewCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      commentCnt: freezed == commentCnt
          ? _value.commentCnt
          : commentCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      remaining: freezed == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Pages implements _Pages {
  const _$_Pages(
      {this.updatedAt,
      this.userSeq,
      this.title,
      this.photo,
      this.tag,
      this.private,
      this.status,
      this.seq,
      this.createdAt,
      this.themeSeq,
      this.content,
      this.likes,
      this.viewCnt,
      this.commentCnt,
      this.remaining});

  factory _$_Pages.fromJson(Map<String, dynamic> json) =>
      _$$_PagesFromJson(json);

  @override
  final dynamic? updatedAt;
  @override
  final int? userSeq;
  @override
  final String? title;
  @override
  final String? photo;
  @override
  final String? tag;
  @override
  final int? private;
  @override
  final String? status;
  @override
  final int? seq;
  @override
  final String? createdAt;
  @override
  final int? themeSeq;
  @override
  final String? content;
  @override
  final int? likes;
  @override
  final int? viewCnt;
  @override
  final int? commentCnt;
  @override
  final String? remaining;

  @override
  String toString() {
    return 'Pages(updatedAt: $updatedAt, userSeq: $userSeq, title: $title, photo: $photo, tag: $tag, private: $private, status: $status, seq: $seq, createdAt: $createdAt, themeSeq: $themeSeq, content: $content, likes: $likes, viewCnt: $viewCnt, commentCnt: $commentCnt, remaining: $remaining)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pages &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            (identical(other.userSeq, userSeq) || other.userSeq == userSeq) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.private, private) || other.private == private) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.themeSeq, themeSeq) ||
                other.themeSeq == themeSeq) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.viewCnt, viewCnt) || other.viewCnt == viewCnt) &&
            (identical(other.commentCnt, commentCnt) ||
                other.commentCnt == commentCnt) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(updatedAt),
      userSeq,
      title,
      photo,
      tag,
      private,
      status,
      seq,
      createdAt,
      themeSeq,
      content,
      likes,
      viewCnt,
      commentCnt,
      remaining);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PagesCopyWith<_$_Pages> get copyWith =>
      __$$_PagesCopyWithImpl<_$_Pages>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PagesToJson(
      this,
    );
  }
}

abstract class _Pages implements Pages {
  const factory _Pages(
      {final dynamic? updatedAt,
      final int? userSeq,
      final String? title,
      final String? photo,
      final String? tag,
      final int? private,
      final String? status,
      final int? seq,
      final String? createdAt,
      final int? themeSeq,
      final String? content,
      final int? likes,
      final int? viewCnt,
      final int? commentCnt,
      final String? remaining}) = _$_Pages;

  factory _Pages.fromJson(Map<String, dynamic> json) = _$_Pages.fromJson;

  @override
  dynamic? get updatedAt;
  @override
  int? get userSeq;
  @override
  String? get title;
  @override
  String? get photo;
  @override
  String? get tag;
  @override
  int? get private;
  @override
  String? get status;
  @override
  int? get seq;
  @override
  String? get createdAt;
  @override
  int? get themeSeq;
  @override
  String? get content;
  @override
  int? get likes;
  @override
  int? get viewCnt;
  @override
  int? get commentCnt;
  @override
  String? get remaining;
  @override
  @JsonKey(ignore: true)
  _$$_PagesCopyWith<_$_Pages> get copyWith =>
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
  dynamic? get updatedAt => throw _privateConstructorUsedError;
  String? get snsType => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  dynamic? get deletedAt => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get lastLogin => throw _privateConstructorUsedError;
  dynamic? get emailVerifiedAt => throw _privateConstructorUsedError;
  dynamic? get address => throw _privateConstructorUsedError;
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
      dynamic? updatedAt,
      String? snsType,
      String? photo,
      dynamic? deletedAt,
      String? status,
      String? phoneNumber,
      String? lastLogin,
      dynamic? emailVerifiedAt,
      dynamic? address,
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
              as dynamic?,
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
              as dynamic?,
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
      dynamic? updatedAt,
      String? snsType,
      String? photo,
      dynamic? deletedAt,
      String? status,
      String? phoneNumber,
      String? lastLogin,
      dynamic? emailVerifiedAt,
      dynamic? address,
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
              as dynamic?,
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
              as dynamic?,
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

@JsonSerializable(fieldRename: FieldRename.snake)
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
  final dynamic? updatedAt;
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
  final dynamic? address;
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
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
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
            const DeepCollectionEquality().equals(other.address, address) &&
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
        const DeepCollectionEquality().hash(updatedAt),
        snsType,
        photo,
        const DeepCollectionEquality().hash(deletedAt),
        status,
        phoneNumber,
        lastLogin,
        const DeepCollectionEquality().hash(emailVerifiedAt),
        const DeepCollectionEquality().hash(address),
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
      final dynamic? updatedAt,
      final String? snsType,
      final String? photo,
      final dynamic? deletedAt,
      final String? status,
      final String? phoneNumber,
      final String? lastLogin,
      final dynamic? emailVerifiedAt,
      final dynamic? address,
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
  dynamic? get updatedAt;
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
  dynamic? get address;
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
