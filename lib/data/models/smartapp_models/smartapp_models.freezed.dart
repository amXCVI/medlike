// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'smartapp_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SmartappSendBotEventResponseModel _$SmartappSendBotEventResponseModelFromJson(
    Map<String, dynamic> json) {
  return _SmartappSendBotEventResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SmartappSendBotEventResponseModel {
  List<dynamic>? get files => throw _privateConstructorUsedError;
  SmartappSendBotEventPayloadModel get payload =>
      throw _privateConstructorUsedError;
  String? get ref => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmartappSendBotEventResponseModelCopyWith<SmartappSendBotEventResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartappSendBotEventResponseModelCopyWith<$Res> {
  factory $SmartappSendBotEventResponseModelCopyWith(
          SmartappSendBotEventResponseModel value,
          $Res Function(SmartappSendBotEventResponseModel) then) =
      _$SmartappSendBotEventResponseModelCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic>? files,
      SmartappSendBotEventPayloadModel payload,
      String? ref,
      String? type});

  $SmartappSendBotEventPayloadModelCopyWith<$Res> get payload;
}

/// @nodoc
class _$SmartappSendBotEventResponseModelCopyWithImpl<$Res>
    implements $SmartappSendBotEventResponseModelCopyWith<$Res> {
  _$SmartappSendBotEventResponseModelCopyWithImpl(this._value, this._then);

  final SmartappSendBotEventResponseModel _value;
  // ignore: unused_field
  final $Res Function(SmartappSendBotEventResponseModel) _then;

  @override
  $Res call({
    Object? files = freezed,
    Object? payload = freezed,
    Object? ref = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      files: files == freezed
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as SmartappSendBotEventPayloadModel,
      ref: ref == freezed
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $SmartappSendBotEventPayloadModelCopyWith<$Res> get payload {
    return $SmartappSendBotEventPayloadModelCopyWith<$Res>(_value.payload,
        (value) {
      return _then(_value.copyWith(payload: value));
    });
  }
}

/// @nodoc
abstract class _$$_SmartappSendBotEventResponseModelCopyWith<$Res>
    implements $SmartappSendBotEventResponseModelCopyWith<$Res> {
  factory _$$_SmartappSendBotEventResponseModelCopyWith(
          _$_SmartappSendBotEventResponseModel value,
          $Res Function(_$_SmartappSendBotEventResponseModel) then) =
      __$$_SmartappSendBotEventResponseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic>? files,
      SmartappSendBotEventPayloadModel payload,
      String? ref,
      String? type});

  @override
  $SmartappSendBotEventPayloadModelCopyWith<$Res> get payload;
}

/// @nodoc
class __$$_SmartappSendBotEventResponseModelCopyWithImpl<$Res>
    extends _$SmartappSendBotEventResponseModelCopyWithImpl<$Res>
    implements _$$_SmartappSendBotEventResponseModelCopyWith<$Res> {
  __$$_SmartappSendBotEventResponseModelCopyWithImpl(
      _$_SmartappSendBotEventResponseModel _value,
      $Res Function(_$_SmartappSendBotEventResponseModel) _then)
      : super(_value, (v) => _then(v as _$_SmartappSendBotEventResponseModel));

  @override
  _$_SmartappSendBotEventResponseModel get _value =>
      super._value as _$_SmartappSendBotEventResponseModel;

  @override
  $Res call({
    Object? files = freezed,
    Object? payload = freezed,
    Object? ref = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_SmartappSendBotEventResponseModel(
      files: files == freezed
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as SmartappSendBotEventPayloadModel,
      ref: ref == freezed
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SmartappSendBotEventResponseModel
    implements _SmartappSendBotEventResponseModel {
  const _$_SmartappSendBotEventResponseModel(
      {required final List<dynamic>? files,
      required this.payload,
      required this.ref,
      required this.type})
      : _files = files;

  factory _$_SmartappSendBotEventResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_SmartappSendBotEventResponseModelFromJson(json);

  final List<dynamic>? _files;
  @override
  List<dynamic>? get files {
    final value = _files;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final SmartappSendBotEventPayloadModel payload;
  @override
  final String? ref;
  @override
  final String? type;

  @override
  String toString() {
    return 'SmartappSendBotEventResponseModel(files: $files, payload: $payload, ref: $ref, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SmartappSendBotEventResponseModel &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            const DeepCollectionEquality().equals(other.payload, payload) &&
            const DeepCollectionEquality().equals(other.ref, ref) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_files),
      const DeepCollectionEquality().hash(payload),
      const DeepCollectionEquality().hash(ref),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_SmartappSendBotEventResponseModelCopyWith<
          _$_SmartappSendBotEventResponseModel>
      get copyWith => __$$_SmartappSendBotEventResponseModelCopyWithImpl<
          _$_SmartappSendBotEventResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SmartappSendBotEventResponseModelToJson(this);
  }
}

abstract class _SmartappSendBotEventResponseModel
    implements SmartappSendBotEventResponseModel {
  const factory _SmartappSendBotEventResponseModel(
      {required final List<dynamic>? files,
      required final SmartappSendBotEventPayloadModel payload,
      required final String? ref,
      required final String? type}) = _$_SmartappSendBotEventResponseModel;

  factory _SmartappSendBotEventResponseModel.fromJson(
          Map<String, dynamic> json) =
      _$_SmartappSendBotEventResponseModel.fromJson;

  @override
  List<dynamic>? get files => throw _privateConstructorUsedError;
  @override
  SmartappSendBotEventPayloadModel get payload =>
      throw _privateConstructorUsedError;
  @override
  String? get ref => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SmartappSendBotEventResponseModelCopyWith<
          _$_SmartappSendBotEventResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

SmartappSendBotEventPayloadModel _$SmartappSendBotEventPayloadModelFromJson(
    Map<String, dynamic> json) {
  return _SmartappSendBotEventPayloadModel.fromJson(json);
}

/// @nodoc
mixin _$SmartappSendBotEventPayloadModel {
  dynamic get result => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmartappSendBotEventPayloadModelCopyWith<SmartappSendBotEventPayloadModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartappSendBotEventPayloadModelCopyWith<$Res> {
  factory $SmartappSendBotEventPayloadModelCopyWith(
          SmartappSendBotEventPayloadModel value,
          $Res Function(SmartappSendBotEventPayloadModel) then) =
      _$SmartappSendBotEventPayloadModelCopyWithImpl<$Res>;
  $Res call({dynamic result, String? status});
}

/// @nodoc
class _$SmartappSendBotEventPayloadModelCopyWithImpl<$Res>
    implements $SmartappSendBotEventPayloadModelCopyWith<$Res> {
  _$SmartappSendBotEventPayloadModelCopyWithImpl(this._value, this._then);

  final SmartappSendBotEventPayloadModel _value;
  // ignore: unused_field
  final $Res Function(SmartappSendBotEventPayloadModel) _then;

  @override
  $Res call({
    Object? result = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SmartappSendBotEventPayloadModelCopyWith<$Res>
    implements $SmartappSendBotEventPayloadModelCopyWith<$Res> {
  factory _$$_SmartappSendBotEventPayloadModelCopyWith(
          _$_SmartappSendBotEventPayloadModel value,
          $Res Function(_$_SmartappSendBotEventPayloadModel) then) =
      __$$_SmartappSendBotEventPayloadModelCopyWithImpl<$Res>;
  @override
  $Res call({dynamic result, String? status});
}

/// @nodoc
class __$$_SmartappSendBotEventPayloadModelCopyWithImpl<$Res>
    extends _$SmartappSendBotEventPayloadModelCopyWithImpl<$Res>
    implements _$$_SmartappSendBotEventPayloadModelCopyWith<$Res> {
  __$$_SmartappSendBotEventPayloadModelCopyWithImpl(
      _$_SmartappSendBotEventPayloadModel _value,
      $Res Function(_$_SmartappSendBotEventPayloadModel) _then)
      : super(_value, (v) => _then(v as _$_SmartappSendBotEventPayloadModel));

  @override
  _$_SmartappSendBotEventPayloadModel get _value =>
      super._value as _$_SmartappSendBotEventPayloadModel;

  @override
  $Res call({
    Object? result = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_SmartappSendBotEventPayloadModel(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SmartappSendBotEventPayloadModel
    implements _SmartappSendBotEventPayloadModel {
  const _$_SmartappSendBotEventPayloadModel(
      {required this.result, required this.status});

  factory _$_SmartappSendBotEventPayloadModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_SmartappSendBotEventPayloadModelFromJson(json);

  @override
  final dynamic result;
  @override
  final String? status;

  @override
  String toString() {
    return 'SmartappSendBotEventPayloadModel(result: $result, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SmartappSendBotEventPayloadModel &&
            const DeepCollectionEquality().equals(other.result, result) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(result),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_SmartappSendBotEventPayloadModelCopyWith<
          _$_SmartappSendBotEventPayloadModel>
      get copyWith => __$$_SmartappSendBotEventPayloadModelCopyWithImpl<
          _$_SmartappSendBotEventPayloadModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SmartappSendBotEventPayloadModelToJson(this);
  }
}

abstract class _SmartappSendBotEventPayloadModel
    implements SmartappSendBotEventPayloadModel {
  const factory _SmartappSendBotEventPayloadModel(
      {required final dynamic result,
      required final String? status}) = _$_SmartappSendBotEventPayloadModel;

  factory _SmartappSendBotEventPayloadModel.fromJson(
      Map<String, dynamic> json) = _$_SmartappSendBotEventPayloadModel.fromJson;

  @override
  dynamic get result => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SmartappSendBotEventPayloadModelCopyWith<
          _$_SmartappSendBotEventPayloadModel>
      get copyWith => throw _privateConstructorUsedError;
}
