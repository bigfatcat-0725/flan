// To parse this JSON data, do
//
//     final bookmarkPageModel = bookmarkPageModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'bookmark_page_model.freezed.dart';
part 'bookmark_page_model.g.dart';

List<BookmarkPageModel> bookmarkPageModelFromJson(String str) =>
    List<BookmarkPageModel>.from(
        json.decode(str).map((x) => BookmarkPageModel.fromJson(x)));

String bookmarkPageModelToJson(List<BookmarkPageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class BookmarkPageModel with _$BookmarkPageModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BookmarkPageModel({
    @JsonKey(name: 'Bookmark') Bookmark? bookmark,
    @JsonKey(name: 'Pages') Pages? pages,
    @JsonKey(name: 'Users') Users? users,
  }) = _BookmarkPageModel;

  factory BookmarkPageModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkPageModelFromJson(json);
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
class Pages with _$Pages {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Pages({
    int? private,
    String? status,
    String? createdAt,
    int? userSeq,
    String? title,
    String? photo,
    String? tag,
    int? viewCnt,
    int? seq,
    int? commentCnt,
    dynamic? updatedAt,
    int? themeSeq,
    String? content,
    int? likes,
    String? remaining,
  }) = _Pages;

  factory Pages.fromJson(Map<String, dynamic> json) => _$PagesFromJson(json);
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
