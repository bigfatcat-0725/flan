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
      @JsonKey(name: 'Pages') Pages? pages});

  $BookmarkCopyWith<$Res>? get bookmark;
  $PagesCopyWith<$Res>? get pages;
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
      @JsonKey(name: 'Pages') Pages? pages});

  @override
  $BookmarkCopyWith<$Res>? get bookmark;
  @override
  $PagesCopyWith<$Res>? get pages;
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
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_BookmarkPageModel implements _BookmarkPageModel {
  const _$_BookmarkPageModel(
      {@JsonKey(name: 'Bookmark') this.bookmark,
      @JsonKey(name: 'Pages') this.pages});

  factory _$_BookmarkPageModel.fromJson(Map<String, dynamic> json) =>
      _$$_BookmarkPageModelFromJson(json);

  @override
  @JsonKey(name: 'Bookmark')
  final Bookmark? bookmark;
  @override
  @JsonKey(name: 'Pages')
  final Pages? pages;

  @override
  String toString() {
    return 'BookmarkPageModel(bookmark: $bookmark, pages: $pages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookmarkPageModel &&
            (identical(other.bookmark, bookmark) ||
                other.bookmark == bookmark) &&
            (identical(other.pages, pages) || other.pages == pages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bookmark, pages);

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
      @JsonKey(name: 'Pages') final Pages? pages}) = _$_BookmarkPageModel;

  factory _BookmarkPageModel.fromJson(Map<String, dynamic> json) =
      _$_BookmarkPageModel.fromJson;

  @override
  @JsonKey(name: 'Bookmark')
  Bookmark? get bookmark;
  @override
  @JsonKey(name: 'Pages')
  Pages? get pages;
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
  int? get userSeq => throw _privateConstructorUsedError;
  int? get pageSeq => throw _privateConstructorUsedError;
  int? get seq => throw _privateConstructorUsedError;
  int? get questionSeq => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

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
      {int? userSeq,
      int? pageSeq,
      int? seq,
      int? questionSeq,
      String? createdAt});
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
    Object? userSeq = freezed,
    Object? pageSeq = freezed,
    Object? seq = freezed,
    Object? questionSeq = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      userSeq: freezed == userSeq
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSeq: freezed == pageSeq
          ? _value.pageSeq
          : pageSeq // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {int? userSeq,
      int? pageSeq,
      int? seq,
      int? questionSeq,
      String? createdAt});
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
    Object? userSeq = freezed,
    Object? pageSeq = freezed,
    Object? seq = freezed,
    Object? questionSeq = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_Bookmark(
      userSeq: freezed == userSeq
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSeq: freezed == pageSeq
          ? _value.pageSeq
          : pageSeq // ignore: cast_nullable_to_non_nullable
              as int?,
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
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Bookmark implements _Bookmark {
  const _$_Bookmark(
      {this.userSeq, this.pageSeq, this.seq, this.questionSeq, this.createdAt});

  factory _$_Bookmark.fromJson(Map<String, dynamic> json) =>
      _$$_BookmarkFromJson(json);

  @override
  final int? userSeq;
  @override
  final int? pageSeq;
  @override
  final int? seq;
  @override
  final int? questionSeq;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'Bookmark(userSeq: $userSeq, pageSeq: $pageSeq, seq: $seq, questionSeq: $questionSeq, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bookmark &&
            (identical(other.userSeq, userSeq) || other.userSeq == userSeq) &&
            (identical(other.pageSeq, pageSeq) || other.pageSeq == pageSeq) &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.questionSeq, questionSeq) ||
                other.questionSeq == questionSeq) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userSeq, pageSeq, seq, questionSeq, createdAt);

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
      {final int? userSeq,
      final int? pageSeq,
      final int? seq,
      final int? questionSeq,
      final String? createdAt}) = _$_Bookmark;

  factory _Bookmark.fromJson(Map<String, dynamic> json) = _$_Bookmark.fromJson;

  @override
  int? get userSeq;
  @override
  int? get pageSeq;
  @override
  int? get seq;
  @override
  int? get questionSeq;
  @override
  String? get createdAt;
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
  int? get private => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

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
      {String? createdAt,
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
      int? private,
      String? status});
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
    Object? private = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
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
      private: freezed == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
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
      {String? createdAt,
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
      int? private,
      String? status});
}

/// @nodoc
class __$$_PagesCopyWithImpl<$Res> extends _$PagesCopyWithImpl<$Res, _$_Pages>
    implements _$$_PagesCopyWith<$Res> {
  __$$_PagesCopyWithImpl(_$_Pages _value, $Res Function(_$_Pages) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
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
    Object? private = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_Pages(
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
      private: freezed == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Pages implements _Pages {
  const _$_Pages(
      {this.createdAt,
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
      this.private,
      this.status});

  factory _$_Pages.fromJson(Map<String, dynamic> json) =>
      _$$_PagesFromJson(json);

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
  final int? private;
  @override
  final String? status;

  @override
  String toString() {
    return 'Pages(createdAt: $createdAt, userSeq: $userSeq, title: $title, photo: $photo, tag: $tag, viewCnt: $viewCnt, seq: $seq, commentCnt: $commentCnt, updatedAt: $updatedAt, themeSeq: $themeSeq, content: $content, likes: $likes, private: $private, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pages &&
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
            (identical(other.private, private) || other.private == private) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
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
      private,
      status);

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
      {final String? createdAt,
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
      final int? private,
      final String? status}) = _$_Pages;

  factory _Pages.fromJson(Map<String, dynamic> json) = _$_Pages.fromJson;

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
  int? get private;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_PagesCopyWith<_$_Pages> get copyWith =>
      throw _privateConstructorUsedError;
}
