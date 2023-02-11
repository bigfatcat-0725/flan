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
  }) = _BookmarkQuestionModel;

  factory BookmarkQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkQuestionModelFromJson(json);
}

@freezed
class Bookmark with _$Bookmark {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Bookmark({
    int? userSeq,
    int? pageSeq,
    int? seq,
    int? questionSeq,
    String? createdAt,
  }) = _Bookmark;

  factory Bookmark.fromJson(Map<String, dynamic> json) =>
      _$BookmarkFromJson(json);
}

@freezed
class Questions with _$Questions {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Questions({
    dynamic? updatedAt,
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
  }) = _Questions;

  factory Questions.fromJson(Map<String, dynamic> json) =>
      _$QuestionsFromJson(json);
}
