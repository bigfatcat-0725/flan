// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeedModel _$$_FeedModelFromJson(Map<String, dynamic> json) => _$_FeedModel(
      myData: json['my_data'] == null
          ? null
          : MyData.fromJson(json['my_data'] as Map<String, dynamic>),
      ingQuestion: (json['ing_question'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      finQuestion: (json['fin_question'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      canQuestion: (json['can_question'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      follower: json['follower'] as List<dynamic>?,
      following: json['following'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_FeedModelToJson(_$_FeedModel instance) =>
    <String, dynamic>{
      'my_data': instance.myData,
      'ing_question': instance.ingQuestion,
      'fin_question': instance.finQuestion,
      'can_question': instance.canQuestion,
      'follower': instance.follower,
      'following': instance.following,
    };

_$_Question _$$_QuestionFromJson(Map<String, dynamic> json) => _$_Question(
      users: json['Users'] == null
          ? null
          : MyData.fromJson(json['Users'] as Map<String, dynamic>),
      questions: json['Questions'] == null
          ? null
          : Questions.fromJson(json['Questions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'Users': instance.users,
      'Questions': instance.questions,
    };

_$_Questions _$$_QuestionsFromJson(Map<String, dynamic> json) => _$_Questions(
      updatedAt: json['updated_at'],
      userSeq: json['user_seq'] as int?,
      question: json['question'] as String?,
      likes: json['likes'] as int?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      seq: json['seq'] as int?,
      toSeq: json['to_seq'] as int?,
      photo: json['photo'],
      private: json['private'] as String?,
      unknownName: json['unknown_name'],
      remaining: json['remaining'] as String?,
      topAnswer: json['top_answer'] as List<dynamic>?,
      answer: (json['answer'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuestionsToJson(_$_Questions instance) =>
    <String, dynamic>{
      'updated_at': instance.updatedAt,
      'user_seq': instance.userSeq,
      'question': instance.question,
      'likes': instance.likes,
      'status': instance.status,
      'created_at': instance.createdAt,
      'seq': instance.seq,
      'to_seq': instance.toSeq,
      'photo': instance.photo,
      'private': instance.private,
      'unknown_name': instance.unknownName,
      'remaining': instance.remaining,
      'top_answer': instance.topAnswer,
      'answer': instance.answer,
    };

_$_Answer _$$_AnswerFromJson(Map<String, dynamic> json) => _$_Answer(
      users: json['Users'] == null
          ? null
          : MyData.fromJson(json['Users'] as Map<String, dynamic>),
      answers: json['Answers'] == null
          ? null
          : Answers.fromJson(json['Answers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AnswerToJson(_$_Answer instance) => <String, dynamic>{
      'Users': instance.users,
      'Answers': instance.answers,
    };

_$_Answers _$$_AnswersFromJson(Map<String, dynamic> json) => _$_Answers(
      userSeq: json['user_seq'] as int?,
      reply: json['reply'] as String?,
      likes: json['likes'] as int?,
      updatedAt: json['updated_at'],
      pSeq: json['p_seq'] as int?,
      questionSeq: json['question_seq'] as int?,
      photo: json['photo'] as String?,
      createdAt: json['created_at'] as String?,
      seq: json['seq'] as int?,
      remaining: json['remaining'] as String?,
      comment: json['comment'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_AnswersToJson(_$_Answers instance) =>
    <String, dynamic>{
      'user_seq': instance.userSeq,
      'reply': instance.reply,
      'likes': instance.likes,
      'updated_at': instance.updatedAt,
      'p_seq': instance.pSeq,
      'question_seq': instance.questionSeq,
      'photo': instance.photo,
      'created_at': instance.createdAt,
      'seq': instance.seq,
      'remaining': instance.remaining,
      'comment': instance.comment,
    };

_$_MyData _$$_MyDataFromJson(Map<String, dynamic> json) => _$_MyData(
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
      answerCnt: json['answer_cnt'] as int?,
    );

Map<String, dynamic> _$$_MyDataToJson(_$_MyData instance) => <String, dynamic>{
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
      'answer_cnt': instance.answerCnt,
    };
