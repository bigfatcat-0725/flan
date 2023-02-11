// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookmarkQuestionModel _$BookmarkQuestionModelFromJson(
    Map<String, dynamic> json) {
  return _BookmarkQuestionModel.fromJson(json);
}

/// @nodoc
mixin _$BookmarkQuestionModel {
  @JsonKey(name: 'Bookmark')
  Bookmark? get bookmark => throw _privateConstructorUsedError;
  @JsonKey(name: 'Questions')
  Questions? get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookmarkQuestionModelCopyWith<BookmarkQuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkQuestionModelCopyWith<$Res> {
  factory $BookmarkQuestionModelCopyWith(BookmarkQuestionModel value,
          $Res Function(BookmarkQuestionModel) then) =
      _$BookmarkQuestionModelCopyWithImpl<$Res, BookmarkQuestionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Bookmark') Bookmark? bookmark,
      @JsonKey(name: 'Questions') Questions? questions});

  $BookmarkCopyWith<$Res>? get bookmark;
  $QuestionsCopyWith<$Res>? get questions;
}

/// @nodoc
class _$BookmarkQuestionModelCopyWithImpl<$Res,
        $Val extends BookmarkQuestionModel>
    implements $BookmarkQuestionModelCopyWith<$Res> {
  _$BookmarkQuestionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmark = freezed,
    Object? questions = freezed,
  }) {
    return _then(_value.copyWith(
      bookmark: freezed == bookmark
          ? _value.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as Bookmark?,
      questions: freezed == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as Questions?,
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
  $QuestionsCopyWith<$Res>? get questions {
    if (_value.questions == null) {
      return null;
    }

    return $QuestionsCopyWith<$Res>(_value.questions!, (value) {
      return _then(_value.copyWith(questions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BookmarkQuestionModelCopyWith<$Res>
    implements $BookmarkQuestionModelCopyWith<$Res> {
  factory _$$_BookmarkQuestionModelCopyWith(_$_BookmarkQuestionModel value,
          $Res Function(_$_BookmarkQuestionModel) then) =
      __$$_BookmarkQuestionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Bookmark') Bookmark? bookmark,
      @JsonKey(name: 'Questions') Questions? questions});

  @override
  $BookmarkCopyWith<$Res>? get bookmark;
  @override
  $QuestionsCopyWith<$Res>? get questions;
}

/// @nodoc
class __$$_BookmarkQuestionModelCopyWithImpl<$Res>
    extends _$BookmarkQuestionModelCopyWithImpl<$Res, _$_BookmarkQuestionModel>
    implements _$$_BookmarkQuestionModelCopyWith<$Res> {
  __$$_BookmarkQuestionModelCopyWithImpl(_$_BookmarkQuestionModel _value,
      $Res Function(_$_BookmarkQuestionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmark = freezed,
    Object? questions = freezed,
  }) {
    return _then(_$_BookmarkQuestionModel(
      bookmark: freezed == bookmark
          ? _value.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as Bookmark?,
      questions: freezed == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as Questions?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_BookmarkQuestionModel implements _BookmarkQuestionModel {
  const _$_BookmarkQuestionModel(
      {@JsonKey(name: 'Bookmark') this.bookmark,
      @JsonKey(name: 'Questions') this.questions});

  factory _$_BookmarkQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$$_BookmarkQuestionModelFromJson(json);

  @override
  @JsonKey(name: 'Bookmark')
  final Bookmark? bookmark;
  @override
  @JsonKey(name: 'Questions')
  final Questions? questions;

  @override
  String toString() {
    return 'BookmarkQuestionModel(bookmark: $bookmark, questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookmarkQuestionModel &&
            (identical(other.bookmark, bookmark) ||
                other.bookmark == bookmark) &&
            (identical(other.questions, questions) ||
                other.questions == questions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bookmark, questions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookmarkQuestionModelCopyWith<_$_BookmarkQuestionModel> get copyWith =>
      __$$_BookmarkQuestionModelCopyWithImpl<_$_BookmarkQuestionModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookmarkQuestionModelToJson(
      this,
    );
  }
}

abstract class _BookmarkQuestionModel implements BookmarkQuestionModel {
  const factory _BookmarkQuestionModel(
          {@JsonKey(name: 'Bookmark') final Bookmark? bookmark,
          @JsonKey(name: 'Questions') final Questions? questions}) =
      _$_BookmarkQuestionModel;

  factory _BookmarkQuestionModel.fromJson(Map<String, dynamic> json) =
      _$_BookmarkQuestionModel.fromJson;

  @override
  @JsonKey(name: 'Bookmark')
  Bookmark? get bookmark;
  @override
  @JsonKey(name: 'Questions')
  Questions? get questions;
  @override
  @JsonKey(ignore: true)
  _$$_BookmarkQuestionModelCopyWith<_$_BookmarkQuestionModel> get copyWith =>
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

Questions _$QuestionsFromJson(Map<String, dynamic> json) {
  return _Questions.fromJson(json);
}

/// @nodoc
mixin _$Questions {
  dynamic? get updatedAt => throw _privateConstructorUsedError;
  int? get userSeq => throw _privateConstructorUsedError;
  String? get question => throw _privateConstructorUsedError;
  int? get likes => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  int? get seq => throw _privateConstructorUsedError;
  int? get toSeq => throw _privateConstructorUsedError;
  dynamic? get photo => throw _privateConstructorUsedError;
  String? get private => throw _privateConstructorUsedError;
  dynamic? get unknownName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionsCopyWith<Questions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionsCopyWith<$Res> {
  factory $QuestionsCopyWith(Questions value, $Res Function(Questions) then) =
      _$QuestionsCopyWithImpl<$Res, Questions>;
  @useResult
  $Res call(
      {dynamic? updatedAt,
      int? userSeq,
      String? question,
      int? likes,
      String? status,
      String? createdAt,
      int? seq,
      int? toSeq,
      dynamic? photo,
      String? private,
      dynamic? unknownName});
}

/// @nodoc
class _$QuestionsCopyWithImpl<$Res, $Val extends Questions>
    implements $QuestionsCopyWith<$Res> {
  _$QuestionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedAt = freezed,
    Object? userSeq = freezed,
    Object? question = freezed,
    Object? likes = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? seq = freezed,
    Object? toSeq = freezed,
    Object? photo = freezed,
    Object? private = freezed,
    Object? unknownName = freezed,
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
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      toSeq: freezed == toSeq
          ? _value.toSeq
          : toSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      private: freezed == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as String?,
      unknownName: freezed == unknownName
          ? _value.unknownName
          : unknownName // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionsCopyWith<$Res> implements $QuestionsCopyWith<$Res> {
  factory _$$_QuestionsCopyWith(
          _$_Questions value, $Res Function(_$_Questions) then) =
      __$$_QuestionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic? updatedAt,
      int? userSeq,
      String? question,
      int? likes,
      String? status,
      String? createdAt,
      int? seq,
      int? toSeq,
      dynamic? photo,
      String? private,
      dynamic? unknownName});
}

/// @nodoc
class __$$_QuestionsCopyWithImpl<$Res>
    extends _$QuestionsCopyWithImpl<$Res, _$_Questions>
    implements _$$_QuestionsCopyWith<$Res> {
  __$$_QuestionsCopyWithImpl(
      _$_Questions _value, $Res Function(_$_Questions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedAt = freezed,
    Object? userSeq = freezed,
    Object? question = freezed,
    Object? likes = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? seq = freezed,
    Object? toSeq = freezed,
    Object? photo = freezed,
    Object? private = freezed,
    Object? unknownName = freezed,
  }) {
    return _then(_$_Questions(
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      userSeq: freezed == userSeq
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      toSeq: freezed == toSeq
          ? _value.toSeq
          : toSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      private: freezed == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as String?,
      unknownName: freezed == unknownName
          ? _value.unknownName
          : unknownName // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Questions implements _Questions {
  const _$_Questions(
      {this.updatedAt,
      this.userSeq,
      this.question,
      this.likes,
      this.status,
      this.createdAt,
      this.seq,
      this.toSeq,
      this.photo,
      this.private,
      this.unknownName});

  factory _$_Questions.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionsFromJson(json);

  @override
  final dynamic? updatedAt;
  @override
  final int? userSeq;
  @override
  final String? question;
  @override
  final int? likes;
  @override
  final String? status;
  @override
  final String? createdAt;
  @override
  final int? seq;
  @override
  final int? toSeq;
  @override
  final dynamic? photo;
  @override
  final String? private;
  @override
  final dynamic? unknownName;

  @override
  String toString() {
    return 'Questions(updatedAt: $updatedAt, userSeq: $userSeq, question: $question, likes: $likes, status: $status, createdAt: $createdAt, seq: $seq, toSeq: $toSeq, photo: $photo, private: $private, unknownName: $unknownName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Questions &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            (identical(other.userSeq, userSeq) || other.userSeq == userSeq) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.toSeq, toSeq) || other.toSeq == toSeq) &&
            const DeepCollectionEquality().equals(other.photo, photo) &&
            (identical(other.private, private) || other.private == private) &&
            const DeepCollectionEquality()
                .equals(other.unknownName, unknownName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(updatedAt),
      userSeq,
      question,
      likes,
      status,
      createdAt,
      seq,
      toSeq,
      const DeepCollectionEquality().hash(photo),
      private,
      const DeepCollectionEquality().hash(unknownName));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionsCopyWith<_$_Questions> get copyWith =>
      __$$_QuestionsCopyWithImpl<_$_Questions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionsToJson(
      this,
    );
  }
}

abstract class _Questions implements Questions {
  const factory _Questions(
      {final dynamic? updatedAt,
      final int? userSeq,
      final String? question,
      final int? likes,
      final String? status,
      final String? createdAt,
      final int? seq,
      final int? toSeq,
      final dynamic? photo,
      final String? private,
      final dynamic? unknownName}) = _$_Questions;

  factory _Questions.fromJson(Map<String, dynamic> json) =
      _$_Questions.fromJson;

  @override
  dynamic? get updatedAt;
  @override
  int? get userSeq;
  @override
  String? get question;
  @override
  int? get likes;
  @override
  String? get status;
  @override
  String? get createdAt;
  @override
  int? get seq;
  @override
  int? get toSeq;
  @override
  dynamic? get photo;
  @override
  String? get private;
  @override
  dynamic? get unknownName;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionsCopyWith<_$_Questions> get copyWith =>
      throw _privateConstructorUsedError;
}
