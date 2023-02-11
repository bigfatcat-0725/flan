// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookmarkPageModel _$$_BookmarkPageModelFromJson(Map<String, dynamic> json) =>
    _$_BookmarkPageModel(
      bookmark: json['Bookmark'] == null
          ? null
          : Bookmark.fromJson(json['Bookmark'] as Map<String, dynamic>),
      pages: json['Pages'] == null
          ? null
          : Pages.fromJson(json['Pages'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BookmarkPageModelToJson(
        _$_BookmarkPageModel instance) =>
    <String, dynamic>{
      'Bookmark': instance.bookmark,
      'Pages': instance.pages,
    };

_$_Bookmark _$$_BookmarkFromJson(Map<String, dynamic> json) => _$_Bookmark(
      userSeq: json['user_seq'] as int?,
      pageSeq: json['page_seq'] as int?,
      seq: json['seq'] as int?,
      questionSeq: json['question_seq'] as int?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$_BookmarkToJson(_$_Bookmark instance) =>
    <String, dynamic>{
      'user_seq': instance.userSeq,
      'page_seq': instance.pageSeq,
      'seq': instance.seq,
      'question_seq': instance.questionSeq,
      'created_at': instance.createdAt,
    };

_$_Pages _$$_PagesFromJson(Map<String, dynamic> json) => _$_Pages(
      createdAt: json['created_at'] as String?,
      userSeq: json['user_seq'] as int?,
      title: json['title'] as String?,
      photo: json['photo'] as String?,
      tag: json['tag'] as String?,
      viewCnt: json['view_cnt'] as int?,
      seq: json['seq'] as int?,
      commentCnt: json['comment_cnt'] as int?,
      updatedAt: json['updated_at'],
      themeSeq: json['theme_seq'] as int?,
      content: json['content'] as String?,
      likes: json['likes'] as int?,
      private: json['private'] as int?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_PagesToJson(_$_Pages instance) => <String, dynamic>{
      'created_at': instance.createdAt,
      'user_seq': instance.userSeq,
      'title': instance.title,
      'photo': instance.photo,
      'tag': instance.tag,
      'view_cnt': instance.viewCnt,
      'seq': instance.seq,
      'comment_cnt': instance.commentCnt,
      'updated_at': instance.updatedAt,
      'theme_seq': instance.themeSeq,
      'content': instance.content,
      'likes': instance.likes,
      'private': instance.private,
      'status': instance.status,
    };
