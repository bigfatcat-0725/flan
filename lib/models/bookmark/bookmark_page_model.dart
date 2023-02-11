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
  }) = _BookmarkPageModel;

  factory BookmarkPageModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkPageModelFromJson(json);
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
class Pages with _$Pages {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Pages({
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
    int? private,
    String? status,
  }) = _Pages;

  factory Pages.fromJson(Map<String, dynamic> json) => _$PagesFromJson(json);
}
