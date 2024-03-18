import 'package:freezed_annotation/freezed_annotation.dart';

part "mcq_model.freezed.dart";
part "mcq_model.g.dart";

@freezed
class MCQModel with _$MCQModel {
  const factory MCQModel({
    required String question,
    required String incorrectOptions1,
    required String incorrectOptions2,
    required String incorrectOptions3,
    required String answer,
  }) = _MCQModel;

  factory MCQModel.fromJson(Map<String, dynamic> json) =>
      _$MCQModelFromJson(json);
}
