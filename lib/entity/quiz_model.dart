import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'quiz_model.g.dart';
@JsonSerializable()
class QuizModel{
  final String quizName;
  final String module;
  final String subjectClass;
  final String userAccess;
  final String quizType;
  final String timer;

  QuizModel({required this.quizName, required this.module, required this.subjectClass, required this.userAccess,
    required this.quizType, required this.timer});

  factory QuizModel.fromJson(Map<String, dynamic> json) => _$QuizeModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuizeModelToJson(this);


  static CollectionReference<QuizModel> collection() {
    return FirebaseFirestore.instance.collection('quiz').withConverter<QuizModel>(
        fromFirestore: (snapshot, _) => QuizModel.fromJson(snapshot.data()!),
        toFirestore: (callCenter, _) => callCenter.toJson());
  }
}