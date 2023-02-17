// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserModel({
    String? accessToken,
    String? tokenType,
    UserInfo? userInfo,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class UserInfo with _$UserInfo {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserInfo({
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
    String? rememberToken,
    String? address,
    int? pCommentAlram,
    int? nameSearch,
    dynamic? deletedAt,
    String? memo,
    dynamic? emailVerifiedAt,
    int? seq,
    int? unknownQ,
    String? lastLogin,
    int? followCnt,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
