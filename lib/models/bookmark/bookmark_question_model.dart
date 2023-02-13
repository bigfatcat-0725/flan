// To parse this JSON data, do
//
//     final bookmarkQuestionModel = bookmarkQuestionModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'bookmark_question_model.freezed.dart';
part 'bookmark_question_model.g.dart';

List<BookmarkQuestionModel> bookmarkQuestionModelFromJson(String str) =>
    List<BookmarkQuestionModel>.from(
        json.decode(str).map((x) => BookmarkQuestionModel.fromJson(x)));

String bookmarkQuestionModelToJson(List<BookmarkQuestionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class BookmarkQuestionModel with _$BookmarkQuestionModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BookmarkQuestionModel({
    @JsonKey(name: 'Bookmark') Bookmark? bookmark,
    @JsonKey(name: 'Questions') Questions? questions,
    Users? users,
  }) = _BookmarkQuestionModel;

  factory BookmarkQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkQuestionModelFromJson(json);
}

@freezed
class Bookmark with _$Bookmark {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Bookmark({
    int? seq,
    int? questionSeq,
    String? createdAt,
    int? userSeq,
    int? pageSeq,
  }) = _Bookmark;

  factory Bookmark.fromJson(Map<String, dynamic> json) =>
      _$BookmarkFromJson(json);
}

@freezed
class Questions with _$Questions {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Questions({
    int? userSeq,
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
  }) = _Questions;

  factory Questions.fromJson(Map<String, dynamic> json) =>
      _$QuestionsFromJson(json);
}

@freezed
class Users with _$Users {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Users({
    int? seq,
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
    String? memo,
  }) = _Users;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}
