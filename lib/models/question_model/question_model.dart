import 'package:freezed_annotation/freezed_annotation.dart';

part "question_model.freezed.dart";
part "question_model.g.dart";

@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required String question,
    required String answer,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
