// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

List<CommentModel> commentModelFromJson(String str) => List<CommentModel>.from(
    json.decode(str).map((x) => CommentModel.fromJson(x)));

String commentModelToJson(List<CommentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class CommentModel with _$CommentModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CommentModel({
    @JsonKey(name: 'Users') Users? users,
    @JsonKey(name: 'Comment') Comment? comment,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}

@freezed
class Comment with _$Comment {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Comment({
    String? reply,
    int? likes,
    dynamic? updatedAt,
    int? pSeq,
    int? pageSeq,
    String? photo,
    String? createdAt,
    int? seq,
    int? userSeq,
    String? remaining,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

@freezed
class Users with _$Users {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Users({
    String? email,
    String? auth,
    int? followingCnt,
    String? password,
    String? createdAt,
    String? snsId,
    String? nickname,
    String? updatedAt,
    String? snsType,
    String? photo,
    dynamic? deletedAt,
    String? status,
    String? phoneNumber,
    String? lastLogin,
    dynamic? emailVerifiedAt,
    String? address,
    String? rememberToken,
    String? memo,
    int? seq,
    int? userLevel,
    int? followCnt,
  }) = _Users;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}
