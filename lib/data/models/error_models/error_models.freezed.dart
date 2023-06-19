// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DefaultErrorModel _$DefaultErrorModelFromJson(Map<String, dynamic> json) {
  return _DefaultErrorModel.fromJson(json);
}

/// @nodoc
mixin _$DefaultErrorModel {
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefaultErrorModelCopyWith<DefaultErrorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultErrorModelCopyWith<$Res> {
  factory $DefaultErrorModelCopyWith(
          DefaultErrorModel value, $Res Function(DefaultErrorModel) then) =
      _$DefaultErrorModelCopyWithImpl<$Res, DefaultErrorModel>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$DefaultErrorModelCopyWithImpl<$Res, $Val extends DefaultErrorModel>
    implements $DefaultErrorModelCopyWith<$Res> {
  _$DefaultErrorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DefaultErrorModelCopyWith<$Res>
    implements $DefaultErrorModelCopyWith<$Res> {
  factory _$$_DefaultErrorModelCopyWith(_$_DefaultErrorModel value,
          $Res Function(_$_DefaultErrorModel) then) =
      __$$_DefaultErrorModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$_DefaultErrorModelCopyWithImpl<$Res>
    extends _$DefaultErrorModelCopyWithImpl<$Res, _$_DefaultErrorModel>
    implements _$$_DefaultErrorModelCopyWith<$Res> {
  __$$_DefaultErrorModelCopyWithImpl(
      _$_DefaultErrorModel _value, $Res Function(_$_DefaultErrorModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_DefaultErrorModel(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DefaultErrorModel implements _DefaultErrorModel {
  const _$_DefaultErrorModel({required this.message});

  factory _$_DefaultErrorModel.fromJson(Map<String, dynamic> json) =>
      _$$_DefaultErrorModelFromJson(json);

  @override
  final String? message;

  @override
  String toString() {
    return 'DefaultErrorModel(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DefaultErrorModel &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DefaultErrorModelCopyWith<_$_DefaultErrorModel> get copyWith =>
      __$$_DefaultErrorModelCopyWithImpl<_$_DefaultErrorModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DefaultErrorModelToJson(
      this,
    );
  }
}

abstract class _DefaultErrorModel implements DefaultErrorModel {
  const factory _DefaultErrorModel({required final String? message}) =
      _$_DefaultErrorModel;

  factory _DefaultErrorModel.fromJson(Map<String, dynamic> json) =
      _$_DefaultErrorModel.fromJson;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_DefaultErrorModelCopyWith<_$_DefaultErrorModel> get copyWith =>
      throw _privateConstructorUsedError;
}
