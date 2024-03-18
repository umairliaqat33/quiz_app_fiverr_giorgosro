// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mcq_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MCQModel _$MCQModelFromJson(Map<String, dynamic> json) {
  return _MCQModel.fromJson(json);
}

/// @nodoc
mixin _$MCQModel {
  String get question => throw _privateConstructorUsedError;
  String get incorrectOptions1 => throw _privateConstructorUsedError;
  String get incorrectOptions2 => throw _privateConstructorUsedError;
  String get incorrectOptions3 => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MCQModelCopyWith<MCQModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MCQModelCopyWith<$Res> {
  factory $MCQModelCopyWith(MCQModel value, $Res Function(MCQModel) then) =
      _$MCQModelCopyWithImpl<$Res, MCQModel>;
  @useResult
  $Res call(
      {String question,
      String incorrectOptions1,
      String incorrectOptions2,
      String incorrectOptions3,
      String answer});
}

/// @nodoc
class _$MCQModelCopyWithImpl<$Res, $Val extends MCQModel>
    implements $MCQModelCopyWith<$Res> {
  _$MCQModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? incorrectOptions1 = null,
    Object? incorrectOptions2 = null,
    Object? incorrectOptions3 = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      incorrectOptions1: null == incorrectOptions1
          ? _value.incorrectOptions1
          : incorrectOptions1 // ignore: cast_nullable_to_non_nullable
              as String,
      incorrectOptions2: null == incorrectOptions2
          ? _value.incorrectOptions2
          : incorrectOptions2 // ignore: cast_nullable_to_non_nullable
              as String,
      incorrectOptions3: null == incorrectOptions3
          ? _value.incorrectOptions3
          : incorrectOptions3 // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MCQModelImplCopyWith<$Res>
    implements $MCQModelCopyWith<$Res> {
  factory _$$MCQModelImplCopyWith(
          _$MCQModelImpl value, $Res Function(_$MCQModelImpl) then) =
      __$$MCQModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String question,
      String incorrectOptions1,
      String incorrectOptions2,
      String incorrectOptions3,
      String answer});
}

/// @nodoc
class __$$MCQModelImplCopyWithImpl<$Res>
    extends _$MCQModelCopyWithImpl<$Res, _$MCQModelImpl>
    implements _$$MCQModelImplCopyWith<$Res> {
  __$$MCQModelImplCopyWithImpl(
      _$MCQModelImpl _value, $Res Function(_$MCQModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? incorrectOptions1 = null,
    Object? incorrectOptions2 = null,
    Object? incorrectOptions3 = null,
    Object? answer = null,
  }) {
    return _then(_$MCQModelImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      incorrectOptions1: null == incorrectOptions1
          ? _value.incorrectOptions1
          : incorrectOptions1 // ignore: cast_nullable_to_non_nullable
              as String,
      incorrectOptions2: null == incorrectOptions2
          ? _value.incorrectOptions2
          : incorrectOptions2 // ignore: cast_nullable_to_non_nullable
              as String,
      incorrectOptions3: null == incorrectOptions3
          ? _value.incorrectOptions3
          : incorrectOptions3 // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MCQModelImpl implements _MCQModel {
  const _$MCQModelImpl(
      {required this.question,
      required this.incorrectOptions1,
      required this.incorrectOptions2,
      required this.incorrectOptions3,
      required this.answer});

  factory _$MCQModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MCQModelImplFromJson(json);

  @override
  final String question;
  @override
  final String incorrectOptions1;
  @override
  final String incorrectOptions2;
  @override
  final String incorrectOptions3;
  @override
  final String answer;

  @override
  String toString() {
    return 'MCQModel(question: $question, incorrectOptions1: $incorrectOptions1, incorrectOptions2: $incorrectOptions2, incorrectOptions3: $incorrectOptions3, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MCQModelImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.incorrectOptions1, incorrectOptions1) ||
                other.incorrectOptions1 == incorrectOptions1) &&
            (identical(other.incorrectOptions2, incorrectOptions2) ||
                other.incorrectOptions2 == incorrectOptions2) &&
            (identical(other.incorrectOptions3, incorrectOptions3) ||
                other.incorrectOptions3 == incorrectOptions3) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, question, incorrectOptions1,
      incorrectOptions2, incorrectOptions3, answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MCQModelImplCopyWith<_$MCQModelImpl> get copyWith =>
      __$$MCQModelImplCopyWithImpl<_$MCQModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MCQModelImplToJson(
      this,
    );
  }
}

abstract class _MCQModel implements MCQModel {
  const factory _MCQModel(
      {required final String question,
      required final String incorrectOptions1,
      required final String incorrectOptions2,
      required final String incorrectOptions3,
      required final String answer}) = _$MCQModelImpl;

  factory _MCQModel.fromJson(Map<String, dynamic> json) =
      _$MCQModelImpl.fromJson;

  @override
  String get question;
  @override
  String get incorrectOptions1;
  @override
  String get incorrectOptions2;
  @override
  String get incorrectOptions3;
  @override
  String get answer;
  @override
  @JsonKey(ignore: true)
  _$$MCQModelImplCopyWith<_$MCQModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
