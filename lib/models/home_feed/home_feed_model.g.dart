// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeFeedModel _$$_HomeFeedModelFromJson(Map<String, dynamic> json) =>
    _$_HomeFeedModel(
      users: json['Users'] == null
          ? null
          : Users.fromJson(json['Users'] as Map<String, dynamic>),
      questions: json['Questions'] == null
          ? null
          : Questions.fromJson(json['Questions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_HomeFeedModelToJson(_$_HomeFeedModel instance) =>
    <String, dynamic>{
      'Users': instance.users,
      'Questions': instance.questions,
    };

_$_Questions _$$_QuestionsFromJson(Map<String, dynamic> json) => _$_Questions(
      seq: json['seq'] as int?,
      toSeq: json['to_seq'] as int?,
      photo: json['photo'],
      private: json['private'] as String?,
      unknownName: json['unknown_name'],
      updatedAt: json['updated_at'],
      userSeq: json['user_seq'] as int?,
      question: json['question'] as String?,
      likes: json['likes'] as int?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      remaining: json['remaining'] as String?,
      topAnswer: json['top_answer'] as List<dynamic>?,
      answer: (json['answer'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuestionsToJson(_$_Questions instance) =>
    <String, dynamic>{
      'seq': instance.seq,
      'to_seq': instance.toSeq,
      'photo': instance.photo,
      'private': instance.private,
      'unknown_name': instance.unknownName,
      'updated_at': instance.updatedAt,
      'user_seq': instance.userSeq,
      'question': instance.question,
      'likes': instance.likes,
      'status': instance.status,
      'created_at': instance.createdAt,
      'remaining': instance.remaining,
      'top_answer': instance.topAnswer,
      'answer': instance.answer,
    };

_$_Answer _$$_AnswerFromJson(Map<String, dynamic> json) => _$_Answer(
      users: json['Users'] == null
          ? null
          : Users.fromJson(json['Users'] as Map<String, dynamic>),
      answers: json['Answers'] == null
          ? null
          : Answers.fromJson(json['Answers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AnswerToJson(_$_Answer instance) => <String, dynamic>{
      'Users': instance.users,
      'Answers': instance.answers,
    };

_$_Answers _$$_AnswersFromJson(Map<String, dynamic> json) => _$_Answers(
      pSeq: json['p_seq'] as int?,
      questionSeq: json['question_seq'] as int?,
      photo: json['photo'] as String?,
      createdAt: json['created_at'] as String?,
      seq: json['seq'] as int?,
      userSeq: json['user_seq'] as int?,
      reply: json['reply'] as String?,
      likes: json['likes'] as int?,
      updatedAt: json['updated_at'],
      remaining: json['remaining'] as String?,
      comment: json['comment'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_AnswersToJson(_$_Answers instance) =>
    <String, dynamic>{
      'p_seq': instance.pSeq,
      'question_seq': instance.questionSeq,
      'photo': instance.photo,
      'created_at': instance.createdAt,
      'seq': instance.seq,
      'user_seq': instance.userSeq,
      'reply': instance.reply,
      'likes': instance.likes,
      'updated_at': instance.updatedAt,
      'remaining': instance.remaining,
      'comment': instance.comment,
    };

_$_Users _$$_UsersFromJson(Map<String, dynamic> json) => _$_Users(
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
      address: json['address'] as String?,
      pCommentAlram: json['p_comment_alram'] as int?,
      nameSearch: json['name_search'] as int?,
      deletedAt: json['deleted_at'],
      rememberToken: json['remember_token'] as String?,
      memo: json['memo'] as String?,
      emailVerifiedAt: json['email_verified_at'],
      seq: json['seq'] as int?,
      unknownQ: json['unknown_q'] as int?,
      lastLogin: json['last_login'] as String?,
      followCnt: json['follow_cnt'] as int?,
    );

Map<String, dynamic> _$$_UsersToJson(_$_Users instance) => <String, dynamic>{
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
      'address': instance.address,
      'p_comment_alram': instance.pCommentAlram,
      'name_search': instance.nameSearch,
      'deleted_at': instance.deletedAt,
      'remember_token': instance.rememberToken,
      'memo': instance.memo,
      'email_verified_at': instance.emailVerifiedAt,
      'seq': instance.seq,
      'unknown_q': instance.unknownQ,
      'last_login': instance.lastLogin,
      'follow_cnt': instance.followCnt,
    };
