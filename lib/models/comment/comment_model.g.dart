// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentModel _$$_CommentModelFromJson(Map<String, dynamic> json) =>
    _$_CommentModel(
      users: json['Users'] == null
          ? null
          : Users.fromJson(json['Users'] as Map<String, dynamic>),
      comment: json['Comment'] == null
          ? null
          : Comment.fromJson(json['Comment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CommentModelToJson(_$_CommentModel instance) =>
    <String, dynamic>{
      'Users': instance.users,
      'Comment': instance.comment,
    };

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      reply: json['reply'] as String?,
      likes: json['likes'] as int?,
      updatedAt: json['updated_at'],
      pSeq: json['p_seq'] as int?,
      pageSeq: json['page_seq'] as int?,
      photo: json['photo'] as String?,
      createdAt: json['created_at'] as String?,
      seq: json['seq'] as int?,
      userSeq: json['user_seq'] as int?,
      remaining: json['remaining'] as String?,
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'reply': instance.reply,
      'likes': instance.likes,
      'updated_at': instance.updatedAt,
      'p_seq': instance.pSeq,
      'page_seq': instance.pageSeq,
      'photo': instance.photo,
      'created_at': instance.createdAt,
      'seq': instance.seq,
      'user_seq': instance.userSeq,
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
      updatedAt: json['updated_at'] as String?,
      snsType: json['sns_type'] as String?,
      photo: json['photo'] as String?,
      deletedAt: json['deleted_at'],
      status: json['status'] as String?,
      phoneNumber: json['phone_number'] as String?,
      lastLogin: json['last_login'] as String?,
      emailVerifiedAt: json['email_verified_at'],
      address: json['address'] as String?,
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
