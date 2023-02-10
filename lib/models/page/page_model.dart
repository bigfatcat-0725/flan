// To parse this JSON data, do
//
//     final pageModel = pageModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'page_model.freezed.dart';
part 'page_model.g.dart';

List<PageModel> pageModelFromJson(String str) =>
    List<PageModel>.from(json.decode(str).map((x) => PageModel.fromJson(x)));

String pageModelToJson(List<PageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class PageModel with _$PageModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PageModel({
    @JsonKey(name: 'Users') Users? users,
    @JsonKey(name: 'Pages') Pages? pages,
  }) = _PageModel;

  factory PageModel.fromJson(Map<String, dynamic> json) =>
      _$PageModelFromJson(json);
}

@freezed
class Pages with _$Pages {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Pages({
    dynamic? updatedAt,
    int? userSeq,
    String? title,
    String? photo,
    String? tag,
    int? private,
    String? status,
    int? seq,
    String? createdAt,
    int? themeSeq,
    String? content,
    int? likes,
    int? viewCnt,
    int? commentCnt,
    String? remaining,
  }) = _Pages;

  factory Pages.fromJson(Map<String, dynamic> json) => _$PagesFromJson(json);
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
  }) = _Users;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}
