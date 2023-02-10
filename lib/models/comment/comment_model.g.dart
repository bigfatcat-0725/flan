// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentModel _$$_CommentModelFromJson(Map<String, dynamic> json) =>
    _$_CommentModel(
      users: json['users'] == null
          ? null
          : Users.fromJson(json['users'] as Map<String, dynamic>),
      comment: json['comment'] == null
          ? null
          : Comment.fromJson(json['comment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CommentModelToJson(_$_CommentModel instance) =>
    <String, dynamic>{
      'users': instance.users,
      'comment': instance.comment,
    };

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      reply: json['reply'] as String?,
      likes: json['likes'] as int?,
      updatedAt: json['updatedAt'],
      pSeq: json['pSeq'] as int?,
      pageSeq: json['pageSeq'] as int?,
      photo: json['photo'] as String?,
      createdAt: json['createdAt'] as String?,
      seq: json['seq'] as int?,
      userSeq: json['userSeq'] as int?,
      remaining: json['remaining'] as String?,
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'reply': instance.reply,
      'likes': instance.likes,
      'updatedAt': instance.updatedAt,
      'pSeq': instance.pSeq,
      'pageSeq': instance.pageSeq,
      'photo': instance.photo,
      'createdAt': instance.createdAt,
      'seq': instance.seq,
      'userSeq': instance.userSeq,
      'remaining': instance.remaining,
    };

_$_Users _$$_UsersFromJson(Map<String, dynamic> json) => _$_Users(
      email: json['email'] as String?,
      auth: json['auth'] as String?,
      followingCnt: json['followingCnt'] as int?,
      password: json['password'] as String?,
      createdAt: json['createdAt'] as String?,
      snsId: json['snsId'] as String?,
      nickname: json['nickname'] as String?,
      updatedAt: json['updatedAt'] as String?,
      snsType: json['snsType'] as String?,
      photo: json['photo'] as String?,
      deletedAt: json['deletedAt'],
      status: json['status'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      lastLogin: json['lastLogin'] as String?,
      emailVerifiedAt: json['emailVerifiedAt'],
      address: json['address'] as String?,
      rememberToken: json['rememberToken'] as String?,
      memo: json['memo'] as String?,
      seq: json['seq'] as int?,
      userLevel: json['userLevel'] as int?,
      followCnt: json['followCnt'] as int?,
    );

Map<String, dynamic> _$$_UsersToJson(_$_Users instance) => <String, dynamic>{
      'email': instance.email,
      'auth': instance.auth,
      'followingCnt': instance.followingCnt,
      'password': instance.password,
      'createdAt': instance.createdAt,
      'snsId': instance.snsId,
      'nickname': instance.nickname,
      'updatedAt': instance.updatedAt,
      'snsType': instance.snsType,
      'photo': instance.photo,
      'deletedAt': instance.deletedAt,
      'status': instance.status,
      'phoneNumber': instance.phoneNumber,
      'lastLogin': instance.lastLogin,
      'emailVerifiedAt': instance.emailVerifiedAt,
      'address': instance.address,
      'rememberToken': instance.rememberToken,
      'memo': instance.memo,
      'seq': instance.seq,
      'userLevel': instance.userLevel,
      'followCnt': instance.followCnt,
    };
