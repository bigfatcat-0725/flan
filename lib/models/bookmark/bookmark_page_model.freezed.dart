// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookmarkPageModel _$BookmarkPageModelFromJson(Map<String, dynamic> json) {
  return _BookmarkPageModel.fromJson(json);
}

/// @nodoc
mixin _$BookmarkPageModel {
  @JsonKey(name: 'Bookmark')
  Bookmark? get bookmark => throw _privateConstructorUsedError;
  @JsonKey(name: 'Pages')
  Pages? get pages => throw _privateConstructorUsedError;
  @JsonKey(name: 'Users')
  Users? get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookmarkPageModelCopyWith<BookmarkPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkPageModelCopyWith<$Res> {
  factory $BookmarkPageModelCopyWith(
          BookmarkPageModel value, $Res Function(BookmarkPageModel) then) =
      _$BookmarkPageModelCopyWithImpl<$Res, BookmarkPageModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Bookmark') Bookmark? bookmark,
      @JsonKey(name: 'Pages') Pages? pages,
      @JsonKey(name: 'Users') Users? users});

  $BookmarkCopyWith<$Res>? get bookmark;
  $PagesCopyWith<$Res>? get pages;
  $UsersCopyWith<$Res>? get users;
}

/// @nodoc
class _$BookmarkPageModelCopyWithImpl<$Res, $Val extends BookmarkPageModel>
    implements $BookmarkPageModelCopyWith<$Res> {
  _$BookmarkPageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmark = freezed,
    Object? pages = freezed,
    Object? users = freezed,
  }) {
    return _then(_value.copyWith(
      bookmark: freezed == bookmark
          ? _value.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as Bookmark?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as Pages?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Users?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookmarkCopyWith<$Res>? get bookmark {
    if (_value.bookmark == null) {
      return null;
    }

    return $BookmarkCopyWith<$Res>(_value.bookmark!, (value) {
      return _then(_value.copyWith(bookmark: value) as $Val);
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
}

/// @nodoc
abstract class _$$_BookmarkPageModelCopyWith<$Res>
    implements $BookmarkPageModelCopyWith<$Res> {
  factory _$$_BookmarkPageModelCopyWith(_$_BookmarkPageModel value,
          $Res Function(_$_BookmarkPageModel) then) =
      __$$_BookmarkPageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Bookmark') Bookmark? bookmark,
      @JsonKey(name: 'Pages') Pages? pages,
      @JsonKey(name: 'Users') Users? users});

  @override
  $BookmarkCopyWith<$Res>? get bookmark;
  @override
  $PagesCopyWith<$Res>? get pages;
  @override
  $UsersCopyWith<$Res>? get users;
}

/// @nodoc
class __$$_BookmarkPageModelCopyWithImpl<$Res>
    extends _$BookmarkPageModelCopyWithImpl<$Res, _$_BookmarkPageModel>
    implements _$$_BookmarkPageModelCopyWith<$Res> {
  __$$_BookmarkPageModelCopyWithImpl(
      _$_BookmarkPageModel _value, $Res Function(_$_BookmarkPageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmark = freezed,
    Object? pages = freezed,
    Object? users = freezed,
  }) {
    return _then(_$_BookmarkPageModel(
      bookmark: freezed == bookmark
          ? _value.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as Bookmark?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as Pages?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Users?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_BookmarkPageModel implements _BookmarkPageModel {
  const _$_BookmarkPageModel(
      {@JsonKey(name: 'Bookmark') this.bookmark,
      @JsonKey(name: 'Pages') this.pages,
      @JsonKey(name: 'Users') this.users});

  factory _$_BookmarkPageModel.fromJson(Map<String, dynamic> json) =>
      _$$_BookmarkPageModelFromJson(json);

  @override
  @JsonKey(name: 'Bookmark')
  final Bookmark? bookmark;
  @override
  @JsonKey(name: 'Pages')
  final Pages? pages;
  @override
  @JsonKey(name: 'Users')
  final Users? users;

  @override
  String toString() {
    return 'BookmarkPageModel(bookmark: $bookmark, pages: $pages, users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookmarkPageModel &&
            (identical(other.bookmark, bookmark) ||
                other.bookmark == bookmark) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.users, users) || other.users == users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bookmark, pages, users);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookmarkPageModelCopyWith<_$_BookmarkPageModel> get copyWith =>
      __$$_BookmarkPageModelCopyWithImpl<_$_BookmarkPageModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookmarkPageModelToJson(
      this,
    );
  }
}

abstract class _BookmarkPageModel implements BookmarkPageModel {
  const factory _BookmarkPageModel(
      {@JsonKey(name: 'Bookmark') final Bookmark? bookmark,
      @JsonKey(name: 'Pages') final Pages? pages,
      @JsonKey(name: 'Users') final Users? users}) = _$_BookmarkPageModel;

  factory _BookmarkPageModel.fromJson(Map<String, dynamic> json) =
      _$_BookmarkPageModel.fromJson;

  @override
  @JsonKey(name: 'Bookmark')
  Bookmark? get bookmark;
  @override
  @JsonKey(name: 'Pages')
  Pages? get pages;
  @override
  @JsonKey(name: 'Users')
  Users? get users;
  @override
  @JsonKey(ignore: true)
  _$$_BookmarkPageModelCopyWith<_$_BookmarkPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Bookmark _$BookmarkFromJson(Map<String, dynamic> json) {
  return _Bookmark.fromJson(json);
}

/// @nodoc
mixin _$Bookmark {
  int? get seq => throw _privateConstructorUsedError;
  int? get questionSeq => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  int? get userSeq => throw _privateConstructorUsedError;
  int? get pageSeq => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookmarkCopyWith<Bookmark> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkCopyWith<$Res> {
  factory $BookmarkCopyWith(Bookmark value, $Res Function(Bookmark) then) =
      _$BookmarkCopyWithImpl<$Res, Bookmark>;
  @useResult
  $Res call(
      {int? seq,
      int? questionSeq,
      String? createdAt,
      int? userSeq,
      int? pageSeq});
}

/// @nodoc
class _$BookmarkCopyWithImpl<$Res, $Val extends Bookmark>
    implements $BookmarkCopyWith<$Res> {
  _$BookmarkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seq = freezed,
    Object? questionSeq = freezed,
    Object? createdAt = freezed,
    Object? userSeq = freezed,
    Object? pageSeq = freezed,
  }) {
    return _then(_value.copyWith(
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      questionSeq: freezed == questionSeq
          ? _value.questionSeq
          : questionSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      userSeq: freezed == userSeq
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSeq: freezed == pageSeq
          ? _value.pageSeq
          : pageSeq // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookmarkCopyWith<$Res> implements $BookmarkCopyWith<$Res> {
  factory _$$_BookmarkCopyWith(
          _$_Bookmark value, $Res Function(_$_Bookmark) then) =
      __$$_BookmarkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? seq,
      int? questionSeq,
      String? createdAt,
      int? userSeq,
      int? pageSeq});
}

/// @nodoc
class __$$_BookmarkCopyWithImpl<$Res>
    extends _$BookmarkCopyWithImpl<$Res, _$_Bookmark>
    implements _$$_BookmarkCopyWith<$Res> {
  __$$_BookmarkCopyWithImpl(
      _$_Bookmark _value, $Res Function(_$_Bookmark) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seq = freezed,
    Object? questionSeq = freezed,
    Object? createdAt = freezed,
    Object? userSeq = freezed,
    Object? pageSeq = freezed,
  }) {
    return _then(_$_Bookmark(
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      questionSeq: freezed == questionSeq
          ? _value.questionSeq
          : questionSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      userSeq: freezed == userSeq
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSeq: freezed == pageSeq
          ? _value.pageSeq
          : pageSeq // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Bookmark implements _Bookmark {
  const _$_Bookmark(
      {this.seq, this.questionSeq, this.createdAt, this.userSeq, this.pageSeq});

  factory _$_Bookmark.fromJson(Map<String, dynamic> json) =>
      _$$_BookmarkFromJson(json);

  @override
  final int? seq;
  @override
  final int? questionSeq;
  @override
  final String? createdAt;
  @override
  final int? userSeq;
  @override
  final int? pageSeq;

  @override
  String toString() {
    return 'Bookmark(seq: $seq, questionSeq: $questionSeq, createdAt: $createdAt, userSeq: $userSeq, pageSeq: $pageSeq)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bookmark &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.questionSeq, questionSeq) ||
                other.questionSeq == questionSeq) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userSeq, userSeq) || other.userSeq == userSeq) &&
            (identical(other.pageSeq, pageSeq) || other.pageSeq == pageSeq));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, seq, questionSeq, createdAt, userSeq, pageSeq);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookmarkCopyWith<_$_Bookmark> get copyWith =>
      __$$_BookmarkCopyWithImpl<_$_Bookmark>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookmarkToJson(
      this,
    );
  }
}

abstract class _Bookmark implements Bookmark {
  const factory _Bookmark(
      {final int? seq,
      final int? questionSeq,
      final String? createdAt,
      final int? userSeq,
      final int? pageSeq}) = _$_Bookmark;

  factory _Bookmark.fromJson(Map<String, dynamic> json) = _$_Bookmark.fromJson;

  @override
  int? get seq;
  @override
  int? get questionSeq;
  @override
  String? get createdAt;
  @override
  int? get userSeq;
  @override
  int? get pageSeq;
  @override
  @JsonKey(ignore: true)
  _$$_BookmarkCopyWith<_$_Bookmark> get copyWith =>
      throw _privateConstructorUsedError;
}

Pages _$PagesFromJson(Map<String, dynamic> json) {
  return _Pages.fromJson(json);
}

/// @nodoc
mixin _$Pages {
  int? get private => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  int? get userSeq => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  int? get viewCnt => throw _privateConstructorUsedError;
  int? get seq => throw _privateConstructorUsedError;
  int? get commentCnt => throw _privateConstructorUsedError;
  dynamic? get updatedAt => throw _privateConstructorUsedError;
  int? get themeSeq => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  int? get likes => throw _privateConstructorUsedError;
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
      {int? private,
      String? status,
      String? createdAt,
      int? userSeq,
      String? title,
      String? photo,
      String? tag,
      int? viewCnt,
      int? seq,
      int? commentCnt,
      dynamic? updatedAt,
      int? themeSeq,
      String? content,
      int? likes,
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
    Object? private = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? userSeq = freezed,
    Object? title = freezed,
    Object? photo = freezed,
    Object? tag = freezed,
    Object? viewCnt = freezed,
    Object? seq = freezed,
    Object? commentCnt = freezed,
    Object? updatedAt = freezed,
    Object? themeSeq = freezed,
    Object? content = freezed,
    Object? likes = freezed,
    Object? remaining = freezed,
  }) {
    return _then(_value.copyWith(
      private: freezed == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
      viewCnt: freezed == viewCnt
          ? _value.viewCnt
          : viewCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      commentCnt: freezed == commentCnt
          ? _value.commentCnt
          : commentCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
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
      {int? private,
      String? status,
      String? createdAt,
      int? userSeq,
      String? title,
      String? photo,
      String? tag,
      int? viewCnt,
      int? seq,
      int? commentCnt,
      dynamic? updatedAt,
      int? themeSeq,
      String? content,
      int? likes,
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
    Object? private = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? userSeq = freezed,
    Object? title = freezed,
    Object? photo = freezed,
    Object? tag = freezed,
    Object? viewCnt = freezed,
    Object? seq = freezed,
    Object? commentCnt = freezed,
    Object? updatedAt = freezed,
    Object? themeSeq = freezed,
    Object? content = freezed,
    Object? likes = freezed,
    Object? remaining = freezed,
  }) {
    return _then(_$_Pages(
      private: freezed == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
      viewCnt: freezed == viewCnt
          ? _value.viewCnt
          : viewCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      commentCnt: freezed == commentCnt
          ? _value.commentCnt
          : commentCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
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
      {this.private,
      this.status,
      this.createdAt,
      this.userSeq,
      this.title,
      this.photo,
      this.tag,
      this.viewCnt,
      this.seq,
      this.commentCnt,
      this.updatedAt,
      this.themeSeq,
      this.content,
      this.likes,
      this.remaining});

  factory _$_Pages.fromJson(Map<String, dynamic> json) =>
      _$$_PagesFromJson(json);

  @override
  final int? private;
  @override
  final String? status;
  @override
  final String? createdAt;
  @override
  final int? userSeq;
  @override
  final String? title;
  @override
  final String? photo;
  @override
  final String? tag;
  @override
  final int? viewCnt;
  @override
  final int? seq;
  @override
  final int? commentCnt;
  @override
  final dynamic? updatedAt;
  @override
  final int? themeSeq;
  @override
  final String? content;
  @override
  final int? likes;
  @override
  final String? remaining;

  @override
  String toString() {
    return 'Pages(private: $private, status: $status, createdAt: $createdAt, userSeq: $userSeq, title: $title, photo: $photo, tag: $tag, viewCnt: $viewCnt, seq: $seq, commentCnt: $commentCnt, updatedAt: $updatedAt, themeSeq: $themeSeq, content: $content, likes: $likes, remaining: $remaining)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pages &&
            (identical(other.private, private) || other.private == private) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userSeq, userSeq) || other.userSeq == userSeq) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.viewCnt, viewCnt) || other.viewCnt == viewCnt) &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.commentCnt, commentCnt) ||
                other.commentCnt == commentCnt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            (identical(other.themeSeq, themeSeq) ||
                other.themeSeq == themeSeq) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      private,
      status,
      createdAt,
      userSeq,
      title,
      photo,
      tag,
      viewCnt,
      seq,
      commentCnt,
      const DeepCollectionEquality().hash(updatedAt),
      themeSeq,
      content,
      likes,
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
      {final int? private,
      final String? status,
      final String? createdAt,
      final int? userSeq,
      final String? title,
      final String? photo,
      final String? tag,
      final int? viewCnt,
      final int? seq,
      final int? commentCnt,
      final dynamic? updatedAt,
      final int? themeSeq,
      final String? content,
      final int? likes,
      final String? remaining}) = _$_Pages;

  factory _Pages.fromJson(Map<String, dynamic> json) = _$_Pages.fromJson;

  @override
  int? get private;
  @override
  String? get status;
  @override
  String? get createdAt;
  @override
  int? get userSeq;
  @override
  String? get title;
  @override
  String? get photo;
  @override
  String? get tag;
  @override
  int? get viewCnt;
  @override
  int? get seq;
  @override
  int? get commentCnt;
  @override
  dynamic? get updatedAt;
  @override
  int? get themeSeq;
  @override
  String? get content;
  @override
  int? get likes;
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
  int? get seq => throw _privateConstructorUsedError;
  int? get proposal => throw _privateConstructorUsedError;
  String? get rememberToken => throw _privateConstructorUsedError;
  int? get followCnt => throw _privateConstructorUsedError;
  int? get userLevel => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get noticeAlram => throw _privateConstructorUsedError;
  int? get followingCnt => throw _privateConstructorUsedError;
  String? get auth => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  int? get questionAlram => throw _privateConstructorUsedError;
  String? get snsId => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  int? get answerAlram => throw _privateConstructorUsedError;
  String? get snsType => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  int? get commentAlram => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  dynamic? get deletedAt => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  int? get pCommentAlram => throw _privateConstructorUsedError;
  int? get nameSearch => throw _privateConstructorUsedError;
  String? get lastLogin => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  dynamic? get emailVerifiedAt => throw _privateConstructorUsedError;
  int? get unknownQ => throw _privateConstructorUsedError;
  String? get memo => throw _privateConstructorUsedError;

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
      {int? seq,
      int? proposal,
      String? rememberToken,
      int? followCnt,
      int? userLevel,
      String? email,
      int? noticeAlram,
      int? followingCnt,
      String? auth,
      String? password,
      int? questionAlram,
      String? snsId,
      String? createdAt,
      String? nickname,
      int? answerAlram,
      String? snsType,
      String? updatedAt,
      String? photo,
      int? commentAlram,
      String? status,
      dynamic? deletedAt,
      String? phoneNumber,
      int? pCommentAlram,
      int? nameSearch,
      String? lastLogin,
      String? address,
      dynamic? emailVerifiedAt,
      int? unknownQ,
      String? memo});
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
    Object? seq = freezed,
    Object? proposal = freezed,
    Object? rememberToken = freezed,
    Object? followCnt = freezed,
    Object? userLevel = freezed,
    Object? email = freezed,
    Object? noticeAlram = freezed,
    Object? followingCnt = freezed,
    Object? auth = freezed,
    Object? password = freezed,
    Object? questionAlram = freezed,
    Object? snsId = freezed,
    Object? createdAt = freezed,
    Object? nickname = freezed,
    Object? answerAlram = freezed,
    Object? snsType = freezed,
    Object? updatedAt = freezed,
    Object? photo = freezed,
    Object? commentAlram = freezed,
    Object? status = freezed,
    Object? deletedAt = freezed,
    Object? phoneNumber = freezed,
    Object? pCommentAlram = freezed,
    Object? nameSearch = freezed,
    Object? lastLogin = freezed,
    Object? address = freezed,
    Object? emailVerifiedAt = freezed,
    Object? unknownQ = freezed,
    Object? memo = freezed,
  }) {
    return _then(_value.copyWith(
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      proposal: freezed == proposal
          ? _value.proposal
          : proposal // ignore: cast_nullable_to_non_nullable
              as int?,
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
      followCnt: freezed == followCnt
          ? _value.followCnt
          : followCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      userLevel: freezed == userLevel
          ? _value.userLevel
          : userLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      noticeAlram: freezed == noticeAlram
          ? _value.noticeAlram
          : noticeAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      followingCnt: freezed == followingCnt
          ? _value.followingCnt
          : followingCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      auth: freezed == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      questionAlram: freezed == questionAlram
          ? _value.questionAlram
          : questionAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      snsId: freezed == snsId
          ? _value.snsId
          : snsId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      answerAlram: freezed == answerAlram
          ? _value.answerAlram
          : answerAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      snsType: freezed == snsType
          ? _value.snsType
          : snsType // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      commentAlram: freezed == commentAlram
          ? _value.commentAlram
          : commentAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pCommentAlram: freezed == pCommentAlram
          ? _value.pCommentAlram
          : pCommentAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      nameSearch: freezed == nameSearch
          ? _value.nameSearch
          : nameSearch // ignore: cast_nullable_to_non_nullable
              as int?,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      unknownQ: freezed == unknownQ
          ? _value.unknownQ
          : unknownQ // ignore: cast_nullable_to_non_nullable
              as int?,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {int? seq,
      int? proposal,
      String? rememberToken,
      int? followCnt,
      int? userLevel,
      String? email,
      int? noticeAlram,
      int? followingCnt,
      String? auth,
      String? password,
      int? questionAlram,
      String? snsId,
      String? createdAt,
      String? nickname,
      int? answerAlram,
      String? snsType,
      String? updatedAt,
      String? photo,
      int? commentAlram,
      String? status,
      dynamic? deletedAt,
      String? phoneNumber,
      int? pCommentAlram,
      int? nameSearch,
      String? lastLogin,
      String? address,
      dynamic? emailVerifiedAt,
      int? unknownQ,
      String? memo});
}

/// @nodoc
class __$$_UsersCopyWithImpl<$Res> extends _$UsersCopyWithImpl<$Res, _$_Users>
    implements _$$_UsersCopyWith<$Res> {
  __$$_UsersCopyWithImpl(_$_Users _value, $Res Function(_$_Users) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seq = freezed,
    Object? proposal = freezed,
    Object? rememberToken = freezed,
    Object? followCnt = freezed,
    Object? userLevel = freezed,
    Object? email = freezed,
    Object? noticeAlram = freezed,
    Object? followingCnt = freezed,
    Object? auth = freezed,
    Object? password = freezed,
    Object? questionAlram = freezed,
    Object? snsId = freezed,
    Object? createdAt = freezed,
    Object? nickname = freezed,
    Object? answerAlram = freezed,
    Object? snsType = freezed,
    Object? updatedAt = freezed,
    Object? photo = freezed,
    Object? commentAlram = freezed,
    Object? status = freezed,
    Object? deletedAt = freezed,
    Object? phoneNumber = freezed,
    Object? pCommentAlram = freezed,
    Object? nameSearch = freezed,
    Object? lastLogin = freezed,
    Object? address = freezed,
    Object? emailVerifiedAt = freezed,
    Object? unknownQ = freezed,
    Object? memo = freezed,
  }) {
    return _then(_$_Users(
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      proposal: freezed == proposal
          ? _value.proposal
          : proposal // ignore: cast_nullable_to_non_nullable
              as int?,
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
      followCnt: freezed == followCnt
          ? _value.followCnt
          : followCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      userLevel: freezed == userLevel
          ? _value.userLevel
          : userLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      noticeAlram: freezed == noticeAlram
          ? _value.noticeAlram
          : noticeAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      followingCnt: freezed == followingCnt
          ? _value.followingCnt
          : followingCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      auth: freezed == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      questionAlram: freezed == questionAlram
          ? _value.questionAlram
          : questionAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      snsId: freezed == snsId
          ? _value.snsId
          : snsId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      answerAlram: freezed == answerAlram
          ? _value.answerAlram
          : answerAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      snsType: freezed == snsType
          ? _value.snsType
          : snsType // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      commentAlram: freezed == commentAlram
          ? _value.commentAlram
          : commentAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pCommentAlram: freezed == pCommentAlram
          ? _value.pCommentAlram
          : pCommentAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      nameSearch: freezed == nameSearch
          ? _value.nameSearch
          : nameSearch // ignore: cast_nullable_to_non_nullable
              as int?,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      unknownQ: freezed == unknownQ
          ? _value.unknownQ
          : unknownQ // ignore: cast_nullable_to_non_nullable
              as int?,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Users implements _Users {
  const _$_Users(
      {this.seq,
      this.proposal,
      this.rememberToken,
      this.followCnt,
      this.userLevel,
      this.email,
      this.noticeAlram,
      this.followingCnt,
      this.auth,
      this.password,
      this.questionAlram,
      this.snsId,
      this.createdAt,
      this.nickname,
      this.answerAlram,
      this.snsType,
      this.updatedAt,
      this.photo,
      this.commentAlram,
      this.status,
      this.deletedAt,
      this.phoneNumber,
      this.pCommentAlram,
      this.nameSearch,
      this.lastLogin,
      this.address,
      this.emailVerifiedAt,
      this.unknownQ,
      this.memo});

  factory _$_Users.fromJson(Map<String, dynamic> json) =>
      _$$_UsersFromJson(json);

  @override
  final int? seq;
  @override
  final int? proposal;
  @override
  final String? rememberToken;
  @override
  final int? followCnt;
  @override
  final int? userLevel;
  @override
  final String? email;
  @override
  final int? noticeAlram;
  @override
  final int? followingCnt;
  @override
  final String? auth;
  @override
  final String? password;
  @override
  final int? questionAlram;
  @override
  final String? snsId;
  @override
  final String? createdAt;
  @override
  final String? nickname;
  @override
  final int? answerAlram;
  @override
  final String? snsType;
  @override
  final String? updatedAt;
  @override
  final String? photo;
  @override
  final int? commentAlram;
  @override
  final String? status;
  @override
  final dynamic? deletedAt;
  @override
  final String? phoneNumber;
  @override
  final int? pCommentAlram;
  @override
  final int? nameSearch;
  @override
  final String? lastLogin;
  @override
  final String? address;
  @override
  final dynamic? emailVerifiedAt;
  @override
  final int? unknownQ;
  @override
  final String? memo;

  @override
  String toString() {
    return 'Users(seq: $seq, proposal: $proposal, rememberToken: $rememberToken, followCnt: $followCnt, userLevel: $userLevel, email: $email, noticeAlram: $noticeAlram, followingCnt: $followingCnt, auth: $auth, password: $password, questionAlram: $questionAlram, snsId: $snsId, createdAt: $createdAt, nickname: $nickname, answerAlram: $answerAlram, snsType: $snsType, updatedAt: $updatedAt, photo: $photo, commentAlram: $commentAlram, status: $status, deletedAt: $deletedAt, phoneNumber: $phoneNumber, pCommentAlram: $pCommentAlram, nameSearch: $nameSearch, lastLogin: $lastLogin, address: $address, emailVerifiedAt: $emailVerifiedAt, unknownQ: $unknownQ, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Users &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.proposal, proposal) ||
                other.proposal == proposal) &&
            (identical(other.rememberToken, rememberToken) ||
                other.rememberToken == rememberToken) &&
            (identical(other.followCnt, followCnt) ||
                other.followCnt == followCnt) &&
            (identical(other.userLevel, userLevel) ||
                other.userLevel == userLevel) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.noticeAlram, noticeAlram) ||
                other.noticeAlram == noticeAlram) &&
            (identical(other.followingCnt, followingCnt) ||
                other.followingCnt == followingCnt) &&
            (identical(other.auth, auth) || other.auth == auth) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.questionAlram, questionAlram) ||
                other.questionAlram == questionAlram) &&
            (identical(other.snsId, snsId) || other.snsId == snsId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.answerAlram, answerAlram) ||
                other.answerAlram == answerAlram) &&
            (identical(other.snsType, snsType) || other.snsType == snsType) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.commentAlram, commentAlram) ||
                other.commentAlram == commentAlram) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.pCommentAlram, pCommentAlram) ||
                other.pCommentAlram == pCommentAlram) &&
            (identical(other.nameSearch, nameSearch) ||
                other.nameSearch == nameSearch) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other.emailVerifiedAt, emailVerifiedAt) &&
            (identical(other.unknownQ, unknownQ) ||
                other.unknownQ == unknownQ) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        seq,
        proposal,
        rememberToken,
        followCnt,
        userLevel,
        email,
        noticeAlram,
        followingCnt,
        auth,
        password,
        questionAlram,
        snsId,
        createdAt,
        nickname,
        answerAlram,
        snsType,
        updatedAt,
        photo,
        commentAlram,
        status,
        const DeepCollectionEquality().hash(deletedAt),
        phoneNumber,
        pCommentAlram,
        nameSearch,
        lastLogin,
        address,
        const DeepCollectionEquality().hash(emailVerifiedAt),
        unknownQ,
        memo
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
      {final int? seq,
      final int? proposal,
      final String? rememberToken,
      final int? followCnt,
      final int? userLevel,
      final String? email,
      final int? noticeAlram,
      final int? followingCnt,
      final String? auth,
      final String? password,
      final int? questionAlram,
      final String? snsId,
      final String? createdAt,
      final String? nickname,
      final int? answerAlram,
      final String? snsType,
      final String? updatedAt,
      final String? photo,
      final int? commentAlram,
      final String? status,
      final dynamic? deletedAt,
      final String? phoneNumber,
      final int? pCommentAlram,
      final int? nameSearch,
      final String? lastLogin,
      final String? address,
      final dynamic? emailVerifiedAt,
      final int? unknownQ,
      final String? memo}) = _$_Users;

  factory _Users.fromJson(Map<String, dynamic> json) = _$_Users.fromJson;

  @override
  int? get seq;
  @override
  int? get proposal;
  @override
  String? get rememberToken;
  @override
  int? get followCnt;
  @override
  int? get userLevel;
  @override
  String? get email;
  @override
  int? get noticeAlram;
  @override
  int? get followingCnt;
  @override
  String? get auth;
  @override
  String? get password;
  @override
  int? get questionAlram;
  @override
  String? get snsId;
  @override
  String? get createdAt;
  @override
  String? get nickname;
  @override
  int? get answerAlram;
  @override
  String? get snsType;
  @override
  String? get updatedAt;
  @override
  String? get photo;
  @override
  int? get commentAlram;
  @override
  String? get status;
  @override
  dynamic? get deletedAt;
  @override
  String? get phoneNumber;
  @override
  int? get pCommentAlram;
  @override
  int? get nameSearch;
  @override
  String? get lastLogin;
  @override
  String? get address;
  @override
  dynamic? get emailVerifiedAt;
  @override
  int? get unknownQ;
  @override
  String? get memo;
  @override
  @JsonKey(ignore: true)
  _$$_UsersCopyWith<_$_Users> get copyWith =>
      throw _privateConstructorUsedError;
}
