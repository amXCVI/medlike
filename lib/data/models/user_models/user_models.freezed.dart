// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthTokenRequest _$AuthTokenRequestFromJson(Map<String, dynamic> json) {
  return _AuthTokenRequest.fromJson(json);
}

/// @nodoc
mixin _$AuthTokenRequest {
  String get phone => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthTokenRequestCopyWith<AuthTokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokenRequestCopyWith<$Res> {
  factory $AuthTokenRequestCopyWith(
          AuthTokenRequest value, $Res Function(AuthTokenRequest) then) =
      _$AuthTokenRequestCopyWithImpl<$Res>;
  $Res call({String phone, String password});
}

/// @nodoc
class _$AuthTokenRequestCopyWithImpl<$Res>
    implements $AuthTokenRequestCopyWith<$Res> {
  _$AuthTokenRequestCopyWithImpl(this._value, this._then);

  final AuthTokenRequest _value;
  // ignore: unused_field
  final $Res Function(AuthTokenRequest) _then;

  @override
  $Res call({
    Object? phone = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthTokenRequestCopyWith<$Res>
    implements $AuthTokenRequestCopyWith<$Res> {
  factory _$$_AuthTokenRequestCopyWith(
          _$_AuthTokenRequest value, $Res Function(_$_AuthTokenRequest) then) =
      __$$_AuthTokenRequestCopyWithImpl<$Res>;
  @override
  $Res call({String phone, String password});
}

/// @nodoc
class __$$_AuthTokenRequestCopyWithImpl<$Res>
    extends _$AuthTokenRequestCopyWithImpl<$Res>
    implements _$$_AuthTokenRequestCopyWith<$Res> {
  __$$_AuthTokenRequestCopyWithImpl(
      _$_AuthTokenRequest _value, $Res Function(_$_AuthTokenRequest) _then)
      : super(_value, (v) => _then(v as _$_AuthTokenRequest));

  @override
  _$_AuthTokenRequest get _value => super._value as _$_AuthTokenRequest;

  @override
  $Res call({
    Object? phone = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_AuthTokenRequest(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthTokenRequest implements _AuthTokenRequest {
  const _$_AuthTokenRequest({required this.phone, required this.password});

  factory _$_AuthTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$$_AuthTokenRequestFromJson(json);

  @override
  final String phone;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthTokenRequest(phone: $phone, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthTokenRequest &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_AuthTokenRequestCopyWith<_$_AuthTokenRequest> get copyWith =>
      __$$_AuthTokenRequestCopyWithImpl<_$_AuthTokenRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthTokenRequestToJson(this);
  }
}

abstract class _AuthTokenRequest implements AuthTokenRequest {
  const factory _AuthTokenRequest(
      {required final String phone,
      required final String password}) = _$_AuthTokenRequest;

  factory _AuthTokenRequest.fromJson(Map<String, dynamic> json) =
      _$_AuthTokenRequest.fromJson;

  @override
  String get phone => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthTokenRequestCopyWith<_$_AuthTokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthTokenResponse _$AuthTokenResponseFromJson(Map<String, dynamic> json) {
  return _AuthTokenResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthTokenResponse {
  String get token => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  int? get tryCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthTokenResponseCopyWith<AuthTokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokenResponseCopyWith<$Res> {
  factory $AuthTokenResponseCopyWith(
          AuthTokenResponse value, $Res Function(AuthTokenResponse) then) =
      _$AuthTokenResponseCopyWithImpl<$Res>;
  $Res call({String token, String refreshToken, int? tryCount});
}

/// @nodoc
class _$AuthTokenResponseCopyWithImpl<$Res>
    implements $AuthTokenResponseCopyWith<$Res> {
  _$AuthTokenResponseCopyWithImpl(this._value, this._then);

  final AuthTokenResponse _value;
  // ignore: unused_field
  final $Res Function(AuthTokenResponse) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? refreshToken = freezed,
    Object? tryCount = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tryCount: tryCount == freezed
          ? _value.tryCount
          : tryCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthTokenResponseCopyWith<$Res>
    implements $AuthTokenResponseCopyWith<$Res> {
  factory _$$_AuthTokenResponseCopyWith(_$_AuthTokenResponse value,
          $Res Function(_$_AuthTokenResponse) then) =
      __$$_AuthTokenResponseCopyWithImpl<$Res>;
  @override
  $Res call({String token, String refreshToken, int? tryCount});
}

/// @nodoc
class __$$_AuthTokenResponseCopyWithImpl<$Res>
    extends _$AuthTokenResponseCopyWithImpl<$Res>
    implements _$$_AuthTokenResponseCopyWith<$Res> {
  __$$_AuthTokenResponseCopyWithImpl(
      _$_AuthTokenResponse _value, $Res Function(_$_AuthTokenResponse) _then)
      : super(_value, (v) => _then(v as _$_AuthTokenResponse));

  @override
  _$_AuthTokenResponse get _value => super._value as _$_AuthTokenResponse;

  @override
  $Res call({
    Object? token = freezed,
    Object? refreshToken = freezed,
    Object? tryCount = freezed,
  }) {
    return _then(_$_AuthTokenResponse(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tryCount: tryCount == freezed
          ? _value.tryCount
          : tryCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthTokenResponse implements _AuthTokenResponse {
  const _$_AuthTokenResponse(
      {required this.token,
      required this.refreshToken,
      required this.tryCount});

  factory _$_AuthTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AuthTokenResponseFromJson(json);

  @override
  final String token;
  @override
  final String refreshToken;
  @override
  final int? tryCount;

  @override
  String toString() {
    return 'AuthTokenResponse(token: $token, refreshToken: $refreshToken, tryCount: $tryCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthTokenResponse &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken) &&
            const DeepCollectionEquality().equals(other.tryCount, tryCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(refreshToken),
      const DeepCollectionEquality().hash(tryCount));

  @JsonKey(ignore: true)
  @override
  _$$_AuthTokenResponseCopyWith<_$_AuthTokenResponse> get copyWith =>
      __$$_AuthTokenResponseCopyWithImpl<_$_AuthTokenResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthTokenResponseToJson(this);
  }
}

abstract class _AuthTokenResponse implements AuthTokenResponse {
  const factory _AuthTokenResponse(
      {required final String token,
      required final String refreshToken,
      required final int? tryCount}) = _$_AuthTokenResponse;

  factory _AuthTokenResponse.fromJson(Map<String, dynamic> json) =
      _$_AuthTokenResponse.fromJson;

  @override
  String get token => throw _privateConstructorUsedError;
  @override
  String get refreshToken => throw _privateConstructorUsedError;
  @override
  int? get tryCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthTokenResponseCopyWith<_$_AuthTokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthTokenResponseError _$AuthTokenResponseErrorFromJson(
    Map<String, dynamic> json) {
  return _AuthTokenResponseError.fromJson(json);
}

/// @nodoc
mixin _$AuthTokenResponseError {
  String get message => throw _privateConstructorUsedError;
  int get tryCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthTokenResponseErrorCopyWith<AuthTokenResponseError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokenResponseErrorCopyWith<$Res> {
  factory $AuthTokenResponseErrorCopyWith(AuthTokenResponseError value,
          $Res Function(AuthTokenResponseError) then) =
      _$AuthTokenResponseErrorCopyWithImpl<$Res>;
  $Res call({String message, int tryCount});
}

/// @nodoc
class _$AuthTokenResponseErrorCopyWithImpl<$Res>
    implements $AuthTokenResponseErrorCopyWith<$Res> {
  _$AuthTokenResponseErrorCopyWithImpl(this._value, this._then);

  final AuthTokenResponseError _value;
  // ignore: unused_field
  final $Res Function(AuthTokenResponseError) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? tryCount = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tryCount: tryCount == freezed
          ? _value.tryCount
          : tryCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthTokenResponseErrorCopyWith<$Res>
    implements $AuthTokenResponseErrorCopyWith<$Res> {
  factory _$$_AuthTokenResponseErrorCopyWith(_$_AuthTokenResponseError value,
          $Res Function(_$_AuthTokenResponseError) then) =
      __$$_AuthTokenResponseErrorCopyWithImpl<$Res>;
  @override
  $Res call({String message, int tryCount});
}

/// @nodoc
class __$$_AuthTokenResponseErrorCopyWithImpl<$Res>
    extends _$AuthTokenResponseErrorCopyWithImpl<$Res>
    implements _$$_AuthTokenResponseErrorCopyWith<$Res> {
  __$$_AuthTokenResponseErrorCopyWithImpl(_$_AuthTokenResponseError _value,
      $Res Function(_$_AuthTokenResponseError) _then)
      : super(_value, (v) => _then(v as _$_AuthTokenResponseError));

  @override
  _$_AuthTokenResponseError get _value =>
      super._value as _$_AuthTokenResponseError;

  @override
  $Res call({
    Object? message = freezed,
    Object? tryCount = freezed,
  }) {
    return _then(_$_AuthTokenResponseError(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tryCount: tryCount == freezed
          ? _value.tryCount
          : tryCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthTokenResponseError implements _AuthTokenResponseError {
  const _$_AuthTokenResponseError(
      {required this.message, required this.tryCount});

  factory _$_AuthTokenResponseError.fromJson(Map<String, dynamic> json) =>
      _$$_AuthTokenResponseErrorFromJson(json);

  @override
  final String message;
  @override
  final int tryCount;

  @override
  String toString() {
    return 'AuthTokenResponseError(message: $message, tryCount: $tryCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthTokenResponseError &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.tryCount, tryCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(tryCount));

  @JsonKey(ignore: true)
  @override
  _$$_AuthTokenResponseErrorCopyWith<_$_AuthTokenResponseError> get copyWith =>
      __$$_AuthTokenResponseErrorCopyWithImpl<_$_AuthTokenResponseError>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthTokenResponseErrorToJson(this);
  }
}

abstract class _AuthTokenResponseError implements AuthTokenResponseError {
  const factory _AuthTokenResponseError(
      {required final String message,
      required final int tryCount}) = _$_AuthTokenResponseError;

  factory _AuthTokenResponseError.fromJson(Map<String, dynamic> json) =
      _$_AuthTokenResponseError.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  int get tryCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthTokenResponseErrorCopyWith<_$_AuthTokenResponseError> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshTokenResponseModel _$RefreshTokenResponseModelFromJson(
    Map<String, dynamic> json) {
  return _RefreshTokenResponseModel.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenResponseModel {
  String get token => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefreshTokenResponseModelCopyWith<RefreshTokenResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenResponseModelCopyWith<$Res> {
  factory $RefreshTokenResponseModelCopyWith(RefreshTokenResponseModel value,
          $Res Function(RefreshTokenResponseModel) then) =
      _$RefreshTokenResponseModelCopyWithImpl<$Res>;
  $Res call({String token, String refreshToken});
}

/// @nodoc
class _$RefreshTokenResponseModelCopyWithImpl<$Res>
    implements $RefreshTokenResponseModelCopyWith<$Res> {
  _$RefreshTokenResponseModelCopyWithImpl(this._value, this._then);

  final RefreshTokenResponseModel _value;
  // ignore: unused_field
  final $Res Function(RefreshTokenResponseModel) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RefreshTokenResponseModelCopyWith<$Res>
    implements $RefreshTokenResponseModelCopyWith<$Res> {
  factory _$$_RefreshTokenResponseModelCopyWith(
          _$_RefreshTokenResponseModel value,
          $Res Function(_$_RefreshTokenResponseModel) then) =
      __$$_RefreshTokenResponseModelCopyWithImpl<$Res>;
  @override
  $Res call({String token, String refreshToken});
}

/// @nodoc
class __$$_RefreshTokenResponseModelCopyWithImpl<$Res>
    extends _$RefreshTokenResponseModelCopyWithImpl<$Res>
    implements _$$_RefreshTokenResponseModelCopyWith<$Res> {
  __$$_RefreshTokenResponseModelCopyWithImpl(
      _$_RefreshTokenResponseModel _value,
      $Res Function(_$_RefreshTokenResponseModel) _then)
      : super(_value, (v) => _then(v as _$_RefreshTokenResponseModel));

  @override
  _$_RefreshTokenResponseModel get _value =>
      super._value as _$_RefreshTokenResponseModel;

  @override
  $Res call({
    Object? token = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_$_RefreshTokenResponseModel(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RefreshTokenResponseModel implements _RefreshTokenResponseModel {
  const _$_RefreshTokenResponseModel(
      {required this.token, required this.refreshToken});

  factory _$_RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_RefreshTokenResponseModelFromJson(json);

  @override
  final String token;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'RefreshTokenResponseModel(token: $token, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RefreshTokenResponseModel &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(refreshToken));

  @JsonKey(ignore: true)
  @override
  _$$_RefreshTokenResponseModelCopyWith<_$_RefreshTokenResponseModel>
      get copyWith => __$$_RefreshTokenResponseModelCopyWithImpl<
          _$_RefreshTokenResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RefreshTokenResponseModelToJson(this);
  }
}

abstract class _RefreshTokenResponseModel implements RefreshTokenResponseModel {
  const factory _RefreshTokenResponseModel(
      {required final String token,
      required final String refreshToken}) = _$_RefreshTokenResponseModel;

  factory _RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =
      _$_RefreshTokenResponseModel.fromJson;

  @override
  String get token => throw _privateConstructorUsedError;
  @override
  String get refreshToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RefreshTokenResponseModelCopyWith<_$_RefreshTokenResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

UserProfileClinicBuilding _$UserProfileClinicBuildingFromJson(
    Map<String, dynamic> json) {
  return _UserProfileClinicBuilding.fromJson(json);
}

/// @nodoc
mixin _$UserProfileClinicBuilding {
  String get id => throw _privateConstructorUsedError;
  List<String> get category => throw _privateConstructorUsedError;
  bool? get telemed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileClinicBuildingCopyWith<UserProfileClinicBuilding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileClinicBuildingCopyWith<$Res> {
  factory $UserProfileClinicBuildingCopyWith(UserProfileClinicBuilding value,
          $Res Function(UserProfileClinicBuilding) then) =
      _$UserProfileClinicBuildingCopyWithImpl<$Res>;
  $Res call({String id, List<String> category, bool? telemed});
}

/// @nodoc
class _$UserProfileClinicBuildingCopyWithImpl<$Res>
    implements $UserProfileClinicBuildingCopyWith<$Res> {
  _$UserProfileClinicBuildingCopyWithImpl(this._value, this._then);

  final UserProfileClinicBuilding _value;
  // ignore: unused_field
  final $Res Function(UserProfileClinicBuilding) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? category = freezed,
    Object? telemed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
      telemed: telemed == freezed
          ? _value.telemed
          : telemed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserProfileClinicBuildingCopyWith<$Res>
    implements $UserProfileClinicBuildingCopyWith<$Res> {
  factory _$$_UserProfileClinicBuildingCopyWith(
          _$_UserProfileClinicBuilding value,
          $Res Function(_$_UserProfileClinicBuilding) then) =
      __$$_UserProfileClinicBuildingCopyWithImpl<$Res>;
  @override
  $Res call({String id, List<String> category, bool? telemed});
}

/// @nodoc
class __$$_UserProfileClinicBuildingCopyWithImpl<$Res>
    extends _$UserProfileClinicBuildingCopyWithImpl<$Res>
    implements _$$_UserProfileClinicBuildingCopyWith<$Res> {
  __$$_UserProfileClinicBuildingCopyWithImpl(
      _$_UserProfileClinicBuilding _value,
      $Res Function(_$_UserProfileClinicBuilding) _then)
      : super(_value, (v) => _then(v as _$_UserProfileClinicBuilding));

  @override
  _$_UserProfileClinicBuilding get _value =>
      super._value as _$_UserProfileClinicBuilding;

  @override
  $Res call({
    Object? id = freezed,
    Object? category = freezed,
    Object? telemed = freezed,
  }) {
    return _then(_$_UserProfileClinicBuilding(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
      telemed: telemed == freezed
          ? _value.telemed
          : telemed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfileClinicBuilding implements _UserProfileClinicBuilding {
  const _$_UserProfileClinicBuilding(
      {required this.id, required final List<String> category, this.telemed})
      : _category = category;

  factory _$_UserProfileClinicBuilding.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileClinicBuildingFromJson(json);

  @override
  final String id;
  final List<String> _category;
  @override
  List<String> get category {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_category);
  }

  @override
  final bool? telemed;

  @override
  String toString() {
    return 'UserProfileClinicBuilding(id: $id, category: $category, telemed: $telemed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfileClinicBuilding &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            const DeepCollectionEquality().equals(other.telemed, telemed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(_category),
      const DeepCollectionEquality().hash(telemed));

  @JsonKey(ignore: true)
  @override
  _$$_UserProfileClinicBuildingCopyWith<_$_UserProfileClinicBuilding>
      get copyWith => __$$_UserProfileClinicBuildingCopyWithImpl<
          _$_UserProfileClinicBuilding>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileClinicBuildingToJson(this);
  }
}

abstract class _UserProfileClinicBuilding implements UserProfileClinicBuilding {
  const factory _UserProfileClinicBuilding(
      {required final String id,
      required final List<String> category,
      final bool? telemed}) = _$_UserProfileClinicBuilding;

  factory _UserProfileClinicBuilding.fromJson(Map<String, dynamic> json) =
      _$_UserProfileClinicBuilding.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  List<String> get category => throw _privateConstructorUsedError;
  @override
  bool? get telemed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileClinicBuildingCopyWith<_$_UserProfileClinicBuilding>
      get copyWith => throw _privateConstructorUsedError;
}

UserProfileClinic _$UserProfileClinicFromJson(Map<String, dynamic> json) {
  return _UserProfileClinic.fromJson(json);
}

/// @nodoc
mixin _$UserProfileClinic {
  String? get id => throw _privateConstructorUsedError;
  int? get timeZoneOffset => throw _privateConstructorUsedError;
  List<UserProfileClinicBuilding>? get buildings =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileClinicCopyWith<UserProfileClinic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileClinicCopyWith<$Res> {
  factory $UserProfileClinicCopyWith(
          UserProfileClinic value, $Res Function(UserProfileClinic) then) =
      _$UserProfileClinicCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      int? timeZoneOffset,
      List<UserProfileClinicBuilding>? buildings});
}

/// @nodoc
class _$UserProfileClinicCopyWithImpl<$Res>
    implements $UserProfileClinicCopyWith<$Res> {
  _$UserProfileClinicCopyWithImpl(this._value, this._then);

  final UserProfileClinic _value;
  // ignore: unused_field
  final $Res Function(UserProfileClinic) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? timeZoneOffset = freezed,
    Object? buildings = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      timeZoneOffset: timeZoneOffset == freezed
          ? _value.timeZoneOffset
          : timeZoneOffset // ignore: cast_nullable_to_non_nullable
              as int?,
      buildings: buildings == freezed
          ? _value.buildings
          : buildings // ignore: cast_nullable_to_non_nullable
              as List<UserProfileClinicBuilding>?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserProfileClinicCopyWith<$Res>
    implements $UserProfileClinicCopyWith<$Res> {
  factory _$$_UserProfileClinicCopyWith(_$_UserProfileClinic value,
          $Res Function(_$_UserProfileClinic) then) =
      __$$_UserProfileClinicCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      int? timeZoneOffset,
      List<UserProfileClinicBuilding>? buildings});
}

/// @nodoc
class __$$_UserProfileClinicCopyWithImpl<$Res>
    extends _$UserProfileClinicCopyWithImpl<$Res>
    implements _$$_UserProfileClinicCopyWith<$Res> {
  __$$_UserProfileClinicCopyWithImpl(
      _$_UserProfileClinic _value, $Res Function(_$_UserProfileClinic) _then)
      : super(_value, (v) => _then(v as _$_UserProfileClinic));

  @override
  _$_UserProfileClinic get _value => super._value as _$_UserProfileClinic;

  @override
  $Res call({
    Object? id = freezed,
    Object? timeZoneOffset = freezed,
    Object? buildings = freezed,
  }) {
    return _then(_$_UserProfileClinic(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      timeZoneOffset: timeZoneOffset == freezed
          ? _value.timeZoneOffset
          : timeZoneOffset // ignore: cast_nullable_to_non_nullable
              as int?,
      buildings: buildings == freezed
          ? _value._buildings
          : buildings // ignore: cast_nullable_to_non_nullable
              as List<UserProfileClinicBuilding>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfileClinic implements _UserProfileClinic {
  const _$_UserProfileClinic(
      {this.id,
      this.timeZoneOffset,
      final List<UserProfileClinicBuilding>? buildings})
      : _buildings = buildings;

  factory _$_UserProfileClinic.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileClinicFromJson(json);

  @override
  final String? id;
  @override
  final int? timeZoneOffset;
  final List<UserProfileClinicBuilding>? _buildings;
  @override
  List<UserProfileClinicBuilding>? get buildings {
    final value = _buildings;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserProfileClinic(id: $id, timeZoneOffset: $timeZoneOffset, buildings: $buildings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfileClinic &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.timeZoneOffset, timeZoneOffset) &&
            const DeepCollectionEquality()
                .equals(other._buildings, _buildings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(timeZoneOffset),
      const DeepCollectionEquality().hash(_buildings));

  @JsonKey(ignore: true)
  @override
  _$$_UserProfileClinicCopyWith<_$_UserProfileClinic> get copyWith =>
      __$$_UserProfileClinicCopyWithImpl<_$_UserProfileClinic>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileClinicToJson(this);
  }
}

abstract class _UserProfileClinic implements UserProfileClinic {
  const factory _UserProfileClinic(
      {final String? id,
      final int? timeZoneOffset,
      final List<UserProfileClinicBuilding>? buildings}) = _$_UserProfileClinic;

  factory _UserProfileClinic.fromJson(Map<String, dynamic> json) =
      _$_UserProfileClinic.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  int? get timeZoneOffset => throw _privateConstructorUsedError;
  @override
  List<UserProfileClinicBuilding>? get buildings =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileClinicCopyWith<_$_UserProfileClinic> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String get id => throw _privateConstructorUsedError;
  String? get barCode => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  DateTime? get birthday => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  List<UserProfileClinic> get clinics => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? barCode,
      String? firstName,
      String? middleName,
      String? lastName,
      DateTime? birthday,
      String? avatar,
      List<UserProfileClinic> clinics});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res> implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  final UserProfile _value;
  // ignore: unused_field
  final $Res Function(UserProfile) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? barCode = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? birthday = freezed,
    Object? avatar = freezed,
    Object? clinics = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      barCode: barCode == freezed
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: middleName == freezed
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: birthday == freezed
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      clinics: clinics == freezed
          ? _value.clinics
          : clinics // ignore: cast_nullable_to_non_nullable
              as List<UserProfileClinic>,
    ));
  }
}

/// @nodoc
abstract class _$$_UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$_UserProfileCopyWith(
          _$_UserProfile value, $Res Function(_$_UserProfile) then) =
      __$$_UserProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? barCode,
      String? firstName,
      String? middleName,
      String? lastName,
      DateTime? birthday,
      String? avatar,
      List<UserProfileClinic> clinics});
}

/// @nodoc
class __$$_UserProfileCopyWithImpl<$Res> extends _$UserProfileCopyWithImpl<$Res>
    implements _$$_UserProfileCopyWith<$Res> {
  __$$_UserProfileCopyWithImpl(
      _$_UserProfile _value, $Res Function(_$_UserProfile) _then)
      : super(_value, (v) => _then(v as _$_UserProfile));

  @override
  _$_UserProfile get _value => super._value as _$_UserProfile;

  @override
  $Res call({
    Object? id = freezed,
    Object? barCode = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? birthday = freezed,
    Object? avatar = freezed,
    Object? clinics = freezed,
  }) {
    return _then(_$_UserProfile(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      barCode: barCode == freezed
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: middleName == freezed
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: birthday == freezed
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      clinics: clinics == freezed
          ? _value._clinics
          : clinics // ignore: cast_nullable_to_non_nullable
              as List<UserProfileClinic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfile implements _UserProfile {
  const _$_UserProfile(
      {required this.id,
      this.barCode,
      this.firstName,
      this.middleName,
      this.lastName,
      this.birthday,
      this.avatar,
      required final List<UserProfileClinic> clinics})
      : _clinics = clinics;

  factory _$_UserProfile.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileFromJson(json);

  @override
  final String id;
  @override
  final String? barCode;
  @override
  final String? firstName;
  @override
  final String? middleName;
  @override
  final String? lastName;
  @override
  final DateTime? birthday;
  @override
  final String? avatar;
  final List<UserProfileClinic> _clinics;
  @override
  List<UserProfileClinic> get clinics {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clinics);
  }

  @override
  String toString() {
    return 'UserProfile(id: $id, barCode: $barCode, firstName: $firstName, middleName: $middleName, lastName: $lastName, birthday: $birthday, avatar: $avatar, clinics: $clinics)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfile &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.barCode, barCode) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality()
                .equals(other.middleName, middleName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.birthday, birthday) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other._clinics, _clinics));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(barCode),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(middleName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(birthday),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(_clinics));

  @JsonKey(ignore: true)
  @override
  _$$_UserProfileCopyWith<_$_UserProfile> get copyWith =>
      __$$_UserProfileCopyWithImpl<_$_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileToJson(this);
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {required final String id,
      final String? barCode,
      final String? firstName,
      final String? middleName,
      final String? lastName,
      final DateTime? birthday,
      final String? avatar,
      required final List<UserProfileClinic> clinics}) = _$_UserProfile;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$_UserProfile.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String? get barCode => throw _privateConstructorUsedError;
  @override
  String? get firstName => throw _privateConstructorUsedError;
  @override
  String? get middleName => throw _privateConstructorUsedError;
  @override
  String? get lastName => throw _privateConstructorUsedError;
  @override
  DateTime? get birthday => throw _privateConstructorUsedError;
  @override
  String? get avatar => throw _privateConstructorUsedError;
  @override
  List<UserProfileClinic> get clinics => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileCopyWith<_$_UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfilesList _$UserProfilesListFromJson(Map<String, dynamic> json) {
  return _UserProfilesList.fromJson(json);
}

/// @nodoc
mixin _$UserProfilesList {
  List<UserProfile> get userProfilesList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfilesListCopyWith<UserProfilesList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfilesListCopyWith<$Res> {
  factory $UserProfilesListCopyWith(
          UserProfilesList value, $Res Function(UserProfilesList) then) =
      _$UserProfilesListCopyWithImpl<$Res>;
  $Res call({List<UserProfile> userProfilesList});
}

/// @nodoc
class _$UserProfilesListCopyWithImpl<$Res>
    implements $UserProfilesListCopyWith<$Res> {
  _$UserProfilesListCopyWithImpl(this._value, this._then);

  final UserProfilesList _value;
  // ignore: unused_field
  final $Res Function(UserProfilesList) _then;

  @override
  $Res call({
    Object? userProfilesList = freezed,
  }) {
    return _then(_value.copyWith(
      userProfilesList: userProfilesList == freezed
          ? _value.userProfilesList
          : userProfilesList // ignore: cast_nullable_to_non_nullable
              as List<UserProfile>,
    ));
  }
}

/// @nodoc
abstract class _$$_UserProfilesListCopyWith<$Res>
    implements $UserProfilesListCopyWith<$Res> {
  factory _$$_UserProfilesListCopyWith(
          _$_UserProfilesList value, $Res Function(_$_UserProfilesList) then) =
      __$$_UserProfilesListCopyWithImpl<$Res>;
  @override
  $Res call({List<UserProfile> userProfilesList});
}

/// @nodoc
class __$$_UserProfilesListCopyWithImpl<$Res>
    extends _$UserProfilesListCopyWithImpl<$Res>
    implements _$$_UserProfilesListCopyWith<$Res> {
  __$$_UserProfilesListCopyWithImpl(
      _$_UserProfilesList _value, $Res Function(_$_UserProfilesList) _then)
      : super(_value, (v) => _then(v as _$_UserProfilesList));

  @override
  _$_UserProfilesList get _value => super._value as _$_UserProfilesList;

  @override
  $Res call({
    Object? userProfilesList = freezed,
  }) {
    return _then(_$_UserProfilesList(
      userProfilesList: userProfilesList == freezed
          ? _value._userProfilesList
          : userProfilesList // ignore: cast_nullable_to_non_nullable
              as List<UserProfile>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfilesList implements _UserProfilesList {
  const _$_UserProfilesList({required final List<UserProfile> userProfilesList})
      : _userProfilesList = userProfilesList;

  factory _$_UserProfilesList.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfilesListFromJson(json);

  final List<UserProfile> _userProfilesList;
  @override
  List<UserProfile> get userProfilesList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userProfilesList);
  }

  @override
  String toString() {
    return 'UserProfilesList(userProfilesList: $userProfilesList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfilesList &&
            const DeepCollectionEquality()
                .equals(other._userProfilesList, _userProfilesList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_userProfilesList));

  @JsonKey(ignore: true)
  @override
  _$$_UserProfilesListCopyWith<_$_UserProfilesList> get copyWith =>
      __$$_UserProfilesListCopyWithImpl<_$_UserProfilesList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfilesListToJson(this);
  }
}

abstract class _UserProfilesList implements UserProfilesList {
  const factory _UserProfilesList(
          {required final List<UserProfile> userProfilesList}) =
      _$_UserProfilesList;

  factory _UserProfilesList.fromJson(Map<String, dynamic> json) =
      _$_UserProfilesList.fromJson;

  @override
  List<UserProfile> get userProfilesList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfilesListCopyWith<_$_UserProfilesList> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckUserAccountResponse _$CheckUserAccountResponseFromJson(
    Map<String, dynamic> json) {
  return _CheckUserAccountResponse.fromJson(json);
}

/// @nodoc
mixin _$CheckUserAccountResponse {
  bool? get found => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckUserAccountResponseCopyWith<CheckUserAccountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckUserAccountResponseCopyWith<$Res> {
  factory $CheckUserAccountResponseCopyWith(CheckUserAccountResponse value,
          $Res Function(CheckUserAccountResponse) then) =
      _$CheckUserAccountResponseCopyWithImpl<$Res>;
  $Res call({bool? found, String? message});
}

/// @nodoc
class _$CheckUserAccountResponseCopyWithImpl<$Res>
    implements $CheckUserAccountResponseCopyWith<$Res> {
  _$CheckUserAccountResponseCopyWithImpl(this._value, this._then);

  final CheckUserAccountResponse _value;
  // ignore: unused_field
  final $Res Function(CheckUserAccountResponse) _then;

  @override
  $Res call({
    Object? found = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      found: found == freezed
          ? _value.found
          : found // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_CheckUserAccountResponseCopyWith<$Res>
    implements $CheckUserAccountResponseCopyWith<$Res> {
  factory _$$_CheckUserAccountResponseCopyWith(
          _$_CheckUserAccountResponse value,
          $Res Function(_$_CheckUserAccountResponse) then) =
      __$$_CheckUserAccountResponseCopyWithImpl<$Res>;
  @override
  $Res call({bool? found, String? message});
}

/// @nodoc
class __$$_CheckUserAccountResponseCopyWithImpl<$Res>
    extends _$CheckUserAccountResponseCopyWithImpl<$Res>
    implements _$$_CheckUserAccountResponseCopyWith<$Res> {
  __$$_CheckUserAccountResponseCopyWithImpl(_$_CheckUserAccountResponse _value,
      $Res Function(_$_CheckUserAccountResponse) _then)
      : super(_value, (v) => _then(v as _$_CheckUserAccountResponse));

  @override
  _$_CheckUserAccountResponse get _value =>
      super._value as _$_CheckUserAccountResponse;

  @override
  $Res call({
    Object? found = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_CheckUserAccountResponse(
      found: found == freezed
          ? _value.found
          : found // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckUserAccountResponse implements _CheckUserAccountResponse {
  const _$_CheckUserAccountResponse(
      {required this.found, required this.message});

  factory _$_CheckUserAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CheckUserAccountResponseFromJson(json);

  @override
  final bool? found;
  @override
  final String? message;

  @override
  String toString() {
    return 'CheckUserAccountResponse(found: $found, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckUserAccountResponse &&
            const DeepCollectionEquality().equals(other.found, found) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(found),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_CheckUserAccountResponseCopyWith<_$_CheckUserAccountResponse>
      get copyWith => __$$_CheckUserAccountResponseCopyWithImpl<
          _$_CheckUserAccountResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckUserAccountResponseToJson(this);
  }
}

abstract class _CheckUserAccountResponse implements CheckUserAccountResponse {
  const factory _CheckUserAccountResponse(
      {required final bool? found,
      required final String? message}) = _$_CheckUserAccountResponse;

  factory _CheckUserAccountResponse.fromJson(Map<String, dynamic> json) =
      _$_CheckUserAccountResponse.fromJson;

  @override
  bool? get found => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CheckUserAccountResponseCopyWith<_$_CheckUserAccountResponse>
      get copyWith => throw _privateConstructorUsedError;
}

UserAgreementsModel _$UserAgreementsModelFromJson(Map<String, dynamic> json) {
  return _UserAgreementsModel.fromJson(json);
}

/// @nodoc
mixin _$UserAgreementsModel {
  int get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  bool get accepted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAgreementsModelCopyWith<UserAgreementsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAgreementsModelCopyWith<$Res> {
  factory $UserAgreementsModelCopyWith(
          UserAgreementsModel value, $Res Function(UserAgreementsModel) then) =
      _$UserAgreementsModelCopyWithImpl<$Res>;
  $Res call({int id, String type, int version, bool accepted});
}

/// @nodoc
class _$UserAgreementsModelCopyWithImpl<$Res>
    implements $UserAgreementsModelCopyWith<$Res> {
  _$UserAgreementsModelCopyWithImpl(this._value, this._then);

  final UserAgreementsModel _value;
  // ignore: unused_field
  final $Res Function(UserAgreementsModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? version = freezed,
    Object? accepted = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      accepted: accepted == freezed
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_UserAgreementsModelCopyWith<$Res>
    implements $UserAgreementsModelCopyWith<$Res> {
  factory _$$_UserAgreementsModelCopyWith(_$_UserAgreementsModel value,
          $Res Function(_$_UserAgreementsModel) then) =
      __$$_UserAgreementsModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String type, int version, bool accepted});
}

/// @nodoc
class __$$_UserAgreementsModelCopyWithImpl<$Res>
    extends _$UserAgreementsModelCopyWithImpl<$Res>
    implements _$$_UserAgreementsModelCopyWith<$Res> {
  __$$_UserAgreementsModelCopyWithImpl(_$_UserAgreementsModel _value,
      $Res Function(_$_UserAgreementsModel) _then)
      : super(_value, (v) => _then(v as _$_UserAgreementsModel));

  @override
  _$_UserAgreementsModel get _value => super._value as _$_UserAgreementsModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? version = freezed,
    Object? accepted = freezed,
  }) {
    return _then(_$_UserAgreementsModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      accepted: accepted == freezed
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAgreementsModel implements _UserAgreementsModel {
  const _$_UserAgreementsModel(
      {required this.id,
      required this.type,
      required this.version,
      required this.accepted});

  factory _$_UserAgreementsModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserAgreementsModelFromJson(json);

  @override
  final int id;
  @override
  final String type;
  @override
  final int version;
  @override
  final bool accepted;

  @override
  String toString() {
    return 'UserAgreementsModel(id: $id, type: $type, version: $version, accepted: $accepted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAgreementsModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other.accepted, accepted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(accepted));

  @JsonKey(ignore: true)
  @override
  _$$_UserAgreementsModelCopyWith<_$_UserAgreementsModel> get copyWith =>
      __$$_UserAgreementsModelCopyWithImpl<_$_UserAgreementsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAgreementsModelToJson(this);
  }
}

abstract class _UserAgreementsModel implements UserAgreementsModel {
  const factory _UserAgreementsModel(
      {required final int id,
      required final String type,
      required final int version,
      required final bool accepted}) = _$_UserAgreementsModel;

  factory _UserAgreementsModel.fromJson(Map<String, dynamic> json) =
      _$_UserAgreementsModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  int get version => throw _privateConstructorUsedError;
  @override
  bool get accepted => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserAgreementsModelCopyWith<_$_UserAgreementsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

UserAgreementDocumentModel _$UserAgreementDocumentModelFromJson(
    Map<String, dynamic> json) {
  return _UserAgreementDocumentModel.fromJson(json);
}

/// @nodoc
mixin _$UserAgreementDocumentModel {
  String get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAgreementDocumentModelCopyWith<UserAgreementDocumentModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAgreementDocumentModelCopyWith<$Res> {
  factory $UserAgreementDocumentModelCopyWith(UserAgreementDocumentModel value,
          $Res Function(UserAgreementDocumentModel) then) =
      _$UserAgreementDocumentModelCopyWithImpl<$Res>;
  $Res call({String body});
}

/// @nodoc
class _$UserAgreementDocumentModelCopyWithImpl<$Res>
    implements $UserAgreementDocumentModelCopyWith<$Res> {
  _$UserAgreementDocumentModelCopyWithImpl(this._value, this._then);

  final UserAgreementDocumentModel _value;
  // ignore: unused_field
  final $Res Function(UserAgreementDocumentModel) _then;

  @override
  $Res call({
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserAgreementDocumentModelCopyWith<$Res>
    implements $UserAgreementDocumentModelCopyWith<$Res> {
  factory _$$_UserAgreementDocumentModelCopyWith(
          _$_UserAgreementDocumentModel value,
          $Res Function(_$_UserAgreementDocumentModel) then) =
      __$$_UserAgreementDocumentModelCopyWithImpl<$Res>;
  @override
  $Res call({String body});
}

/// @nodoc
class __$$_UserAgreementDocumentModelCopyWithImpl<$Res>
    extends _$UserAgreementDocumentModelCopyWithImpl<$Res>
    implements _$$_UserAgreementDocumentModelCopyWith<$Res> {
  __$$_UserAgreementDocumentModelCopyWithImpl(
      _$_UserAgreementDocumentModel _value,
      $Res Function(_$_UserAgreementDocumentModel) _then)
      : super(_value, (v) => _then(v as _$_UserAgreementDocumentModel));

  @override
  _$_UserAgreementDocumentModel get _value =>
      super._value as _$_UserAgreementDocumentModel;

  @override
  $Res call({
    Object? body = freezed,
  }) {
    return _then(_$_UserAgreementDocumentModel(
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAgreementDocumentModel implements _UserAgreementDocumentModel {
  const _$_UserAgreementDocumentModel({required this.body});

  factory _$_UserAgreementDocumentModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserAgreementDocumentModelFromJson(json);

  @override
  final String body;

  @override
  String toString() {
    return 'UserAgreementDocumentModel(body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAgreementDocumentModel &&
            const DeepCollectionEquality().equals(other.body, body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(body));

  @JsonKey(ignore: true)
  @override
  _$$_UserAgreementDocumentModelCopyWith<_$_UserAgreementDocumentModel>
      get copyWith => __$$_UserAgreementDocumentModelCopyWithImpl<
          _$_UserAgreementDocumentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAgreementDocumentModelToJson(this);
  }
}

abstract class _UserAgreementDocumentModel
    implements UserAgreementDocumentModel {
  const factory _UserAgreementDocumentModel({required final String body}) =
      _$_UserAgreementDocumentModel;

  factory _UserAgreementDocumentModel.fromJson(Map<String, dynamic> json) =
      _$_UserAgreementDocumentModel.fromJson;

  @override
  String get body => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserAgreementDocumentModelCopyWith<_$_UserAgreementDocumentModel>
      get copyWith => throw _privateConstructorUsedError;
}

UserUploadAvatarResponseModel _$UserUploadAvatarResponseModelFromJson(
    Map<String, dynamic> json) {
  return _UserUploadAvatarResponseModel.fromJson(json);
}

/// @nodoc
mixin _$UserUploadAvatarResponseModel {
  String get result => throw _privateConstructorUsedError;
  String? get information => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserUploadAvatarResponseModelCopyWith<UserUploadAvatarResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserUploadAvatarResponseModelCopyWith<$Res> {
  factory $UserUploadAvatarResponseModelCopyWith(
          UserUploadAvatarResponseModel value,
          $Res Function(UserUploadAvatarResponseModel) then) =
      _$UserUploadAvatarResponseModelCopyWithImpl<$Res>;
  $Res call({String result, String? information});
}

/// @nodoc
class _$UserUploadAvatarResponseModelCopyWithImpl<$Res>
    implements $UserUploadAvatarResponseModelCopyWith<$Res> {
  _$UserUploadAvatarResponseModelCopyWithImpl(this._value, this._then);

  final UserUploadAvatarResponseModel _value;
  // ignore: unused_field
  final $Res Function(UserUploadAvatarResponseModel) _then;

  @override
  $Res call({
    Object? result = freezed,
    Object? information = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      information: information == freezed
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserUploadAvatarResponseModelCopyWith<$Res>
    implements $UserUploadAvatarResponseModelCopyWith<$Res> {
  factory _$$_UserUploadAvatarResponseModelCopyWith(
          _$_UserUploadAvatarResponseModel value,
          $Res Function(_$_UserUploadAvatarResponseModel) then) =
      __$$_UserUploadAvatarResponseModelCopyWithImpl<$Res>;
  @override
  $Res call({String result, String? information});
}

/// @nodoc
class __$$_UserUploadAvatarResponseModelCopyWithImpl<$Res>
    extends _$UserUploadAvatarResponseModelCopyWithImpl<$Res>
    implements _$$_UserUploadAvatarResponseModelCopyWith<$Res> {
  __$$_UserUploadAvatarResponseModelCopyWithImpl(
      _$_UserUploadAvatarResponseModel _value,
      $Res Function(_$_UserUploadAvatarResponseModel) _then)
      : super(_value, (v) => _then(v as _$_UserUploadAvatarResponseModel));

  @override
  _$_UserUploadAvatarResponseModel get _value =>
      super._value as _$_UserUploadAvatarResponseModel;

  @override
  $Res call({
    Object? result = freezed,
    Object? information = freezed,
  }) {
    return _then(_$_UserUploadAvatarResponseModel(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      information: information == freezed
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserUploadAvatarResponseModel
    implements _UserUploadAvatarResponseModel {
  const _$_UserUploadAvatarResponseModel(
      {required this.result, required this.information});

  factory _$_UserUploadAvatarResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_UserUploadAvatarResponseModelFromJson(json);

  @override
  final String result;
  @override
  final String? information;

  @override
  String toString() {
    return 'UserUploadAvatarResponseModel(result: $result, information: $information)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserUploadAvatarResponseModel &&
            const DeepCollectionEquality().equals(other.result, result) &&
            const DeepCollectionEquality()
                .equals(other.information, information));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(result),
      const DeepCollectionEquality().hash(information));

  @JsonKey(ignore: true)
  @override
  _$$_UserUploadAvatarResponseModelCopyWith<_$_UserUploadAvatarResponseModel>
      get copyWith => __$$_UserUploadAvatarResponseModelCopyWithImpl<
          _$_UserUploadAvatarResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserUploadAvatarResponseModelToJson(this);
  }
}

abstract class _UserUploadAvatarResponseModel
    implements UserUploadAvatarResponseModel {
  const factory _UserUploadAvatarResponseModel(
      {required final String result,
      required final String? information}) = _$_UserUploadAvatarResponseModel;

  factory _UserUploadAvatarResponseModel.fromJson(Map<String, dynamic> json) =
      _$_UserUploadAvatarResponseModel.fromJson;

  @override
  String get result => throw _privateConstructorUsedError;
  @override
  String? get information => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserUploadAvatarResponseModelCopyWith<_$_UserUploadAvatarResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

UserAgreementItemModel _$UserAgreementItemModelFromJson(
    Map<String, dynamic> json) {
  return _UserAgreementItemModel.fromJson(json);
}

/// @nodoc
mixin _$UserAgreementItemModel {
  int get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  bool get accepted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAgreementItemModelCopyWith<UserAgreementItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAgreementItemModelCopyWith<$Res> {
  factory $UserAgreementItemModelCopyWith(UserAgreementItemModel value,
          $Res Function(UserAgreementItemModel) then) =
      _$UserAgreementItemModelCopyWithImpl<$Res>;
  $Res call({int id, String type, int version, bool accepted});
}

/// @nodoc
class _$UserAgreementItemModelCopyWithImpl<$Res>
    implements $UserAgreementItemModelCopyWith<$Res> {
  _$UserAgreementItemModelCopyWithImpl(this._value, this._then);

  final UserAgreementItemModel _value;
  // ignore: unused_field
  final $Res Function(UserAgreementItemModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? version = freezed,
    Object? accepted = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      accepted: accepted == freezed
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_UserAgreementItemModelCopyWith<$Res>
    implements $UserAgreementItemModelCopyWith<$Res> {
  factory _$$_UserAgreementItemModelCopyWith(_$_UserAgreementItemModel value,
          $Res Function(_$_UserAgreementItemModel) then) =
      __$$_UserAgreementItemModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String type, int version, bool accepted});
}

/// @nodoc
class __$$_UserAgreementItemModelCopyWithImpl<$Res>
    extends _$UserAgreementItemModelCopyWithImpl<$Res>
    implements _$$_UserAgreementItemModelCopyWith<$Res> {
  __$$_UserAgreementItemModelCopyWithImpl(_$_UserAgreementItemModel _value,
      $Res Function(_$_UserAgreementItemModel) _then)
      : super(_value, (v) => _then(v as _$_UserAgreementItemModel));

  @override
  _$_UserAgreementItemModel get _value =>
      super._value as _$_UserAgreementItemModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? version = freezed,
    Object? accepted = freezed,
  }) {
    return _then(_$_UserAgreementItemModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      accepted: accepted == freezed
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAgreementItemModel implements _UserAgreementItemModel {
  const _$_UserAgreementItemModel(
      {required this.id,
      required this.type,
      required this.version,
      required this.accepted});

  factory _$_UserAgreementItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserAgreementItemModelFromJson(json);

  @override
  final int id;
  @override
  final String type;
  @override
  final int version;
  @override
  final bool accepted;

  @override
  String toString() {
    return 'UserAgreementItemModel(id: $id, type: $type, version: $version, accepted: $accepted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAgreementItemModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other.accepted, accepted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(accepted));

  @JsonKey(ignore: true)
  @override
  _$$_UserAgreementItemModelCopyWith<_$_UserAgreementItemModel> get copyWith =>
      __$$_UserAgreementItemModelCopyWithImpl<_$_UserAgreementItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAgreementItemModelToJson(this);
  }
}

abstract class _UserAgreementItemModel implements UserAgreementItemModel {
  const factory _UserAgreementItemModel(
      {required final int id,
      required final String type,
      required final int version,
      required final bool accepted}) = _$_UserAgreementItemModel;

  factory _UserAgreementItemModel.fromJson(Map<String, dynamic> json) =
      _$_UserAgreementItemModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  int get version => throw _privateConstructorUsedError;
  @override
  bool get accepted => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserAgreementItemModelCopyWith<_$_UserAgreementItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

EsiaTokenAuthRequest _$EsiaTokenAuthRequestFromJson(Map<String, dynamic> json) {
  return _EsiaTokenAuthRequest.fromJson(json);
}

/// @nodoc
mixin _$EsiaTokenAuthRequest {
  bool get isUserExists => throw _privateConstructorUsedError;
  EsiaTokenAuthSigninModelRequest? get signinModel =>
      throw _privateConstructorUsedError;
  EsiaTokenAuthRegistrationModelRequest? get registrationModel =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EsiaTokenAuthRequestCopyWith<EsiaTokenAuthRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EsiaTokenAuthRequestCopyWith<$Res> {
  factory $EsiaTokenAuthRequestCopyWith(EsiaTokenAuthRequest value,
          $Res Function(EsiaTokenAuthRequest) then) =
      _$EsiaTokenAuthRequestCopyWithImpl<$Res>;
  $Res call(
      {bool isUserExists,
      EsiaTokenAuthSigninModelRequest? signinModel,
      EsiaTokenAuthRegistrationModelRequest? registrationModel});

  $EsiaTokenAuthSigninModelRequestCopyWith<$Res>? get signinModel;
  $EsiaTokenAuthRegistrationModelRequestCopyWith<$Res>? get registrationModel;
}

/// @nodoc
class _$EsiaTokenAuthRequestCopyWithImpl<$Res>
    implements $EsiaTokenAuthRequestCopyWith<$Res> {
  _$EsiaTokenAuthRequestCopyWithImpl(this._value, this._then);

  final EsiaTokenAuthRequest _value;
  // ignore: unused_field
  final $Res Function(EsiaTokenAuthRequest) _then;

  @override
  $Res call({
    Object? isUserExists = freezed,
    Object? signinModel = freezed,
    Object? registrationModel = freezed,
  }) {
    return _then(_value.copyWith(
      isUserExists: isUserExists == freezed
          ? _value.isUserExists
          : isUserExists // ignore: cast_nullable_to_non_nullable
              as bool,
      signinModel: signinModel == freezed
          ? _value.signinModel
          : signinModel // ignore: cast_nullable_to_non_nullable
              as EsiaTokenAuthSigninModelRequest?,
      registrationModel: registrationModel == freezed
          ? _value.registrationModel
          : registrationModel // ignore: cast_nullable_to_non_nullable
              as EsiaTokenAuthRegistrationModelRequest?,
    ));
  }

  @override
  $EsiaTokenAuthSigninModelRequestCopyWith<$Res>? get signinModel {
    if (_value.signinModel == null) {
      return null;
    }

    return $EsiaTokenAuthSigninModelRequestCopyWith<$Res>(_value.signinModel!,
        (value) {
      return _then(_value.copyWith(signinModel: value));
    });
  }

  @override
  $EsiaTokenAuthRegistrationModelRequestCopyWith<$Res>? get registrationModel {
    if (_value.registrationModel == null) {
      return null;
    }

    return $EsiaTokenAuthRegistrationModelRequestCopyWith<$Res>(
        _value.registrationModel!, (value) {
      return _then(_value.copyWith(registrationModel: value));
    });
  }
}

/// @nodoc
abstract class _$$_EsiaTokenAuthRequestCopyWith<$Res>
    implements $EsiaTokenAuthRequestCopyWith<$Res> {
  factory _$$_EsiaTokenAuthRequestCopyWith(_$_EsiaTokenAuthRequest value,
          $Res Function(_$_EsiaTokenAuthRequest) then) =
      __$$_EsiaTokenAuthRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isUserExists,
      EsiaTokenAuthSigninModelRequest? signinModel,
      EsiaTokenAuthRegistrationModelRequest? registrationModel});

  @override
  $EsiaTokenAuthSigninModelRequestCopyWith<$Res>? get signinModel;
  @override
  $EsiaTokenAuthRegistrationModelRequestCopyWith<$Res>? get registrationModel;
}

/// @nodoc
class __$$_EsiaTokenAuthRequestCopyWithImpl<$Res>
    extends _$EsiaTokenAuthRequestCopyWithImpl<$Res>
    implements _$$_EsiaTokenAuthRequestCopyWith<$Res> {
  __$$_EsiaTokenAuthRequestCopyWithImpl(_$_EsiaTokenAuthRequest _value,
      $Res Function(_$_EsiaTokenAuthRequest) _then)
      : super(_value, (v) => _then(v as _$_EsiaTokenAuthRequest));

  @override
  _$_EsiaTokenAuthRequest get _value => super._value as _$_EsiaTokenAuthRequest;

  @override
  $Res call({
    Object? isUserExists = freezed,
    Object? signinModel = freezed,
    Object? registrationModel = freezed,
  }) {
    return _then(_$_EsiaTokenAuthRequest(
      isUserExists: isUserExists == freezed
          ? _value.isUserExists
          : isUserExists // ignore: cast_nullable_to_non_nullable
              as bool,
      signinModel: signinModel == freezed
          ? _value.signinModel
          : signinModel // ignore: cast_nullable_to_non_nullable
              as EsiaTokenAuthSigninModelRequest?,
      registrationModel: registrationModel == freezed
          ? _value.registrationModel
          : registrationModel // ignore: cast_nullable_to_non_nullable
              as EsiaTokenAuthRegistrationModelRequest?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EsiaTokenAuthRequest implements _EsiaTokenAuthRequest {
  const _$_EsiaTokenAuthRequest(
      {required this.isUserExists,
      required this.signinModel,
      required this.registrationModel});

  factory _$_EsiaTokenAuthRequest.fromJson(Map<String, dynamic> json) =>
      _$$_EsiaTokenAuthRequestFromJson(json);

  @override
  final bool isUserExists;
  @override
  final EsiaTokenAuthSigninModelRequest? signinModel;
  @override
  final EsiaTokenAuthRegistrationModelRequest? registrationModel;

  @override
  String toString() {
    return 'EsiaTokenAuthRequest(isUserExists: $isUserExists, signinModel: $signinModel, registrationModel: $registrationModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EsiaTokenAuthRequest &&
            const DeepCollectionEquality()
                .equals(other.isUserExists, isUserExists) &&
            const DeepCollectionEquality()
                .equals(other.signinModel, signinModel) &&
            const DeepCollectionEquality()
                .equals(other.registrationModel, registrationModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isUserExists),
      const DeepCollectionEquality().hash(signinModel),
      const DeepCollectionEquality().hash(registrationModel));

  @JsonKey(ignore: true)
  @override
  _$$_EsiaTokenAuthRequestCopyWith<_$_EsiaTokenAuthRequest> get copyWith =>
      __$$_EsiaTokenAuthRequestCopyWithImpl<_$_EsiaTokenAuthRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EsiaTokenAuthRequestToJson(this);
  }
}

abstract class _EsiaTokenAuthRequest implements EsiaTokenAuthRequest {
  const factory _EsiaTokenAuthRequest(
      {required final bool isUserExists,
      required final EsiaTokenAuthSigninModelRequest? signinModel,
      required final EsiaTokenAuthRegistrationModelRequest?
          registrationModel}) = _$_EsiaTokenAuthRequest;

  factory _EsiaTokenAuthRequest.fromJson(Map<String, dynamic> json) =
      _$_EsiaTokenAuthRequest.fromJson;

  @override
  bool get isUserExists => throw _privateConstructorUsedError;
  @override
  EsiaTokenAuthSigninModelRequest? get signinModel =>
      throw _privateConstructorUsedError;
  @override
  EsiaTokenAuthRegistrationModelRequest? get registrationModel =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EsiaTokenAuthRequestCopyWith<_$_EsiaTokenAuthRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

EsiaTokenAuthRegistrationModelRequest
    _$EsiaTokenAuthRegistrationModelRequestFromJson(Map<String, dynamic> json) {
  return _EsiaTokenAuthRegistrationModelRequest.fromJson(json);
}

/// @nodoc
mixin _$EsiaTokenAuthRegistrationModelRequest {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get middleName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get snils => throw _privateConstructorUsedError;
  int get sex => throw _privateConstructorUsedError;
  String get birthday => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EsiaTokenAuthRegistrationModelRequestCopyWith<
          EsiaTokenAuthRegistrationModelRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EsiaTokenAuthRegistrationModelRequestCopyWith<$Res> {
  factory $EsiaTokenAuthRegistrationModelRequestCopyWith(
          EsiaTokenAuthRegistrationModelRequest value,
          $Res Function(EsiaTokenAuthRegistrationModelRequest) then) =
      _$EsiaTokenAuthRegistrationModelRequestCopyWithImpl<$Res>;
  $Res call(
      {String firstName,
      String lastName,
      String middleName,
      String phoneNumber,
      String snils,
      int sex,
      String birthday});
}

/// @nodoc
class _$EsiaTokenAuthRegistrationModelRequestCopyWithImpl<$Res>
    implements $EsiaTokenAuthRegistrationModelRequestCopyWith<$Res> {
  _$EsiaTokenAuthRegistrationModelRequestCopyWithImpl(this._value, this._then);

  final EsiaTokenAuthRegistrationModelRequest _value;
  // ignore: unused_field
  final $Res Function(EsiaTokenAuthRegistrationModelRequest) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
    Object? phoneNumber = freezed,
    Object? snils = freezed,
    Object? sex = freezed,
    Object? birthday = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: middleName == freezed
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      snils: snils == freezed
          ? _value.snils
          : snils // ignore: cast_nullable_to_non_nullable
              as String,
      sex: sex == freezed
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as int,
      birthday: birthday == freezed
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_EsiaTokenAuthRegistrationModelRequestCopyWith<$Res>
    implements $EsiaTokenAuthRegistrationModelRequestCopyWith<$Res> {
  factory _$$_EsiaTokenAuthRegistrationModelRequestCopyWith(
          _$_EsiaTokenAuthRegistrationModelRequest value,
          $Res Function(_$_EsiaTokenAuthRegistrationModelRequest) then) =
      __$$_EsiaTokenAuthRegistrationModelRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {String firstName,
      String lastName,
      String middleName,
      String phoneNumber,
      String snils,
      int sex,
      String birthday});
}

/// @nodoc
class __$$_EsiaTokenAuthRegistrationModelRequestCopyWithImpl<$Res>
    extends _$EsiaTokenAuthRegistrationModelRequestCopyWithImpl<$Res>
    implements _$$_EsiaTokenAuthRegistrationModelRequestCopyWith<$Res> {
  __$$_EsiaTokenAuthRegistrationModelRequestCopyWithImpl(
      _$_EsiaTokenAuthRegistrationModelRequest _value,
      $Res Function(_$_EsiaTokenAuthRegistrationModelRequest) _then)
      : super(_value,
            (v) => _then(v as _$_EsiaTokenAuthRegistrationModelRequest));

  @override
  _$_EsiaTokenAuthRegistrationModelRequest get _value =>
      super._value as _$_EsiaTokenAuthRegistrationModelRequest;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
    Object? phoneNumber = freezed,
    Object? snils = freezed,
    Object? sex = freezed,
    Object? birthday = freezed,
  }) {
    return _then(_$_EsiaTokenAuthRegistrationModelRequest(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: middleName == freezed
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      snils: snils == freezed
          ? _value.snils
          : snils // ignore: cast_nullable_to_non_nullable
              as String,
      sex: sex == freezed
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as int,
      birthday: birthday == freezed
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EsiaTokenAuthRegistrationModelRequest
    implements _EsiaTokenAuthRegistrationModelRequest {
  const _$_EsiaTokenAuthRegistrationModelRequest(
      {required this.firstName,
      required this.lastName,
      required this.middleName,
      required this.phoneNumber,
      required this.snils,
      required this.sex,
      required this.birthday});

  factory _$_EsiaTokenAuthRegistrationModelRequest.fromJson(
          Map<String, dynamic> json) =>
      _$$_EsiaTokenAuthRegistrationModelRequestFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String middleName;
  @override
  final String phoneNumber;
  @override
  final String snils;
  @override
  final int sex;
  @override
  final String birthday;

  @override
  String toString() {
    return 'EsiaTokenAuthRegistrationModelRequest(firstName: $firstName, lastName: $lastName, middleName: $middleName, phoneNumber: $phoneNumber, snils: $snils, sex: $sex, birthday: $birthday)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EsiaTokenAuthRegistrationModelRequest &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality()
                .equals(other.middleName, middleName) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.snils, snils) &&
            const DeepCollectionEquality().equals(other.sex, sex) &&
            const DeepCollectionEquality().equals(other.birthday, birthday));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(middleName),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(snils),
      const DeepCollectionEquality().hash(sex),
      const DeepCollectionEquality().hash(birthday));

  @JsonKey(ignore: true)
  @override
  _$$_EsiaTokenAuthRegistrationModelRequestCopyWith<
          _$_EsiaTokenAuthRegistrationModelRequest>
      get copyWith => __$$_EsiaTokenAuthRegistrationModelRequestCopyWithImpl<
          _$_EsiaTokenAuthRegistrationModelRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EsiaTokenAuthRegistrationModelRequestToJson(this);
  }
}

abstract class _EsiaTokenAuthRegistrationModelRequest
    implements EsiaTokenAuthRegistrationModelRequest {
  const factory _EsiaTokenAuthRegistrationModelRequest(
          {required final String firstName,
          required final String lastName,
          required final String middleName,
          required final String phoneNumber,
          required final String snils,
          required final int sex,
          required final String birthday}) =
      _$_EsiaTokenAuthRegistrationModelRequest;

  factory _EsiaTokenAuthRegistrationModelRequest.fromJson(
          Map<String, dynamic> json) =
      _$_EsiaTokenAuthRegistrationModelRequest.fromJson;

  @override
  String get firstName => throw _privateConstructorUsedError;
  @override
  String get lastName => throw _privateConstructorUsedError;
  @override
  String get middleName => throw _privateConstructorUsedError;
  @override
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  String get snils => throw _privateConstructorUsedError;
  @override
  int get sex => throw _privateConstructorUsedError;
  @override
  String get birthday => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EsiaTokenAuthRegistrationModelRequestCopyWith<
          _$_EsiaTokenAuthRegistrationModelRequest>
      get copyWith => throw _privateConstructorUsedError;
}

EsiaTokenAuthSigninModelRequest _$EsiaTokenAuthSigninModelRequestFromJson(
    Map<String, dynamic> json) {
  return _EsiaTokenAuthSigninModelRequest.fromJson(json);
}

/// @nodoc
mixin _$EsiaTokenAuthSigninModelRequest {
  String get token => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EsiaTokenAuthSigninModelRequestCopyWith<EsiaTokenAuthSigninModelRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EsiaTokenAuthSigninModelRequestCopyWith<$Res> {
  factory $EsiaTokenAuthSigninModelRequestCopyWith(
          EsiaTokenAuthSigninModelRequest value,
          $Res Function(EsiaTokenAuthSigninModelRequest) then) =
      _$EsiaTokenAuthSigninModelRequestCopyWithImpl<$Res>;
  $Res call({String token, String refreshToken});
}

/// @nodoc
class _$EsiaTokenAuthSigninModelRequestCopyWithImpl<$Res>
    implements $EsiaTokenAuthSigninModelRequestCopyWith<$Res> {
  _$EsiaTokenAuthSigninModelRequestCopyWithImpl(this._value, this._then);

  final EsiaTokenAuthSigninModelRequest _value;
  // ignore: unused_field
  final $Res Function(EsiaTokenAuthSigninModelRequest) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_EsiaTokenAuthSigninModelRequestCopyWith<$Res>
    implements $EsiaTokenAuthSigninModelRequestCopyWith<$Res> {
  factory _$$_EsiaTokenAuthSigninModelRequestCopyWith(
          _$_EsiaTokenAuthSigninModelRequest value,
          $Res Function(_$_EsiaTokenAuthSigninModelRequest) then) =
      __$$_EsiaTokenAuthSigninModelRequestCopyWithImpl<$Res>;
  @override
  $Res call({String token, String refreshToken});
}

/// @nodoc
class __$$_EsiaTokenAuthSigninModelRequestCopyWithImpl<$Res>
    extends _$EsiaTokenAuthSigninModelRequestCopyWithImpl<$Res>
    implements _$$_EsiaTokenAuthSigninModelRequestCopyWith<$Res> {
  __$$_EsiaTokenAuthSigninModelRequestCopyWithImpl(
      _$_EsiaTokenAuthSigninModelRequest _value,
      $Res Function(_$_EsiaTokenAuthSigninModelRequest) _then)
      : super(_value, (v) => _then(v as _$_EsiaTokenAuthSigninModelRequest));

  @override
  _$_EsiaTokenAuthSigninModelRequest get _value =>
      super._value as _$_EsiaTokenAuthSigninModelRequest;

  @override
  $Res call({
    Object? token = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_$_EsiaTokenAuthSigninModelRequest(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EsiaTokenAuthSigninModelRequest
    implements _EsiaTokenAuthSigninModelRequest {
  const _$_EsiaTokenAuthSigninModelRequest(
      {required this.token, required this.refreshToken});

  factory _$_EsiaTokenAuthSigninModelRequest.fromJson(
          Map<String, dynamic> json) =>
      _$$_EsiaTokenAuthSigninModelRequestFromJson(json);

  @override
  final String token;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'EsiaTokenAuthSigninModelRequest(token: $token, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EsiaTokenAuthSigninModelRequest &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(refreshToken));

  @JsonKey(ignore: true)
  @override
  _$$_EsiaTokenAuthSigninModelRequestCopyWith<
          _$_EsiaTokenAuthSigninModelRequest>
      get copyWith => __$$_EsiaTokenAuthSigninModelRequestCopyWithImpl<
          _$_EsiaTokenAuthSigninModelRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EsiaTokenAuthSigninModelRequestToJson(this);
  }
}

abstract class _EsiaTokenAuthSigninModelRequest
    implements EsiaTokenAuthSigninModelRequest {
  const factory _EsiaTokenAuthSigninModelRequest(
      {required final String token,
      required final String refreshToken}) = _$_EsiaTokenAuthSigninModelRequest;

  factory _EsiaTokenAuthSigninModelRequest.fromJson(Map<String, dynamic> json) =
      _$_EsiaTokenAuthSigninModelRequest.fromJson;

  @override
  String get token => throw _privateConstructorUsedError;
  @override
  String get refreshToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EsiaTokenAuthSigninModelRequestCopyWith<
          _$_EsiaTokenAuthSigninModelRequest>
      get copyWith => throw _privateConstructorUsedError;
}

CreateUserProfileAndMedicalCardRequestModel
    _$CreateUserProfileAndMedicalCardRequestModelFromJson(
        Map<String, dynamic> json) {
  return _CreateUserProfileAndMedicalCardRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreateUserProfileAndMedicalCardRequestModel {
  bool get result => throw _privateConstructorUsedError;
  String get profileId => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  CreateUserProfileAndMedicalCardIntegrationResponseModel
      get integrationResponse => throw _privateConstructorUsedError;
  bool get forceToSite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateUserProfileAndMedicalCardRequestModelCopyWith<
          CreateUserProfileAndMedicalCardRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserProfileAndMedicalCardRequestModelCopyWith<$Res> {
  factory $CreateUserProfileAndMedicalCardRequestModelCopyWith(
          CreateUserProfileAndMedicalCardRequestModel value,
          $Res Function(CreateUserProfileAndMedicalCardRequestModel) then) =
      _$CreateUserProfileAndMedicalCardRequestModelCopyWithImpl<$Res>;
  $Res call(
      {bool result,
      String profileId,
      String error,
      CreateUserProfileAndMedicalCardIntegrationResponseModel
          integrationResponse,
      bool forceToSite});

  $CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWith<$Res>
      get integrationResponse;
}

/// @nodoc
class _$CreateUserProfileAndMedicalCardRequestModelCopyWithImpl<$Res>
    implements $CreateUserProfileAndMedicalCardRequestModelCopyWith<$Res> {
  _$CreateUserProfileAndMedicalCardRequestModelCopyWithImpl(
      this._value, this._then);

  final CreateUserProfileAndMedicalCardRequestModel _value;
  // ignore: unused_field
  final $Res Function(CreateUserProfileAndMedicalCardRequestModel) _then;

  @override
  $Res call({
    Object? result = freezed,
    Object? profileId = freezed,
    Object? error = freezed,
    Object? integrationResponse = freezed,
    Object? forceToSite = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
      profileId: profileId == freezed
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      integrationResponse: integrationResponse == freezed
          ? _value.integrationResponse
          : integrationResponse // ignore: cast_nullable_to_non_nullable
              as CreateUserProfileAndMedicalCardIntegrationResponseModel,
      forceToSite: forceToSite == freezed
          ? _value.forceToSite
          : forceToSite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWith<$Res>
      get integrationResponse {
    return $CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWith<
        $Res>(_value.integrationResponse, (value) {
      return _then(_value.copyWith(integrationResponse: value));
    });
  }
}

/// @nodoc
abstract class _$$_CreateUserProfileAndMedicalCardRequestModelCopyWith<$Res>
    implements $CreateUserProfileAndMedicalCardRequestModelCopyWith<$Res> {
  factory _$$_CreateUserProfileAndMedicalCardRequestModelCopyWith(
          _$_CreateUserProfileAndMedicalCardRequestModel value,
          $Res Function(_$_CreateUserProfileAndMedicalCardRequestModel) then) =
      __$$_CreateUserProfileAndMedicalCardRequestModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool result,
      String profileId,
      String error,
      CreateUserProfileAndMedicalCardIntegrationResponseModel
          integrationResponse,
      bool forceToSite});

  @override
  $CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWith<$Res>
      get integrationResponse;
}

/// @nodoc
class __$$_CreateUserProfileAndMedicalCardRequestModelCopyWithImpl<$Res>
    extends _$CreateUserProfileAndMedicalCardRequestModelCopyWithImpl<$Res>
    implements _$$_CreateUserProfileAndMedicalCardRequestModelCopyWith<$Res> {
  __$$_CreateUserProfileAndMedicalCardRequestModelCopyWithImpl(
      _$_CreateUserProfileAndMedicalCardRequestModel _value,
      $Res Function(_$_CreateUserProfileAndMedicalCardRequestModel) _then)
      : super(_value,
            (v) => _then(v as _$_CreateUserProfileAndMedicalCardRequestModel));

  @override
  _$_CreateUserProfileAndMedicalCardRequestModel get _value =>
      super._value as _$_CreateUserProfileAndMedicalCardRequestModel;

  @override
  $Res call({
    Object? result = freezed,
    Object? profileId = freezed,
    Object? error = freezed,
    Object? integrationResponse = freezed,
    Object? forceToSite = freezed,
  }) {
    return _then(_$_CreateUserProfileAndMedicalCardRequestModel(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
      profileId: profileId == freezed
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      integrationResponse: integrationResponse == freezed
          ? _value.integrationResponse
          : integrationResponse // ignore: cast_nullable_to_non_nullable
              as CreateUserProfileAndMedicalCardIntegrationResponseModel,
      forceToSite: forceToSite == freezed
          ? _value.forceToSite
          : forceToSite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateUserProfileAndMedicalCardRequestModel
    implements _CreateUserProfileAndMedicalCardRequestModel {
  const _$_CreateUserProfileAndMedicalCardRequestModel(
      {required this.result,
      required this.profileId,
      required this.error,
      required this.integrationResponse,
      required this.forceToSite});

  factory _$_CreateUserProfileAndMedicalCardRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_CreateUserProfileAndMedicalCardRequestModelFromJson(json);

  @override
  final bool result;
  @override
  final String profileId;
  @override
  final String error;
  @override
  final CreateUserProfileAndMedicalCardIntegrationResponseModel
      integrationResponse;
  @override
  final bool forceToSite;

  @override
  String toString() {
    return 'CreateUserProfileAndMedicalCardRequestModel(result: $result, profileId: $profileId, error: $error, integrationResponse: $integrationResponse, forceToSite: $forceToSite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateUserProfileAndMedicalCardRequestModel &&
            const DeepCollectionEquality().equals(other.result, result) &&
            const DeepCollectionEquality().equals(other.profileId, profileId) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.integrationResponse, integrationResponse) &&
            const DeepCollectionEquality()
                .equals(other.forceToSite, forceToSite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(result),
      const DeepCollectionEquality().hash(profileId),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(integrationResponse),
      const DeepCollectionEquality().hash(forceToSite));

  @JsonKey(ignore: true)
  @override
  _$$_CreateUserProfileAndMedicalCardRequestModelCopyWith<
          _$_CreateUserProfileAndMedicalCardRequestModel>
      get copyWith =>
          __$$_CreateUserProfileAndMedicalCardRequestModelCopyWithImpl<
              _$_CreateUserProfileAndMedicalCardRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateUserProfileAndMedicalCardRequestModelToJson(this);
  }
}

abstract class _CreateUserProfileAndMedicalCardRequestModel
    implements CreateUserProfileAndMedicalCardRequestModel {
  const factory _CreateUserProfileAndMedicalCardRequestModel(
          {required final bool result,
          required final String profileId,
          required final String error,
          required final CreateUserProfileAndMedicalCardIntegrationResponseModel
              integrationResponse,
          required final bool forceToSite}) =
      _$_CreateUserProfileAndMedicalCardRequestModel;

  factory _CreateUserProfileAndMedicalCardRequestModel.fromJson(
          Map<String, dynamic> json) =
      _$_CreateUserProfileAndMedicalCardRequestModel.fromJson;

  @override
  bool get result => throw _privateConstructorUsedError;
  @override
  String get profileId => throw _privateConstructorUsedError;
  @override
  String get error => throw _privateConstructorUsedError;
  @override
  CreateUserProfileAndMedicalCardIntegrationResponseModel
      get integrationResponse => throw _privateConstructorUsedError;
  @override
  bool get forceToSite => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CreateUserProfileAndMedicalCardRequestModelCopyWith<
          _$_CreateUserProfileAndMedicalCardRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

CreateUserProfileAndMedicalCardIntegrationResponseModel
    _$CreateUserProfileAndMedicalCardIntegrationResponseModelFromJson(
        Map<String, dynamic> json) {
  return _CreateUserProfileAndMedicalCardIntegrationResponseModel.fromJson(
      json);
}

/// @nodoc
mixin _$CreateUserProfileAndMedicalCardIntegrationResponseModel {
  bool get result => throw _privateConstructorUsedError;
  String get profileId => throw _privateConstructorUsedError;
  String get errorCode => throw _privateConstructorUsedError;
  String get errorText => throw _privateConstructorUsedError;
  String get accountId => throw _privateConstructorUsedError;
  bool get forceErrorToSite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWith<
          CreateUserProfileAndMedicalCardIntegrationResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWith<
    $Res> {
  factory $CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWith(
          CreateUserProfileAndMedicalCardIntegrationResponseModel value,
          $Res Function(CreateUserProfileAndMedicalCardIntegrationResponseModel)
              then) =
      _$CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWithImpl<
          $Res>;
  $Res call(
      {bool result,
      String profileId,
      String errorCode,
      String errorText,
      String accountId,
      bool forceErrorToSite});
}

/// @nodoc
class _$CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWithImpl<
        $Res>
    implements
        $CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWith<$Res> {
  _$CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWithImpl(
      this._value, this._then);

  final CreateUserProfileAndMedicalCardIntegrationResponseModel _value;
  // ignore: unused_field
  final $Res Function(CreateUserProfileAndMedicalCardIntegrationResponseModel)
      _then;

  @override
  $Res call({
    Object? result = freezed,
    Object? profileId = freezed,
    Object? errorCode = freezed,
    Object? errorText = freezed,
    Object? accountId = freezed,
    Object? forceErrorToSite = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
      profileId: profileId == freezed
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      errorCode: errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String,
      errorText: errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: accountId == freezed
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      forceErrorToSite: forceErrorToSite == freezed
          ? _value.forceErrorToSite
          : forceErrorToSite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWith<
        $Res>
    implements
        $CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWith<$Res> {
  factory _$$_CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWith(
          _$_CreateUserProfileAndMedicalCardIntegrationResponseModel value,
          $Res Function(
                  _$_CreateUserProfileAndMedicalCardIntegrationResponseModel)
              then) =
      __$$_CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWithImpl<
          $Res>;
  @override
  $Res call(
      {bool result,
      String profileId,
      String errorCode,
      String errorText,
      String accountId,
      bool forceErrorToSite});
}

/// @nodoc
class __$$_CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWithImpl<
        $Res>
    extends _$CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWithImpl<
        $Res>
    implements
        _$$_CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWith<
            $Res> {
  __$$_CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWithImpl(
      _$_CreateUserProfileAndMedicalCardIntegrationResponseModel _value,
      $Res Function(_$_CreateUserProfileAndMedicalCardIntegrationResponseModel)
          _then)
      : super(
            _value,
            (v) => _then(v
                as _$_CreateUserProfileAndMedicalCardIntegrationResponseModel));

  @override
  _$_CreateUserProfileAndMedicalCardIntegrationResponseModel get _value =>
      super._value
          as _$_CreateUserProfileAndMedicalCardIntegrationResponseModel;

  @override
  $Res call({
    Object? result = freezed,
    Object? profileId = freezed,
    Object? errorCode = freezed,
    Object? errorText = freezed,
    Object? accountId = freezed,
    Object? forceErrorToSite = freezed,
  }) {
    return _then(_$_CreateUserProfileAndMedicalCardIntegrationResponseModel(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
      profileId: profileId == freezed
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      errorCode: errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String,
      errorText: errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: accountId == freezed
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      forceErrorToSite: forceErrorToSite == freezed
          ? _value.forceErrorToSite
          : forceErrorToSite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateUserProfileAndMedicalCardIntegrationResponseModel
    implements _CreateUserProfileAndMedicalCardIntegrationResponseModel {
  const _$_CreateUserProfileAndMedicalCardIntegrationResponseModel(
      {required this.result,
      required this.profileId,
      required this.errorCode,
      required this.errorText,
      required this.accountId,
      required this.forceErrorToSite});

  factory _$_CreateUserProfileAndMedicalCardIntegrationResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_CreateUserProfileAndMedicalCardIntegrationResponseModelFromJson(json);

  @override
  final bool result;
  @override
  final String profileId;
  @override
  final String errorCode;
  @override
  final String errorText;
  @override
  final String accountId;
  @override
  final bool forceErrorToSite;

  @override
  String toString() {
    return 'CreateUserProfileAndMedicalCardIntegrationResponseModel(result: $result, profileId: $profileId, errorCode: $errorCode, errorText: $errorText, accountId: $accountId, forceErrorToSite: $forceErrorToSite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other
                is _$_CreateUserProfileAndMedicalCardIntegrationResponseModel &&
            const DeepCollectionEquality().equals(other.result, result) &&
            const DeepCollectionEquality().equals(other.profileId, profileId) &&
            const DeepCollectionEquality().equals(other.errorCode, errorCode) &&
            const DeepCollectionEquality().equals(other.errorText, errorText) &&
            const DeepCollectionEquality().equals(other.accountId, accountId) &&
            const DeepCollectionEquality()
                .equals(other.forceErrorToSite, forceErrorToSite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(result),
      const DeepCollectionEquality().hash(profileId),
      const DeepCollectionEquality().hash(errorCode),
      const DeepCollectionEquality().hash(errorText),
      const DeepCollectionEquality().hash(accountId),
      const DeepCollectionEquality().hash(forceErrorToSite));

  @JsonKey(ignore: true)
  @override
  _$$_CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWith<
          _$_CreateUserProfileAndMedicalCardIntegrationResponseModel>
      get copyWith =>
          __$$_CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWithImpl<
                  _$_CreateUserProfileAndMedicalCardIntegrationResponseModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateUserProfileAndMedicalCardIntegrationResponseModelToJson(
        this);
  }
}

abstract class _CreateUserProfileAndMedicalCardIntegrationResponseModel
    implements CreateUserProfileAndMedicalCardIntegrationResponseModel {
  const factory _CreateUserProfileAndMedicalCardIntegrationResponseModel(
          {required final bool result,
          required final String profileId,
          required final String errorCode,
          required final String errorText,
          required final String accountId,
          required final bool forceErrorToSite}) =
      _$_CreateUserProfileAndMedicalCardIntegrationResponseModel;

  factory _CreateUserProfileAndMedicalCardIntegrationResponseModel.fromJson(
          Map<String, dynamic> json) =
      _$_CreateUserProfileAndMedicalCardIntegrationResponseModel.fromJson;

  @override
  bool get result => throw _privateConstructorUsedError;
  @override
  String get profileId => throw _privateConstructorUsedError;
  @override
  String get errorCode => throw _privateConstructorUsedError;
  @override
  String get errorText => throw _privateConstructorUsedError;
  @override
  String get accountId => throw _privateConstructorUsedError;
  @override
  bool get forceErrorToSite => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CreateUserProfileAndMedicalCardIntegrationResponseModelCopyWith<
          _$_CreateUserProfileAndMedicalCardIntegrationResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
