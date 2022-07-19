// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefaultErrorModelCopyWith<DefaultErrorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultErrorModelCopyWith<$Res> {
  factory $DefaultErrorModelCopyWith(
          DefaultErrorModel value, $Res Function(DefaultErrorModel) then) =
      _$DefaultErrorModelCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$DefaultErrorModelCopyWithImpl<$Res>
    implements $DefaultErrorModelCopyWith<$Res> {
  _$DefaultErrorModelCopyWithImpl(this._value, this._then);

  final DefaultErrorModel _value;
  // ignore: unused_field
  final $Res Function(DefaultErrorModel) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DefaultErrorModelCopyWith<$Res>
    implements $DefaultErrorModelCopyWith<$Res> {
  factory _$$_DefaultErrorModelCopyWith(_$_DefaultErrorModel value,
          $Res Function(_$_DefaultErrorModel) then) =
      __$$_DefaultErrorModelCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$$_DefaultErrorModelCopyWithImpl<$Res>
    extends _$DefaultErrorModelCopyWithImpl<$Res>
    implements _$$_DefaultErrorModelCopyWith<$Res> {
  __$$_DefaultErrorModelCopyWithImpl(
      _$_DefaultErrorModel _value, $Res Function(_$_DefaultErrorModel) _then)
      : super(_value, (v) => _then(v as _$_DefaultErrorModel));

  @override
  _$_DefaultErrorModel get _value => super._value as _$_DefaultErrorModel;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_DefaultErrorModel(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
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
  final String message;

  @override
  String toString() {
    return 'DefaultErrorModel(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DefaultErrorModel &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_DefaultErrorModelCopyWith<_$_DefaultErrorModel> get copyWith =>
      __$$_DefaultErrorModelCopyWithImpl<_$_DefaultErrorModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DefaultErrorModelToJson(this);
  }
}

abstract class _DefaultErrorModel implements DefaultErrorModel {
  const factory _DefaultErrorModel({required final String message}) =
      _$_DefaultErrorModel;

  factory _DefaultErrorModel.fromJson(Map<String, dynamic> json) =
      _$_DefaultErrorModel.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DefaultErrorModelCopyWith<_$_DefaultErrorModel> get copyWith =>
      throw _privateConstructorUsedError;
}
