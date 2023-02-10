// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      tag: json['tag'],
      likeCnt: json['like_cnt'] as int?,
      title: json['title'] as String?,
      detail: json['detail'] as String?,
      pageCnt: json['page_cnt'] as int?,
      createdAt: json['created_at'] as String?,
      seq: json['seq'] as int?,
      photo: json['photo'],
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'like_cnt': instance.likeCnt,
      'title': instance.title,
      'detail': instance.detail,
      'page_cnt': instance.pageCnt,
      'created_at': instance.createdAt,
      'seq': instance.seq,
      'photo': instance.photo,
    };
