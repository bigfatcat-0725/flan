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
  @JsonKey(name: 'Users')
  Users? get users => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'Users') Users? users,
      @JsonKey(name: 'Questions') Questions? questions});

  $BookmarkCopyWith<$Res>? get bookmark;
  $UsersCopyWith<$Res>? get users;
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
    Object? users = freezed,
    Object? questions = freezed,
  }) {
    return _then(_value.copyWith(
      bookmark: freezed == bookmark
          ? _value.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as Bookmark?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Users?,
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
      @JsonKey(name: 'Users') Users? users,
      @JsonKey(name: 'Questions') Questions? questions});

  @override
  $BookmarkCopyWith<$Res>? get bookmark;
  @override
  $UsersCopyWith<$Res>? get users;
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
    Object? users = freezed,
    Object? questions = freezed,
  }) {
    return _then(_$_BookmarkQuestionModel(
      bookmark: freezed == bookmark
          ? _value.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as Bookmark?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Users?,
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
      @JsonKey(name: 'Users') this.users,
      @JsonKey(name: 'Questions') this.questions});

  factory _$_BookmarkQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$$_BookmarkQuestionModelFromJson(json);

  @override
  @JsonKey(name: 'Bookmark')
  final Bookmark? bookmark;
  @override
  @JsonKey(name: 'Users')
  final Users? users;
  @override
  @JsonKey(name: 'Questions')
  final Questions? questions;

  @override
  String toString() {
    return 'BookmarkQuestionModel(bookmark: $bookmark, users: $users, questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookmarkQuestionModel &&
            (identical(other.bookmark, bookmark) ||
                other.bookmark == bookmark) &&
            (identical(other.users, users) || other.users == users) &&
            (identical(other.questions, questions) ||
                other.questions == questions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bookmark, users, questions);

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
          @JsonKey(name: 'Users') final Users? users,
          @JsonKey(name: 'Questions') final Questions? questions}) =
      _$_BookmarkQuestionModel;

  factory _BookmarkQuestionModel.fromJson(Map<String, dynamic> json) =
      _$_BookmarkQuestionModel.fromJson;

  @override
  @JsonKey(name: 'Bookmark')
  Bookmark? get bookmark;
  @override
  @JsonKey(name: 'Users')
  Users? get users;
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
  int? get pageSeq => throw _privateConstructorUsedError;
  int? get seq => throw _privateConstructorUsedError;
  int? get questionSeq => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  int? get userSeq => throw _privateConstructorUsedError;

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
      {int? pageSeq,
      int? seq,
      int? questionSeq,
      String? createdAt,
      int? userSeq});
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
    Object? pageSeq = freezed,
    Object? seq = freezed,
    Object? questionSeq = freezed,
    Object? createdAt = freezed,
    Object? userSeq = freezed,
  }) {
    return _then(_value.copyWith(
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
      userSeq: freezed == userSeq
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
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
      {int? pageSeq,
      int? seq,
      int? questionSeq,
      String? createdAt,
      int? userSeq});
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
    Object? pageSeq = freezed,
    Object? seq = freezed,
    Object? questionSeq = freezed,
    Object? createdAt = freezed,
    Object? userSeq = freezed,
  }) {
    return _then(_$_Bookmark(
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
      userSeq: freezed == userSeq
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Bookmark implements _Bookmark {
  const _$_Bookmark(
      {this.pageSeq, this.seq, this.questionSeq, this.createdAt, this.userSeq});

  factory _$_Bookmark.fromJson(Map<String, dynamic> json) =>
      _$$_BookmarkFromJson(json);

  @override
  final int? pageSeq;
  @override
  final int? seq;
  @override
  final int? questionSeq;
  @override
  final String? createdAt;
  @override
  final int? userSeq;

  @override
  String toString() {
    return 'Bookmark(pageSeq: $pageSeq, seq: $seq, questionSeq: $questionSeq, createdAt: $createdAt, userSeq: $userSeq)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bookmark &&
            (identical(other.pageSeq, pageSeq) || other.pageSeq == pageSeq) &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.questionSeq, questionSeq) ||
                other.questionSeq == questionSeq) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userSeq, userSeq) || other.userSeq == userSeq));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pageSeq, seq, questionSeq, createdAt, userSeq);

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
      {final int? pageSeq,
      final int? seq,
      final int? questionSeq,
      final String? createdAt,
      final int? userSeq}) = _$_Bookmark;

  factory _Bookmark.fromJson(Map<String, dynamic> json) = _$_Bookmark.fromJson;

  @override
  int? get pageSeq;
  @override
  int? get seq;
  @override
  int? get questionSeq;
  @override
  String? get createdAt;
  @override
  int? get userSeq;
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
  dynamic? get updatedAt => throw _privateConstructorUsedError;
  String? get remaining => throw _privateConstructorUsedError;
  List<Answer>? get answer => throw _privateConstructorUsedError;

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
      {int? userSeq,
      String? question,
      int? likes,
      String? status,
      String? createdAt,
      int? seq,
      int? toSeq,
      dynamic? photo,
      String? private,
      dynamic? unknownName,
      dynamic? updatedAt,
      String? remaining,
      List<Answer>? answer});
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
    Object? updatedAt = freezed,
    Object? remaining = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
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
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      remaining: freezed == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as List<Answer>?,
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
      {int? userSeq,
      String? question,
      int? likes,
      String? status,
      String? createdAt,
      int? seq,
      int? toSeq,
      dynamic? photo,
      String? private,
      dynamic? unknownName,
      dynamic? updatedAt,
      String? remaining,
      List<Answer>? answer});
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
    Object? updatedAt = freezed,
    Object? remaining = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$_Questions(
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
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      remaining: freezed == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _value._answer
          : answer // ignore: cast_nullable_to_non_nullable
              as List<Answer>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Questions implements _Questions {
  const _$_Questions(
      {this.userSeq,
      this.question,
      this.likes,
      this.status,
      this.createdAt,
      this.seq,
      this.toSeq,
      this.photo,
      this.private,
      this.unknownName,
      this.updatedAt,
      this.remaining,
      final List<Answer>? answer})
      : _answer = answer;

  factory _$_Questions.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionsFromJson(json);

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
  final dynamic? updatedAt;
  @override
  final String? remaining;
  final List<Answer>? _answer;
  @override
  List<Answer>? get answer {
    final value = _answer;
    if (value == null) return null;
    if (_answer is EqualUnmodifiableListView) return _answer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Questions(userSeq: $userSeq, question: $question, likes: $likes, status: $status, createdAt: $createdAt, seq: $seq, toSeq: $toSeq, photo: $photo, private: $private, unknownName: $unknownName, updatedAt: $updatedAt, remaining: $remaining, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Questions &&
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
                .equals(other.unknownName, unknownName) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            const DeepCollectionEquality().equals(other._answer, _answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userSeq,
      question,
      likes,
      status,
      createdAt,
      seq,
      toSeq,
      const DeepCollectionEquality().hash(photo),
      private,
      const DeepCollectionEquality().hash(unknownName),
      const DeepCollectionEquality().hash(updatedAt),
      remaining,
      const DeepCollectionEquality().hash(_answer));

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
      {final int? userSeq,
      final String? question,
      final int? likes,
      final String? status,
      final String? createdAt,
      final int? seq,
      final int? toSeq,
      final dynamic? photo,
      final String? private,
      final dynamic? unknownName,
      final dynamic? updatedAt,
      final String? remaining,
      final List<Answer>? answer}) = _$_Questions;

  factory _Questions.fromJson(Map<String, dynamic> json) =
      _$_Questions.fromJson;

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
  dynamic? get updatedAt;
  @override
  String? get remaining;
  @override
  List<Answer>? get answer;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionsCopyWith<_$_Questions> get copyWith =>
      throw _privateConstructorUsedError;
}

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  @JsonKey(name: 'Users')
  Users? get users => throw _privateConstructorUsedError;
  @JsonKey(name: 'Answers')
  Answers? get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res, Answer>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Users') Users? users,
      @JsonKey(name: 'Answers') Answers? answers});

  $UsersCopyWith<$Res>? get users;
  $AnswersCopyWith<$Res>? get answers;
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res, $Val extends Answer>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
    Object? answers = freezed,
  }) {
    return _then(_value.copyWith(
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Users?,
      answers: freezed == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Answers?,
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
  $AnswersCopyWith<$Res>? get answers {
    if (_value.answers == null) {
      return null;
    }

    return $AnswersCopyWith<$Res>(_value.answers!, (value) {
      return _then(_value.copyWith(answers: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AnswerCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$_AnswerCopyWith(_$_Answer value, $Res Function(_$_Answer) then) =
      __$$_AnswerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Users') Users? users,
      @JsonKey(name: 'Answers') Answers? answers});

  @override
  $UsersCopyWith<$Res>? get users;
  @override
  $AnswersCopyWith<$Res>? get answers;
}

/// @nodoc
class __$$_AnswerCopyWithImpl<$Res>
    extends _$AnswerCopyWithImpl<$Res, _$_Answer>
    implements _$$_AnswerCopyWith<$Res> {
  __$$_AnswerCopyWithImpl(_$_Answer _value, $Res Function(_$_Answer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
    Object? answers = freezed,
  }) {
    return _then(_$_Answer(
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Users?,
      answers: freezed == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Answers?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Answer implements _Answer {
  const _$_Answer(
      {@JsonKey(name: 'Users') this.users,
      @JsonKey(name: 'Answers') this.answers});

  factory _$_Answer.fromJson(Map<String, dynamic> json) =>
      _$$_AnswerFromJson(json);

  @override
  @JsonKey(name: 'Users')
  final Users? users;
  @override
  @JsonKey(name: 'Answers')
  final Answers? answers;

  @override
  String toString() {
    return 'Answer(users: $users, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Answer &&
            (identical(other.users, users) || other.users == users) &&
            (identical(other.answers, answers) || other.answers == answers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, users, answers);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      __$$_AnswerCopyWithImpl<_$_Answer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswerToJson(
      this,
    );
  }
}

abstract class _Answer implements Answer {
  const factory _Answer(
      {@JsonKey(name: 'Users') final Users? users,
      @JsonKey(name: 'Answers') final Answers? answers}) = _$_Answer;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$_Answer.fromJson;

  @override
  @JsonKey(name: 'Users')
  Users? get users;
  @override
  @JsonKey(name: 'Answers')
  Answers? get answers;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      throw _privateConstructorUsedError;
}

Answers _$AnswersFromJson(Map<String, dynamic> json) {
  return _Answers.fromJson(json);
}

/// @nodoc
mixin _$Answers {
  int? get seq => throw _privateConstructorUsedError;
  int? get userSeq => throw _privateConstructorUsedError;
  String? get reply => throw _privateConstructorUsedError;
  int? get likes => throw _privateConstructorUsedError;
  dynamic? get updatedAt => throw _privateConstructorUsedError;
  int? get pSeq => throw _privateConstructorUsedError;
  int? get questionSeq => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get remaining => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswersCopyWith<Answers> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswersCopyWith<$Res> {
  factory $AnswersCopyWith(Answers value, $Res Function(Answers) then) =
      _$AnswersCopyWithImpl<$Res, Answers>;
  @useResult
  $Res call(
      {int? seq,
      int? userSeq,
      String? reply,
      int? likes,
      dynamic? updatedAt,
      int? pSeq,
      int? questionSeq,
      String? photo,
      String? createdAt,
      String? remaining});
}

/// @nodoc
class _$AnswersCopyWithImpl<$Res, $Val extends Answers>
    implements $AnswersCopyWith<$Res> {
  _$AnswersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seq = freezed,
    Object? userSeq = freezed,
    Object? reply = freezed,
    Object? likes = freezed,
    Object? updatedAt = freezed,
    Object? pSeq = freezed,
    Object? questionSeq = freezed,
    Object? photo = freezed,
    Object? createdAt = freezed,
    Object? remaining = freezed,
  }) {
    return _then(_value.copyWith(
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      userSeq: freezed == userSeq
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
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
      questionSeq: freezed == questionSeq
          ? _value.questionSeq
          : questionSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      remaining: freezed == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnswersCopyWith<$Res> implements $AnswersCopyWith<$Res> {
  factory _$$_AnswersCopyWith(
          _$_Answers value, $Res Function(_$_Answers) then) =
      __$$_AnswersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? seq,
      int? userSeq,
      String? reply,
      int? likes,
      dynamic? updatedAt,
      int? pSeq,
      int? questionSeq,
      String? photo,
      String? createdAt,
      String? remaining});
}

/// @nodoc
class __$$_AnswersCopyWithImpl<$Res>
    extends _$AnswersCopyWithImpl<$Res, _$_Answers>
    implements _$$_AnswersCopyWith<$Res> {
  __$$_AnswersCopyWithImpl(_$_Answers _value, $Res Function(_$_Answers) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seq = freezed,
    Object? userSeq = freezed,
    Object? reply = freezed,
    Object? likes = freezed,
    Object? updatedAt = freezed,
    Object? pSeq = freezed,
    Object? questionSeq = freezed,
    Object? photo = freezed,
    Object? createdAt = freezed,
    Object? remaining = freezed,
  }) {
    return _then(_$_Answers(
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int?,
      userSeq: freezed == userSeq
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
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
      questionSeq: freezed == questionSeq
          ? _value.questionSeq
          : questionSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      remaining: freezed == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Answers implements _Answers {
  const _$_Answers(
      {this.seq,
      this.userSeq,
      this.reply,
      this.likes,
      this.updatedAt,
      this.pSeq,
      this.questionSeq,
      this.photo,
      this.createdAt,
      this.remaining});

  factory _$_Answers.fromJson(Map<String, dynamic> json) =>
      _$$_AnswersFromJson(json);

  @override
  final int? seq;
  @override
  final int? userSeq;
  @override
  final String? reply;
  @override
  final int? likes;
  @override
  final dynamic? updatedAt;
  @override
  final int? pSeq;
  @override
  final int? questionSeq;
  @override
  final String? photo;
  @override
  final String? createdAt;
  @override
  final String? remaining;

  @override
  String toString() {
    return 'Answers(seq: $seq, userSeq: $userSeq, reply: $reply, likes: $likes, updatedAt: $updatedAt, pSeq: $pSeq, questionSeq: $questionSeq, photo: $photo, createdAt: $createdAt, remaining: $remaining)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Answers &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.userSeq, userSeq) || other.userSeq == userSeq) &&
            (identical(other.reply, reply) || other.reply == reply) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            (identical(other.pSeq, pSeq) || other.pSeq == pSeq) &&
            (identical(other.questionSeq, questionSeq) ||
                other.questionSeq == questionSeq) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      seq,
      userSeq,
      reply,
      likes,
      const DeepCollectionEquality().hash(updatedAt),
      pSeq,
      questionSeq,
      photo,
      createdAt,
      remaining);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswersCopyWith<_$_Answers> get copyWith =>
      __$$_AnswersCopyWithImpl<_$_Answers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswersToJson(
      this,
    );
  }
}

abstract class _Answers implements Answers {
  const factory _Answers(
      {final int? seq,
      final int? userSeq,
      final String? reply,
      final int? likes,
      final dynamic? updatedAt,
      final int? pSeq,
      final int? questionSeq,
      final String? photo,
      final String? createdAt,
      final String? remaining}) = _$_Answers;

  factory _Answers.fromJson(Map<String, dynamic> json) = _$_Answers.fromJson;

  @override
  int? get seq;
  @override
  int? get userSeq;
  @override
  String? get reply;
  @override
  int? get likes;
  @override
  dynamic? get updatedAt;
  @override
  int? get pSeq;
  @override
  int? get questionSeq;
  @override
  String? get photo;
  @override
  String? get createdAt;
  @override
  String? get remaining;
  @override
  @JsonKey(ignore: true)
  _$$_AnswersCopyWith<_$_Answers> get copyWith =>
      throw _privateConstructorUsedError;
}

Users _$UsersFromJson(Map<String, dynamic> json) {
  return _Users.fromJson(json);
}

/// @nodoc
mixin _$Users {
  int? get seq => throw _privateConstructorUsedError;
  int? get proposal => throw _privateConstructorUsedError;
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
  int? get pCommentAlram => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  int? get nameSearch => throw _privateConstructorUsedError;
  String? get lastLogin => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  dynamic? get emailVerifiedAt => throw _privateConstructorUsedError;
  int? get unknownQ => throw _privateConstructorUsedError;
  String? get rememberToken => throw _privateConstructorUsedError;
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
      int? pCommentAlram,
      String? phoneNumber,
      int? nameSearch,
      String? lastLogin,
      String? address,
      dynamic? emailVerifiedAt,
      int? unknownQ,
      String? rememberToken,
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
    Object? pCommentAlram = freezed,
    Object? phoneNumber = freezed,
    Object? nameSearch = freezed,
    Object? lastLogin = freezed,
    Object? address = freezed,
    Object? emailVerifiedAt = freezed,
    Object? unknownQ = freezed,
    Object? rememberToken = freezed,
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
      pCommentAlram: freezed == pCommentAlram
          ? _value.pCommentAlram
          : pCommentAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
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
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
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
      int? pCommentAlram,
      String? phoneNumber,
      int? nameSearch,
      String? lastLogin,
      String? address,
      dynamic? emailVerifiedAt,
      int? unknownQ,
      String? rememberToken,
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
    Object? pCommentAlram = freezed,
    Object? phoneNumber = freezed,
    Object? nameSearch = freezed,
    Object? lastLogin = freezed,
    Object? address = freezed,
    Object? emailVerifiedAt = freezed,
    Object? unknownQ = freezed,
    Object? rememberToken = freezed,
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
      pCommentAlram: freezed == pCommentAlram
          ? _value.pCommentAlram
          : pCommentAlram // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
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
      rememberToken: freezed == rememberToken
          ? _value.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
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
      this.pCommentAlram,
      this.phoneNumber,
      this.nameSearch,
      this.lastLogin,
      this.address,
      this.emailVerifiedAt,
      this.unknownQ,
      this.rememberToken,
      this.memo});

  factory _$_Users.fromJson(Map<String, dynamic> json) =>
      _$$_UsersFromJson(json);

  @override
  final int? seq;
  @override
  final int? proposal;
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
  final int? pCommentAlram;
  @override
  final String? phoneNumber;
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
  final String? rememberToken;
  @override
  final String? memo;

  @override
  String toString() {
    return 'Users(seq: $seq, proposal: $proposal, followCnt: $followCnt, userLevel: $userLevel, email: $email, noticeAlram: $noticeAlram, followingCnt: $followingCnt, auth: $auth, password: $password, questionAlram: $questionAlram, snsId: $snsId, createdAt: $createdAt, nickname: $nickname, answerAlram: $answerAlram, snsType: $snsType, updatedAt: $updatedAt, photo: $photo, commentAlram: $commentAlram, status: $status, deletedAt: $deletedAt, pCommentAlram: $pCommentAlram, phoneNumber: $phoneNumber, nameSearch: $nameSearch, lastLogin: $lastLogin, address: $address, emailVerifiedAt: $emailVerifiedAt, unknownQ: $unknownQ, rememberToken: $rememberToken, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Users &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.proposal, proposal) ||
                other.proposal == proposal) &&
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
            (identical(other.pCommentAlram, pCommentAlram) ||
                other.pCommentAlram == pCommentAlram) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.nameSearch, nameSearch) ||
                other.nameSearch == nameSearch) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other.emailVerifiedAt, emailVerifiedAt) &&
            (identical(other.unknownQ, unknownQ) ||
                other.unknownQ == unknownQ) &&
            (identical(other.rememberToken, rememberToken) ||
                other.rememberToken == rememberToken) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        seq,
        proposal,
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
        pCommentAlram,
        phoneNumber,
        nameSearch,
        lastLogin,
        address,
        const DeepCollectionEquality().hash(emailVerifiedAt),
        unknownQ,
        rememberToken,
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
      final int? pCommentAlram,
      final String? phoneNumber,
      final int? nameSearch,
      final String? lastLogin,
      final String? address,
      final dynamic? emailVerifiedAt,
      final int? unknownQ,
      final String? rememberToken,
      final String? memo}) = _$_Users;

  factory _Users.fromJson(Map<String, dynamic> json) = _$_Users.fromJson;

  @override
  int? get seq;
  @override
  int? get proposal;
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
  int? get pCommentAlram;
  @override
  String? get phoneNumber;
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
  String? get rememberToken;
  @override
  String? get memo;
  @override
  @JsonKey(ignore: true)
  _$$_UsersCopyWith<_$_Users> get copyWith =>
      throw _privateConstructorUsedError;
}
