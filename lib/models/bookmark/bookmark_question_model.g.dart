// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookmarkQuestionModel _$$_BookmarkQuestionModelFromJson(
        Map<String, dynamic> json) =>
    _$_BookmarkQuestionModel(
      bookmark: json['Bookmark'] == null
          ? null
          : Bookmark.fromJson(json['Bookmark'] as Map<String, dynamic>),
      questions: json['Questions'] == null
          ? null
          : Questions.fromJson(json['Questions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BookmarkQuestionModelToJson(
        _$_BookmarkQuestionModel instance) =>
    <String, dynamic>{
      'Bookmark': instance.bookmark,
      'Questions': instance.questions,
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
    };
