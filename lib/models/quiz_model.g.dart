// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizResponseImpl _$$QuizResponseImplFromJson(Map<String, dynamic> json) =>
    _$QuizResponseImpl(
      quiz:
          (json['quiz'] as List<dynamic>)
              .map((e) => QuizItem.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$QuizResponseImplToJson(_$QuizResponseImpl instance) =>
    <String, dynamic>{'quiz': instance.quiz};

_$QuizItemImpl _$$QuizItemImplFromJson(Map<String, dynamic> json) =>
    _$QuizItemImpl(
      image: json['image'] as String,
      answerA: json['answer_a'] as String,
      answerB: json['answer_b'] as String,
      rightAnswer: json['right_answer'] as String,
    );

Map<String, dynamic> _$$QuizItemImplToJson(_$QuizItemImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'answer_a': instance.answerA,
      'answer_b': instance.answerB,
      'right_answer': instance.rightAnswer,
    };
