// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FAQItemModel _$FAQItemModelFromJson(Map<String, dynamic> json) {
  return _FAQItemModel.fromJson(json);
}

/// @nodoc
mixin _$FAQItemModel {
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FAQItemModelCopyWith<FAQItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQItemModelCopyWith<$Res> {
  factory $FAQItemModelCopyWith(
          FAQItemModel value, $Res Function(FAQItemModel) then) =
      _$FAQItemModelCopyWithImpl<$Res, FAQItemModel>;
  @useResult
  $Res call({String id, String question, String answer});
}

/// @nodoc
class _$FAQItemModelCopyWithImpl<$Res, $Val extends FAQItemModel>
    implements $FAQItemModelCopyWith<$Res> {
  _$FAQItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FAQItemModelCopyWith<$Res>
    implements $FAQItemModelCopyWith<$Res> {
  factory _$$_FAQItemModelCopyWith(
          _$_FAQItemModel value, $Res Function(_$_FAQItemModel) then) =
      __$$_FAQItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String question, String answer});
}

/// @nodoc
class __$$_FAQItemModelCopyWithImpl<$Res>
    extends _$FAQItemModelCopyWithImpl<$Res, _$_FAQItemModel>
    implements _$$_FAQItemModelCopyWith<$Res> {
  __$$_FAQItemModelCopyWithImpl(
      _$_FAQItemModel _value, $Res Function(_$_FAQItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_$_FAQItemModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
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
class _$_FAQItemModel implements _FAQItemModel {
  const _$_FAQItemModel(
      {required this.id, required this.question, required this.answer});

  factory _$_FAQItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_FAQItemModelFromJson(json);

  @override
  final String id;
  @override
  final String question;
  @override
  final String answer;

  @override
  String toString() {
    return 'FAQItemModel(id: $id, question: $question, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FAQItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, question, answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FAQItemModelCopyWith<_$_FAQItemModel> get copyWith =>
      __$$_FAQItemModelCopyWithImpl<_$_FAQItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FAQItemModelToJson(
      this,
    );
  }
}

abstract class _FAQItemModel implements FAQItemModel {
  const factory _FAQItemModel(
      {required final String id,
      required final String question,
      required final String answer}) = _$_FAQItemModel;

  factory _FAQItemModel.fromJson(Map<String, dynamic> json) =
      _$_FAQItemModel.fromJson;

  @override
  String get id;
  @override
  String get question;
  @override
  String get answer;
  @override
  @JsonKey(ignore: true)
  _$$_FAQItemModelCopyWith<_$_FAQItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
