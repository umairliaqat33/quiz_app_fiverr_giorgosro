// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mcq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MCQModelImpl _$$MCQModelImplFromJson(Map<String, dynamic> json) =>
    _$MCQModelImpl(
      question: json['question'] as String,
      incorrectOptions1: json['incorrectOptions1'] as String,
      incorrectOptions2: json['incorrectOptions2'] as String,
      incorrectOptions3: json['incorrectOptions3'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$$MCQModelImplToJson(_$MCQModelImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'incorrectOptions1': instance.incorrectOptions1,
      'incorrectOptions2': instance.incorrectOptions2,
      'incorrectOptions3': instance.incorrectOptions3,
      'answer': instance.answer,
    };
