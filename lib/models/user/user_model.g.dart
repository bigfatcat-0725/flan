// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      accessToken: json['access_token'] as String?,
      tokenType: json['token_type'] as String?,
      userInfo: json['user_info'] == null
          ? null
          : UserInfo.fromJson(json['user_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'user_info': instance.userInfo,
    };

_$_UserInfo _$$_UserInfoFromJson(Map<String, dynamic> json) => _$_UserInfo(
      email: json['email'] as String?,
      nickname: json['nickname'] as String?,
      phoneNumber: json['phone_number'] as String?,
      memo: json['memo'] as String?,
      snsId: json['sns_id'] as String?,
      status: json['status'] as String?,
      rememberToken: json['remember_token'] as String?,
      seq: json['seq'] as int?,
      auth: json['auth'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      deletedAt: json['deleted_at'],
      password: json['password'] as String?,
      photo: json['photo'] as String?,
      address: json['address'],
      followCnt: json['follow_cnt'] as int?,
      snsType: json['sns_type'] as String?,
      emailVerifiedAt: json['email_verified_at'],
      userLevel: json['user_level'] as int?,
      updatedAt: json['updated_at'],
      lastLogin: json['last_login'] == null
          ? null
          : DateTime.parse(json['last_login'] as String),
    );

Map<String, dynamic> _$$_UserInfoToJson(_$_UserInfo instance) =>
    <String, dynamic>{
      'email': instance.email,
      'nickname': instance.nickname,
      'phone_number': instance.phoneNumber,
      'memo': instance.memo,
      'sns_id': instance.snsId,
      'status': instance.status,
      'remember_token': instance.rememberToken,
      'seq': instance.seq,
      'auth': instance.auth,
      'created_at': instance.createdAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'password': instance.password,
      'photo': instance.photo,
      'address': instance.address,
      'follow_cnt': instance.followCnt,
      'sns_type': instance.snsType,
      'email_verified_at': instance.emailVerifiedAt,
      'user_level': instance.userLevel,
      'updated_at': instance.updatedAt,
      'last_login': instance.lastLogin?.toIso8601String(),
    };
