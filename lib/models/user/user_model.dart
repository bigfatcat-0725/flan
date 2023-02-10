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
    String? nickname,
    String? phoneNumber,
    String? memo,
    String? snsId,
    String? status,
    String? rememberToken,
    int? seq,
    String? auth,
    DateTime? createdAt,
    dynamic? deletedAt,
    String? password,
    String? photo,
    dynamic? address,
    int? followCnt,
    String? snsType,
    dynamic? emailVerifiedAt,
    int? userLevel,
    dynamic? updatedAt,
    DateTime? lastLogin,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
