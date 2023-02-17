// To parse this JSON data, do
//
//     final homeFeedModel = homeFeedModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'home_feed_model.freezed.dart';
part 'home_feed_model.g.dart';

List<HomeFeedModel> homeFeedModelFromJson(String str) =>
    List<HomeFeedModel>.from(
        json.decode(str).map((x) => HomeFeedModel.fromJson(x)));

String homeFeedModelToJson(List<HomeFeedModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class HomeFeedModel with _$HomeFeedModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HomeFeedModel({
    @JsonKey(name: 'Users') Users? users,
    @JsonKey(name: 'Questions') Questions? questions,
  }) = _HomeFeedModel;

  factory HomeFeedModel.fromJson(Map<String, dynamic> json) =>
      _$HomeFeedModelFromJson(json);
}

@freezed
class Questions with _$Questions {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Questions({
    int? seq,
    int? toSeq,
    dynamic? photo,
    String? private,
    dynamic? unknownName,
    dynamic? updatedAt,
    int? userSeq,
    String? question,
    int? likes,
    String? status,
    String? createdAt,
    String? remaining,
    List<dynamic>? topAnswer,
    List<Answer>? answer,
  }) = _Questions;

  factory Questions.fromJson(Map<String, dynamic> json) =>
      _$QuestionsFromJson(json);
}

@freezed
class Answer with _$Answer {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Answer({
    @JsonKey(name: 'Users') Users? users,
    @JsonKey(name: 'Answers') Answers? answers,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}

@freezed
class Answers with _$Answers {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Answers({
    int? pSeq,
    int? questionSeq,
    String? photo,
    String? createdAt,
    int? seq,
    int? userSeq,
    String? reply,
    int? likes,
    dynamic? updatedAt,
    String? remaining,
    List<dynamic>? comment,
  }) = _Answers;

  factory Answers.fromJson(Map<String, dynamic> json) =>
      _$AnswersFromJson(json);
}

@freezed
class Users with _$Users {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Users({
    String? email,
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
    String? address,
    int? pCommentAlram,
    int? nameSearch,
    dynamic? deletedAt,
    String? rememberToken,
    String? memo,
    dynamic? emailVerifiedAt,
    int? seq,
    int? unknownQ,
    String? lastLogin,
    int? followCnt,
  }) = _Users;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}
