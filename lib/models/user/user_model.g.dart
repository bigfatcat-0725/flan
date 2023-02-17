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
      proposal: json['proposal'] as int?,
      followingCnt: json['following_cnt'] as int?,
      userLevel: json['user_level'] as int?,
      password: json['password'] as String?,
      noticeAlram: json['notice_alram'] as int?,
      snsId: json['sns_id'] as String?,
      point: json['point'] as int?,
      nickname: json['nickname'] as String?,
      questionAlram: json['question_alram'] as int?,
      snsType: json['sns_type'] as String?,
      auth: json['auth'] as String?,
      photo: json['photo'] as String?,
      answerAlram: json['answer_alram'] as int?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      phoneNumber: json['phone_number'] as String?,
      commentAlram: json['comment_alram'] as int?,
      statusMemo: json['status_memo'],
      updatedAt: json['updated_at'] as String?,
      rememberToken: json['remember_token'] as String?,
      address: json['address'] as String?,
      pCommentAlram: json['p_comment_alram'] as int?,
      nameSearch: json['name_search'] as int?,
      deletedAt: json['deleted_at'],
      memo: json['memo'] as String?,
      emailVerifiedAt: json['email_verified_at'],
      seq: json['seq'] as int?,
      unknownQ: json['unknown_q'] as int?,
      lastLogin: json['last_login'] as String?,
      followCnt: json['follow_cnt'] as int?,
    );

Map<String, dynamic> _$$_UserInfoToJson(_$_UserInfo instance) =>
    <String, dynamic>{
      'email': instance.email,
      'proposal': instance.proposal,
      'following_cnt': instance.followingCnt,
      'user_level': instance.userLevel,
      'password': instance.password,
      'notice_alram': instance.noticeAlram,
      'sns_id': instance.snsId,
      'point': instance.point,
      'nickname': instance.nickname,
      'question_alram': instance.questionAlram,
      'sns_type': instance.snsType,
      'auth': instance.auth,
      'photo': instance.photo,
      'answer_alram': instance.answerAlram,
      'status': instance.status,
      'created_at': instance.createdAt,
      'phone_number': instance.phoneNumber,
      'comment_alram': instance.commentAlram,
      'status_memo': instance.statusMemo,
      'updated_at': instance.updatedAt,
      'remember_token': instance.rememberToken,
      'address': instance.address,
      'p_comment_alram': instance.pCommentAlram,
      'name_search': instance.nameSearch,
      'deleted_at': instance.deletedAt,
      'memo': instance.memo,
      'email_verified_at': instance.emailVerifiedAt,
      'seq': instance.seq,
      'unknown_q': instance.unknownQ,
      'last_login': instance.lastLogin,
      'follow_cnt': instance.followCnt,
    };
