// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PageModel _$$_PageModelFromJson(Map<String, dynamic> json) => _$_PageModel(
      users: json['Users'] == null
          ? null
          : Users.fromJson(json['Users'] as Map<String, dynamic>),
      pages: json['Pages'] == null
          ? null
          : Pages.fromJson(json['Pages'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PageModelToJson(_$_PageModel instance) =>
    <String, dynamic>{
      'Users': instance.users,
      'Pages': instance.pages,
    };

_$_Pages _$$_PagesFromJson(Map<String, dynamic> json) => _$_Pages(
      updatedAt: json['updated_at'],
      userSeq: json['user_seq'] as int?,
      title: json['title'] as String?,
      photo: json['photo'] as String?,
      tag: json['tag'] as String?,
      private: json['private'] as int?,
      status: json['status'] as String?,
      seq: json['seq'] as int?,
      createdAt: json['created_at'] as String?,
      themeSeq: json['theme_seq'] as int?,
      content: json['content'] as String?,
      likes: json['likes'] as int?,
      viewCnt: json['view_cnt'] as int?,
      commentCnt: json['comment_cnt'] as int?,
      remaining: json['remaining'] as String?,
    );

Map<String, dynamic> _$$_PagesToJson(_$_Pages instance) => <String, dynamic>{
      'updated_at': instance.updatedAt,
      'user_seq': instance.userSeq,
      'title': instance.title,
      'photo': instance.photo,
      'tag': instance.tag,
      'private': instance.private,
      'status': instance.status,
      'seq': instance.seq,
      'created_at': instance.createdAt,
      'theme_seq': instance.themeSeq,
      'content': instance.content,
      'likes': instance.likes,
      'view_cnt': instance.viewCnt,
      'comment_cnt': instance.commentCnt,
      'remaining': instance.remaining,
    };

_$_Users _$$_UsersFromJson(Map<String, dynamic> json) => _$_Users(
      email: json['email'] as String?,
      auth: json['auth'] as String?,
      followingCnt: json['following_cnt'] as int?,
      password: json['password'] as String?,
      createdAt: json['created_at'] as String?,
      snsId: json['sns_id'] as String?,
      nickname: json['nickname'] as String?,
      updatedAt: json['updated_at'],
      snsType: json['sns_type'] as String?,
      photo: json['photo'] as String?,
      deletedAt: json['deleted_at'],
      status: json['status'] as String?,
      phoneNumber: json['phone_number'] as String?,
      lastLogin: json['last_login'] as String?,
      emailVerifiedAt: json['email_verified_at'],
      address: json['address'],
      rememberToken: json['remember_token'] as String?,
      memo: json['memo'] as String?,
      seq: json['seq'] as int?,
      userLevel: json['user_level'] as int?,
      followCnt: json['follow_cnt'] as int?,
    );

Map<String, dynamic> _$$_UsersToJson(_$_Users instance) => <String, dynamic>{
      'email': instance.email,
      'auth': instance.auth,
      'following_cnt': instance.followingCnt,
      'password': instance.password,
      'created_at': instance.createdAt,
      'sns_id': instance.snsId,
      'nickname': instance.nickname,
      'updated_at': instance.updatedAt,
      'sns_type': instance.snsType,
      'photo': instance.photo,
      'deleted_at': instance.deletedAt,
      'status': instance.status,
      'phone_number': instance.phoneNumber,
      'last_login': instance.lastLogin,
      'email_verified_at': instance.emailVerifiedAt,
      'address': instance.address,
      'remember_token': instance.rememberToken,
      'memo': instance.memo,
      'seq': instance.seq,
      'user_level': instance.userLevel,
      'follow_cnt': instance.followCnt,
    };
