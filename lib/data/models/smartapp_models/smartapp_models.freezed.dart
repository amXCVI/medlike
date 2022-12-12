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
  String get ref => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

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
      String ref,
      String type});

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
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
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
      String ref,
      String type});

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
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
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
  final String ref;
  @override
  final String type;

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
      required final String ref,
      required final String type}) = _$_SmartappSendBotEventResponseModel;

  factory _SmartappSendBotEventResponseModel.fromJson(
          Map<String, dynamic> json) =
      _$_SmartappSendBotEventResponseModel.fromJson;

  @override
  List<dynamic>? get files => throw _privateConstructorUsedError;
  @override
  SmartappSendBotEventPayloadModel get payload =>
      throw _privateConstructorUsedError;
  @override
  String get ref => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
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
  SmartappSendBotEventPayloadResultModel get result =>
      throw _privateConstructorUsedError;
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
  $Res call({SmartappSendBotEventPayloadResultModel result, String? status});

  $SmartappSendBotEventPayloadResultModelCopyWith<$Res> get result;
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
              as SmartappSendBotEventPayloadResultModel,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $SmartappSendBotEventPayloadResultModelCopyWith<$Res> get result {
    return $SmartappSendBotEventPayloadResultModelCopyWith<$Res>(_value.result,
        (value) {
      return _then(_value.copyWith(result: value));
    });
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
  $Res call({SmartappSendBotEventPayloadResultModel result, String? status});

  @override
  $SmartappSendBotEventPayloadResultModelCopyWith<$Res> get result;
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
              as SmartappSendBotEventPayloadResultModel,
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
  final SmartappSendBotEventPayloadResultModel result;
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
      {required final SmartappSendBotEventPayloadResultModel result,
      required final String? status}) = _$_SmartappSendBotEventPayloadModel;

  factory _SmartappSendBotEventPayloadModel.fromJson(
      Map<String, dynamic> json) = _$_SmartappSendBotEventPayloadModel.fromJson;

  @override
  SmartappSendBotEventPayloadResultModel get result =>
      throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SmartappSendBotEventPayloadModelCopyWith<
          _$_SmartappSendBotEventPayloadModel>
      get copyWith => throw _privateConstructorUsedError;
}

SmartappSendBotEventPayloadResultModel
    _$SmartappSendBotEventPayloadResultModelFromJson(
        Map<String, dynamic> json) {
  return _SmartappSendBotEventPayloadResultModel.fromJson(json);
}

/// @nodoc
mixin _$SmartappSendBotEventPayloadResultModel {
  dynamic get content => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmartappSendBotEventPayloadResultModelCopyWith<
          SmartappSendBotEventPayloadResultModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartappSendBotEventPayloadResultModelCopyWith<$Res> {
  factory $SmartappSendBotEventPayloadResultModelCopyWith(
          SmartappSendBotEventPayloadResultModel value,
          $Res Function(SmartappSendBotEventPayloadResultModel) then) =
      _$SmartappSendBotEventPayloadResultModelCopyWithImpl<$Res>;
  $Res call({dynamic content, String status, int statusCode});
}

/// @nodoc
class _$SmartappSendBotEventPayloadResultModelCopyWithImpl<$Res>
    implements $SmartappSendBotEventPayloadResultModelCopyWith<$Res> {
  _$SmartappSendBotEventPayloadResultModelCopyWithImpl(this._value, this._then);

  final SmartappSendBotEventPayloadResultModel _value;
  // ignore: unused_field
  final $Res Function(SmartappSendBotEventPayloadResultModel) _then;

  @override
  $Res call({
    Object? content = freezed,
    Object? status = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_value.copyWith(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_SmartappSendBotEventPayloadResultModelCopyWith<$Res>
    implements $SmartappSendBotEventPayloadResultModelCopyWith<$Res> {
  factory _$$_SmartappSendBotEventPayloadResultModelCopyWith(
          _$_SmartappSendBotEventPayloadResultModel value,
          $Res Function(_$_SmartappSendBotEventPayloadResultModel) then) =
      __$$_SmartappSendBotEventPayloadResultModelCopyWithImpl<$Res>;
  @override
  $Res call({dynamic content, String status, int statusCode});
}

/// @nodoc
class __$$_SmartappSendBotEventPayloadResultModelCopyWithImpl<$Res>
    extends _$SmartappSendBotEventPayloadResultModelCopyWithImpl<$Res>
    implements _$$_SmartappSendBotEventPayloadResultModelCopyWith<$Res> {
  __$$_SmartappSendBotEventPayloadResultModelCopyWithImpl(
      _$_SmartappSendBotEventPayloadResultModel _value,
      $Res Function(_$_SmartappSendBotEventPayloadResultModel) _then)
      : super(_value,
            (v) => _then(v as _$_SmartappSendBotEventPayloadResultModel));

  @override
  _$_SmartappSendBotEventPayloadResultModel get _value =>
      super._value as _$_SmartappSendBotEventPayloadResultModel;

  @override
  $Res call({
    Object? content = freezed,
    Object? status = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_$_SmartappSendBotEventPayloadResultModel(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SmartappSendBotEventPayloadResultModel
    implements _SmartappSendBotEventPayloadResultModel {
  const _$_SmartappSendBotEventPayloadResultModel(
      {required this.content, required this.status, required this.statusCode});

  factory _$_SmartappSendBotEventPayloadResultModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_SmartappSendBotEventPayloadResultModelFromJson(json);

  @override
  final dynamic content;
  @override
  final String status;
  @override
  final int statusCode;

  @override
  String toString() {
    return 'SmartappSendBotEventPayloadResultModel(content: $content, status: $status, statusCode: $statusCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SmartappSendBotEventPayloadResultModel &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(statusCode));

  @JsonKey(ignore: true)
  @override
  _$$_SmartappSendBotEventPayloadResultModelCopyWith<
          _$_SmartappSendBotEventPayloadResultModel>
      get copyWith => __$$_SmartappSendBotEventPayloadResultModelCopyWithImpl<
          _$_SmartappSendBotEventPayloadResultModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SmartappSendBotEventPayloadResultModelToJson(this);
  }
}

abstract class _SmartappSendBotEventPayloadResultModel
    implements SmartappSendBotEventPayloadResultModel {
  const factory _SmartappSendBotEventPayloadResultModel(
          {required final dynamic content,
          required final String status,
          required final int statusCode}) =
      _$_SmartappSendBotEventPayloadResultModel;

  factory _SmartappSendBotEventPayloadResultModel.fromJson(
          Map<String, dynamic> json) =
      _$_SmartappSendBotEventPayloadResultModel.fromJson;

  @override
  dynamic get content => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int get statusCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SmartappSendBotEventPayloadResultModelCopyWith<
          _$_SmartappSendBotEventPayloadResultModel>
      get copyWith => throw _privateConstructorUsedError;
}

SmartappSendBotEventTokenResponseModel
    _$SmartappSendBotEventTokenResponseModelFromJson(
        Map<String, dynamic> json) {
  return _SmartappSendBotEventTokenResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SmartappSendBotEventTokenResponseModel {
  List<dynamic>? get files => throw _privateConstructorUsedError;
  SmartappSendBotEventTokenPayloadModel get payload =>
      throw _privateConstructorUsedError;
  String? get ref => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmartappSendBotEventTokenResponseModelCopyWith<
          SmartappSendBotEventTokenResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartappSendBotEventTokenResponseModelCopyWith<$Res> {
  factory $SmartappSendBotEventTokenResponseModelCopyWith(
          SmartappSendBotEventTokenResponseModel value,
          $Res Function(SmartappSendBotEventTokenResponseModel) then) =
      _$SmartappSendBotEventTokenResponseModelCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic>? files,
      SmartappSendBotEventTokenPayloadModel payload,
      String? ref,
      String? type});

  $SmartappSendBotEventTokenPayloadModelCopyWith<$Res> get payload;
}

/// @nodoc
class _$SmartappSendBotEventTokenResponseModelCopyWithImpl<$Res>
    implements $SmartappSendBotEventTokenResponseModelCopyWith<$Res> {
  _$SmartappSendBotEventTokenResponseModelCopyWithImpl(this._value, this._then);

  final SmartappSendBotEventTokenResponseModel _value;
  // ignore: unused_field
  final $Res Function(SmartappSendBotEventTokenResponseModel) _then;

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
              as SmartappSendBotEventTokenPayloadModel,
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
  $SmartappSendBotEventTokenPayloadModelCopyWith<$Res> get payload {
    return $SmartappSendBotEventTokenPayloadModelCopyWith<$Res>(_value.payload,
        (value) {
      return _then(_value.copyWith(payload: value));
    });
  }
}

/// @nodoc
abstract class _$$_SmartappSendBotEventTokenResponseModelCopyWith<$Res>
    implements $SmartappSendBotEventTokenResponseModelCopyWith<$Res> {
  factory _$$_SmartappSendBotEventTokenResponseModelCopyWith(
          _$_SmartappSendBotEventTokenResponseModel value,
          $Res Function(_$_SmartappSendBotEventTokenResponseModel) then) =
      __$$_SmartappSendBotEventTokenResponseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic>? files,
      SmartappSendBotEventTokenPayloadModel payload,
      String? ref,
      String? type});

  @override
  $SmartappSendBotEventTokenPayloadModelCopyWith<$Res> get payload;
}

/// @nodoc
class __$$_SmartappSendBotEventTokenResponseModelCopyWithImpl<$Res>
    extends _$SmartappSendBotEventTokenResponseModelCopyWithImpl<$Res>
    implements _$$_SmartappSendBotEventTokenResponseModelCopyWith<$Res> {
  __$$_SmartappSendBotEventTokenResponseModelCopyWithImpl(
      _$_SmartappSendBotEventTokenResponseModel _value,
      $Res Function(_$_SmartappSendBotEventTokenResponseModel) _then)
      : super(_value,
            (v) => _then(v as _$_SmartappSendBotEventTokenResponseModel));

  @override
  _$_SmartappSendBotEventTokenResponseModel get _value =>
      super._value as _$_SmartappSendBotEventTokenResponseModel;

  @override
  $Res call({
    Object? files = freezed,
    Object? payload = freezed,
    Object? ref = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_SmartappSendBotEventTokenResponseModel(
      files: files == freezed
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as SmartappSendBotEventTokenPayloadModel,
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
class _$_SmartappSendBotEventTokenResponseModel
    implements _SmartappSendBotEventTokenResponseModel {
  const _$_SmartappSendBotEventTokenResponseModel(
      {required final List<dynamic>? files,
      required this.payload,
      required this.ref,
      required this.type})
      : _files = files;

  factory _$_SmartappSendBotEventTokenResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_SmartappSendBotEventTokenResponseModelFromJson(json);

  final List<dynamic>? _files;
  @override
  List<dynamic>? get files {
    final value = _files;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final SmartappSendBotEventTokenPayloadModel payload;
  @override
  final String? ref;
  @override
  final String? type;

  @override
  String toString() {
    return 'SmartappSendBotEventTokenResponseModel(files: $files, payload: $payload, ref: $ref, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SmartappSendBotEventTokenResponseModel &&
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
  _$$_SmartappSendBotEventTokenResponseModelCopyWith<
          _$_SmartappSendBotEventTokenResponseModel>
      get copyWith => __$$_SmartappSendBotEventTokenResponseModelCopyWithImpl<
          _$_SmartappSendBotEventTokenResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SmartappSendBotEventTokenResponseModelToJson(this);
  }
}

abstract class _SmartappSendBotEventTokenResponseModel
    implements SmartappSendBotEventTokenResponseModel {
  const factory _SmartappSendBotEventTokenResponseModel(
      {required final List<dynamic>? files,
      required final SmartappSendBotEventTokenPayloadModel payload,
      required final String? ref,
      required final String? type}) = _$_SmartappSendBotEventTokenResponseModel;

  factory _SmartappSendBotEventTokenResponseModel.fromJson(
          Map<String, dynamic> json) =
      _$_SmartappSendBotEventTokenResponseModel.fromJson;

  @override
  List<dynamic>? get files => throw _privateConstructorUsedError;
  @override
  SmartappSendBotEventTokenPayloadModel get payload =>
      throw _privateConstructorUsedError;
  @override
  String? get ref => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SmartappSendBotEventTokenResponseModelCopyWith<
          _$_SmartappSendBotEventTokenResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

SmartappSendBotEventTokenPayloadModel
    _$SmartappSendBotEventTokenPayloadModelFromJson(Map<String, dynamic> json) {
  return _SmartappSendBotEventTokenPayloadModel.fromJson(json);
}

/// @nodoc
mixin _$SmartappSendBotEventTokenPayloadModel {
  dynamic get result => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmartappSendBotEventTokenPayloadModelCopyWith<
          SmartappSendBotEventTokenPayloadModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartappSendBotEventTokenPayloadModelCopyWith<$Res> {
  factory $SmartappSendBotEventTokenPayloadModelCopyWith(
          SmartappSendBotEventTokenPayloadModel value,
          $Res Function(SmartappSendBotEventTokenPayloadModel) then) =
      _$SmartappSendBotEventTokenPayloadModelCopyWithImpl<$Res>;
  $Res call({dynamic result, String? status});
}

/// @nodoc
class _$SmartappSendBotEventTokenPayloadModelCopyWithImpl<$Res>
    implements $SmartappSendBotEventTokenPayloadModelCopyWith<$Res> {
  _$SmartappSendBotEventTokenPayloadModelCopyWithImpl(this._value, this._then);

  final SmartappSendBotEventTokenPayloadModel _value;
  // ignore: unused_field
  final $Res Function(SmartappSendBotEventTokenPayloadModel) _then;

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
abstract class _$$_SmartappSendBotEventTokenPayloadModelCopyWith<$Res>
    implements $SmartappSendBotEventTokenPayloadModelCopyWith<$Res> {
  factory _$$_SmartappSendBotEventTokenPayloadModelCopyWith(
          _$_SmartappSendBotEventTokenPayloadModel value,
          $Res Function(_$_SmartappSendBotEventTokenPayloadModel) then) =
      __$$_SmartappSendBotEventTokenPayloadModelCopyWithImpl<$Res>;
  @override
  $Res call({dynamic result, String? status});
}

/// @nodoc
class __$$_SmartappSendBotEventTokenPayloadModelCopyWithImpl<$Res>
    extends _$SmartappSendBotEventTokenPayloadModelCopyWithImpl<$Res>
    implements _$$_SmartappSendBotEventTokenPayloadModelCopyWith<$Res> {
  __$$_SmartappSendBotEventTokenPayloadModelCopyWithImpl(
      _$_SmartappSendBotEventTokenPayloadModel _value,
      $Res Function(_$_SmartappSendBotEventTokenPayloadModel) _then)
      : super(_value,
            (v) => _then(v as _$_SmartappSendBotEventTokenPayloadModel));

  @override
  _$_SmartappSendBotEventTokenPayloadModel get _value =>
      super._value as _$_SmartappSendBotEventTokenPayloadModel;

  @override
  $Res call({
    Object? result = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_SmartappSendBotEventTokenPayloadModel(
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
class _$_SmartappSendBotEventTokenPayloadModel
    implements _SmartappSendBotEventTokenPayloadModel {
  const _$_SmartappSendBotEventTokenPayloadModel(
      {required this.result, required this.status});

  factory _$_SmartappSendBotEventTokenPayloadModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_SmartappSendBotEventTokenPayloadModelFromJson(json);

  @override
  final dynamic result;
  @override
  final String? status;

  @override
  String toString() {
    return 'SmartappSendBotEventTokenPayloadModel(result: $result, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SmartappSendBotEventTokenPayloadModel &&
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
  _$$_SmartappSendBotEventTokenPayloadModelCopyWith<
          _$_SmartappSendBotEventTokenPayloadModel>
      get copyWith => __$$_SmartappSendBotEventTokenPayloadModelCopyWithImpl<
          _$_SmartappSendBotEventTokenPayloadModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SmartappSendBotEventTokenPayloadModelToJson(this);
  }
}

abstract class _SmartappSendBotEventTokenPayloadModel
    implements SmartappSendBotEventTokenPayloadModel {
  const factory _SmartappSendBotEventTokenPayloadModel(
          {required final dynamic result, required final String? status}) =
      _$_SmartappSendBotEventTokenPayloadModel;

  factory _SmartappSendBotEventTokenPayloadModel.fromJson(
          Map<String, dynamic> json) =
      _$_SmartappSendBotEventTokenPayloadModel.fromJson;

  @override
  dynamic get result => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SmartappSendBotEventTokenPayloadModelCopyWith<
          _$_SmartappSendBotEventTokenPayloadModel>
      get copyWith => throw _privateConstructorUsedError;
}

SmartappGetFileResponseModel _$SmartappGetFileResponseModelFromJson(
    Map<String, dynamic> json) {
  return _SmartappGetFileResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SmartappGetFileResponseModel {
  String get type => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_async_file')
  String? get isAsyncFile => throw _privateConstructorUsedError;
  @JsonKey(name: '_file_id')
  String? get fileId => throw _privateConstructorUsedError;
  @JsonKey(name: '_file_mimetype')
  String? get fileMimetype => throw _privateConstructorUsedError;
  @JsonKey(name: '_file_url')
  String? get fileUrl => throw _privateConstructorUsedError;
  @JsonKey(name: '_file_hash')
  String? get fileHash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmartappGetFileResponseModelCopyWith<SmartappGetFileResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartappGetFileResponseModelCopyWith<$Res> {
  factory $SmartappGetFileResponseModelCopyWith(
          SmartappGetFileResponseModel value,
          $Res Function(SmartappGetFileResponseModel) then) =
      _$SmartappGetFileResponseModelCopyWithImpl<$Res>;
  $Res call(
      {String type,
      String filename,
      String size,
      @JsonKey(name: 'is_async_file') String? isAsyncFile,
      @JsonKey(name: '_file_id') String? fileId,
      @JsonKey(name: '_file_mimetype') String? fileMimetype,
      @JsonKey(name: '_file_url') String? fileUrl,
      @JsonKey(name: '_file_hash') String? fileHash});
}

/// @nodoc
class _$SmartappGetFileResponseModelCopyWithImpl<$Res>
    implements $SmartappGetFileResponseModelCopyWith<$Res> {
  _$SmartappGetFileResponseModelCopyWithImpl(this._value, this._then);

  final SmartappGetFileResponseModel _value;
  // ignore: unused_field
  final $Res Function(SmartappGetFileResponseModel) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? filename = freezed,
    Object? size = freezed,
    Object? isAsyncFile = freezed,
    Object? fileId = freezed,
    Object? fileMimetype = freezed,
    Object? fileUrl = freezed,
    Object? fileHash = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      filename: filename == freezed
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      isAsyncFile: isAsyncFile == freezed
          ? _value.isAsyncFile
          : isAsyncFile // ignore: cast_nullable_to_non_nullable
              as String?,
      fileId: fileId == freezed
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String?,
      fileMimetype: fileMimetype == freezed
          ? _value.fileMimetype
          : fileMimetype // ignore: cast_nullable_to_non_nullable
              as String?,
      fileUrl: fileUrl == freezed
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fileHash: fileHash == freezed
          ? _value.fileHash
          : fileHash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SmartappGetFileResponseModelCopyWith<$Res>
    implements $SmartappGetFileResponseModelCopyWith<$Res> {
  factory _$$_SmartappGetFileResponseModelCopyWith(
          _$_SmartappGetFileResponseModel value,
          $Res Function(_$_SmartappGetFileResponseModel) then) =
      __$$_SmartappGetFileResponseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String type,
      String filename,
      String size,
      @JsonKey(name: 'is_async_file') String? isAsyncFile,
      @JsonKey(name: '_file_id') String? fileId,
      @JsonKey(name: '_file_mimetype') String? fileMimetype,
      @JsonKey(name: '_file_url') String? fileUrl,
      @JsonKey(name: '_file_hash') String? fileHash});
}

/// @nodoc
class __$$_SmartappGetFileResponseModelCopyWithImpl<$Res>
    extends _$SmartappGetFileResponseModelCopyWithImpl<$Res>
    implements _$$_SmartappGetFileResponseModelCopyWith<$Res> {
  __$$_SmartappGetFileResponseModelCopyWithImpl(
      _$_SmartappGetFileResponseModel _value,
      $Res Function(_$_SmartappGetFileResponseModel) _then)
      : super(_value, (v) => _then(v as _$_SmartappGetFileResponseModel));

  @override
  _$_SmartappGetFileResponseModel get _value =>
      super._value as _$_SmartappGetFileResponseModel;

  @override
  $Res call({
    Object? type = freezed,
    Object? filename = freezed,
    Object? size = freezed,
    Object? isAsyncFile = freezed,
    Object? fileId = freezed,
    Object? fileMimetype = freezed,
    Object? fileUrl = freezed,
    Object? fileHash = freezed,
  }) {
    return _then(_$_SmartappGetFileResponseModel(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      filename: filename == freezed
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      isAsyncFile: isAsyncFile == freezed
          ? _value.isAsyncFile
          : isAsyncFile // ignore: cast_nullable_to_non_nullable
              as String?,
      fileId: fileId == freezed
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String?,
      fileMimetype: fileMimetype == freezed
          ? _value.fileMimetype
          : fileMimetype // ignore: cast_nullable_to_non_nullable
              as String?,
      fileUrl: fileUrl == freezed
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fileHash: fileHash == freezed
          ? _value.fileHash
          : fileHash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SmartappGetFileResponseModel implements _SmartappGetFileResponseModel {
  const _$_SmartappGetFileResponseModel(
      {required this.type,
      required this.filename,
      required this.size,
      @JsonKey(name: 'is_async_file') this.isAsyncFile,
      @JsonKey(name: '_file_id') this.fileId,
      @JsonKey(name: '_file_mimetype') this.fileMimetype,
      @JsonKey(name: '_file_url') this.fileUrl,
      @JsonKey(name: '_file_hash') this.fileHash});

  factory _$_SmartappGetFileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_SmartappGetFileResponseModelFromJson(json);

  @override
  final String type;
  @override
  final String filename;
  @override
  final String size;
  @override
  @JsonKey(name: 'is_async_file')
  final String? isAsyncFile;
  @override
  @JsonKey(name: '_file_id')
  final String? fileId;
  @override
  @JsonKey(name: '_file_mimetype')
  final String? fileMimetype;
  @override
  @JsonKey(name: '_file_url')
  final String? fileUrl;
  @override
  @JsonKey(name: '_file_hash')
  final String? fileHash;

  @override
  String toString() {
    return 'SmartappGetFileResponseModel(type: $type, filename: $filename, size: $size, isAsyncFile: $isAsyncFile, fileId: $fileId, fileMimetype: $fileMimetype, fileUrl: $fileUrl, fileHash: $fileHash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SmartappGetFileResponseModel &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.filename, filename) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality()
                .equals(other.isAsyncFile, isAsyncFile) &&
            const DeepCollectionEquality().equals(other.fileId, fileId) &&
            const DeepCollectionEquality()
                .equals(other.fileMimetype, fileMimetype) &&
            const DeepCollectionEquality().equals(other.fileUrl, fileUrl) &&
            const DeepCollectionEquality().equals(other.fileHash, fileHash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(filename),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(isAsyncFile),
      const DeepCollectionEquality().hash(fileId),
      const DeepCollectionEquality().hash(fileMimetype),
      const DeepCollectionEquality().hash(fileUrl),
      const DeepCollectionEquality().hash(fileHash));

  @JsonKey(ignore: true)
  @override
  _$$_SmartappGetFileResponseModelCopyWith<_$_SmartappGetFileResponseModel>
      get copyWith => __$$_SmartappGetFileResponseModelCopyWithImpl<
          _$_SmartappGetFileResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SmartappGetFileResponseModelToJson(this);
  }
}

abstract class _SmartappGetFileResponseModel
    implements SmartappGetFileResponseModel {
  const factory _SmartappGetFileResponseModel(
          {required final String type,
          required final String filename,
          required final String size,
          @JsonKey(name: 'is_async_file') final String? isAsyncFile,
          @JsonKey(name: '_file_id') final String? fileId,
          @JsonKey(name: '_file_mimetype') final String? fileMimetype,
          @JsonKey(name: '_file_url') final String? fileUrl,
          @JsonKey(name: '_file_hash') final String? fileHash}) =
      _$_SmartappGetFileResponseModel;

  factory _SmartappGetFileResponseModel.fromJson(Map<String, dynamic> json) =
      _$_SmartappGetFileResponseModel.fromJson;

  @override
  String get type => throw _privateConstructorUsedError;
  @override
  String get filename => throw _privateConstructorUsedError;
  @override
  String get size => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_async_file')
  String? get isAsyncFile => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: '_file_id')
  String? get fileId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: '_file_mimetype')
  String? get fileMimetype => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: '_file_url')
  String? get fileUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: '_file_hash')
  String? get fileHash => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SmartappGetFileResponseModelCopyWith<_$_SmartappGetFileResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
