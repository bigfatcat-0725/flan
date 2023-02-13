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
      users: json['Users'] == null
          ? null
          : Users.fromJson(json['Users'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BookmarkPageModelToJson(
        _$_BookmarkPageModel instance) =>
    <String, dynamic>{
      'Bookmark': instance.bookmark,
      'Pages': instance.pages,
      'Users': instance.users,
    };

_$_Bookmark _$$_BookmarkFromJson(Map<String, dynamic> json) => _$_Bookmark(
      seq: json['seq'] as int?,
      questionSeq: json['question_seq'] as int?,
      createdAt: json['created_at'] as String?,
      userSeq: json['user_seq'] as int?,
      pageSeq: json['page_seq'] as int?,
    );

Map<String, dynamic> _$$_BookmarkToJson(_$_Bookmark instance) =>
    <String, dynamic>{
      'seq': instance.seq,
      'question_seq': instance.questionSeq,
      'created_at': instance.createdAt,
      'user_seq': instance.userSeq,
      'page_seq': instance.pageSeq,
    };

_$_Pages _$$_PagesFromJson(Map<String, dynamic> json) => _$_Pages(
      private: json['private'] as int?,
      status: json['status'] as String?,
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
      remaining: json['remaining'] as String?,
    );

Map<String, dynamic> _$$_PagesToJson(_$_Pages instance) => <String, dynamic>{
      'private': instance.private,
      'status': instance.status,
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
      'remaining': instance.remaining,
    };

_$_Users _$$_UsersFromJson(Map<String, dynamic> json) => _$_Users(
      seq: json['seq'] as int?,
      proposal: json['proposal'] as int?,
      rememberToken: json['remember_token'] as String?,
      followCnt: json['follow_cnt'] as int?,
      userLevel: json['user_level'] as int?,
      email: json['email'] as String?,
      noticeAlram: json['notice_alram'] as int?,
      followingCnt: json['following_cnt'] as int?,
      auth: json['auth'] as String?,
      password: json['password'] as String?,
      questionAlram: json['question_alram'] as int?,
      snsId: json['sns_id'] as String?,
      createdAt: json['created_at'] as String?,
      nickname: json['nickname'] as String?,
      answerAlram: json['answer_alram'] as int?,
      snsType: json['sns_type'] as String?,
      updatedAt: json['updated_at'] as String?,
      photo: json['photo'] as String?,
      commentAlram: json['comment_alram'] as int?,
      status: json['status'] as String?,
      deletedAt: json['deleted_at'],
      phoneNumber: json['phone_number'] as String?,
      pCommentAlram: json['p_comment_alram'] as int?,
      nameSearch: json['name_search'] as int?,
      lastLogin: json['last_login'] as String?,
      address: json['address'] as String?,
      emailVerifiedAt: json['email_verified_at'],
      unknownQ: json['unknown_q'] as int?,
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$$_UsersToJson(_$_Users instance) => <String, dynamic>{
      'seq': instance.seq,
      'proposal': instance.proposal,
      'remember_token': instance.rememberToken,
      'follow_cnt': instance.followCnt,
      'user_level': instance.userLevel,
      'email': instance.email,
      'notice_alram': instance.noticeAlram,
      'following_cnt': instance.followingCnt,
      'auth': instance.auth,
      'password': instance.password,
      'question_alram': instance.questionAlram,
      'sns_id': instance.snsId,
      'created_at': instance.createdAt,
      'nickname': instance.nickname,
      'answer_alram': instance.answerAlram,
      'sns_type': instance.snsType,
      'updated_at': instance.updatedAt,
      'photo': instance.photo,
      'comment_alram': instance.commentAlram,
      'status': instance.status,
      'deleted_at': instance.deletedAt,
      'phone_number': instance.phoneNumber,
      'p_comment_alram': instance.pCommentAlram,
      'name_search': instance.nameSearch,
      'last_login': instance.lastLogin,
      'address': instance.address,
      'email_verified_at': instance.emailVerifiedAt,
      'unknown_q': instance.unknownQ,
      'memo': instance.memo,
    };
