// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModel _$QuizeModelFromJson(Map<String, dynamic> json) => QuizModel(
      quizName: json['quizName'] as String,
      module: json['module'] as String,
      subjectClass: json['subjectClass'] as String,
      userAccess: json['userAccess'] as String,
      quizType: json['quizType'] as String,
      timer: json['timer'] as String,
    );

Map<String, dynamic> _$QuizeModelToJson(QuizModel instance) =>
    <String, dynamic>{
      'quizName': instance.quizName,
      'module': instance.module,
      'subjectClass': instance.subjectClass,
      'userAccess': instance.userAccess,
      'quizType': instance.quizType,
      'timer': instance.timer,
    };
