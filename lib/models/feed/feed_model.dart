// To parse this JSON data, do
//
//     final feedModel = feedModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'feed_model.freezed.dart';
part 'feed_model.g.dart';

FeedModel feedModelFromJson(String str) => FeedModel.fromJson(json.decode(str));

String feedModelToJson(FeedModel data) => json.encode(data.toJson());

@freezed
class FeedModel with _$FeedModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FeedModel({
    MyData? myData,
    List<Question>? ingQuestion,
    List<Question>? finQuestion,
    List<Question>? canQuestion,
    List<dynamic>? follower,
    List<dynamic>? following,
  }) = _FeedModel;

  factory FeedModel.fromJson(Map<String, dynamic> json) =>
      _$FeedModelFromJson(json);
}

@freezed
class Question with _$Question {
  const factory Question({
    @JsonKey(name: 'Users') MyData? users,
    @JsonKey(name: 'Questions') Questions? questions,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
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
    @JsonKey(name: 'Users') MyData? users,
    @JsonKey(name: 'Answers') Answers? answers,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}

@freezed
class Answers with _$Answers {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Answers({
    int? userSeq,
    String? reply,
    int? likes,
    dynamic? updatedAt,
    int? pSeq,
    int? questionSeq,
    String? photo,
    String? createdAt,
    int? seq,
    String? remaining,
    List<dynamic>? comment,
  }) = _Answers;

  factory Answers.fromJson(Map<String, dynamic> json) =>
      _$AnswersFromJson(json);
}

@freezed
class MyData with _$MyData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MyData({
    String? email,
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
    int? followCnt,
    int? answerCnt,
  }) = _MyData;

  factory MyData.fromJson(Map<String, dynamic> json) => _$MyDataFromJson(json);
}
