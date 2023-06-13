// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$AuthTokenRequestCopyWithImpl<$Res, AuthTokenRequest>;
  @useResult
  $Res call({String phone, String password});
}

/// @nodoc
class _$AuthTokenRequestCopyWithImpl<$Res, $Val extends AuthTokenRequest>
    implements $AuthTokenRequestCopyWith<$Res> {
  _$AuthTokenRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthTokenRequestCopyWith<$Res>
    implements $AuthTokenRequestCopyWith<$Res> {
  factory _$$_AuthTokenRequestCopyWith(
          _$_AuthTokenRequest value, $Res Function(_$_AuthTokenRequest) then) =
      __$$_AuthTokenRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone, String password});
}

/// @nodoc
class __$$_AuthTokenRequestCopyWithImpl<$Res>
    extends _$AuthTokenRequestCopyWithImpl<$Res, _$_AuthTokenRequest>
    implements _$$_AuthTokenRequestCopyWith<$Res> {
  __$$_AuthTokenRequestCopyWithImpl(
      _$_AuthTokenRequest _value, $Res Function(_$_AuthTokenRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? password = null,
  }) {
    return _then(_$_AuthTokenRequest(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
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
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phone, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthTokenRequestCopyWith<_$_AuthTokenRequest> get copyWith =>
      __$$_AuthTokenRequestCopyWithImpl<_$_AuthTokenRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthTokenRequestToJson(
      this,
    );
  }
}

abstract class _AuthTokenRequest implements AuthTokenRequest {
  const factory _AuthTokenRequest(
      {required final String phone,
      required final String password}) = _$_AuthTokenRequest;

  factory _AuthTokenRequest.fromJson(Map<String, dynamic> json) =
      _$_AuthTokenRequest.fromJson;

  @override
  String get phone;
  @override
  String get password;
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
      _$AuthTokenResponseCopyWithImpl<$Res, AuthTokenResponse>;
  @useResult
  $Res call({String token, String refreshToken, int? tryCount});
}

/// @nodoc
class _$AuthTokenResponseCopyWithImpl<$Res, $Val extends AuthTokenResponse>
    implements $AuthTokenResponseCopyWith<$Res> {
  _$AuthTokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? refreshToken = null,
    Object? tryCount = freezed,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tryCount: freezed == tryCount
          ? _value.tryCount
          : tryCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthTokenResponseCopyWith<$Res>
    implements $AuthTokenResponseCopyWith<$Res> {
  factory _$$_AuthTokenResponseCopyWith(_$_AuthTokenResponse value,
          $Res Function(_$_AuthTokenResponse) then) =
      __$$_AuthTokenResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String refreshToken, int? tryCount});
}

/// @nodoc
class __$$_AuthTokenResponseCopyWithImpl<$Res>
    extends _$AuthTokenResponseCopyWithImpl<$Res, _$_AuthTokenResponse>
    implements _$$_AuthTokenResponseCopyWith<$Res> {
  __$$_AuthTokenResponseCopyWithImpl(
      _$_AuthTokenResponse _value, $Res Function(_$_AuthTokenResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? refreshToken = null,
    Object? tryCount = freezed,
  }) {
    return _then(_$_AuthTokenResponse(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tryCount: freezed == tryCount
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
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.tryCount, tryCount) ||
                other.tryCount == tryCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, refreshToken, tryCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthTokenResponseCopyWith<_$_AuthTokenResponse> get copyWith =>
      __$$_AuthTokenResponseCopyWithImpl<_$_AuthTokenResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthTokenResponseToJson(
      this,
    );
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
  String get token;
  @override
  String get refreshToken;
  @override
  int? get tryCount;
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
      _$AuthTokenResponseErrorCopyWithImpl<$Res, AuthTokenResponseError>;
  @useResult
  $Res call({String message, int tryCount});
}

/// @nodoc
class _$AuthTokenResponseErrorCopyWithImpl<$Res,
        $Val extends AuthTokenResponseError>
    implements $AuthTokenResponseErrorCopyWith<$Res> {
  _$AuthTokenResponseErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? tryCount = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tryCount: null == tryCount
          ? _value.tryCount
          : tryCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthTokenResponseErrorCopyWith<$Res>
    implements $AuthTokenResponseErrorCopyWith<$Res> {
  factory _$$_AuthTokenResponseErrorCopyWith(_$_AuthTokenResponseError value,
          $Res Function(_$_AuthTokenResponseError) then) =
      __$$_AuthTokenResponseErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int tryCount});
}

/// @nodoc
class __$$_AuthTokenResponseErrorCopyWithImpl<$Res>
    extends _$AuthTokenResponseErrorCopyWithImpl<$Res,
        _$_AuthTokenResponseError>
    implements _$$_AuthTokenResponseErrorCopyWith<$Res> {
  __$$_AuthTokenResponseErrorCopyWithImpl(_$_AuthTokenResponseError _value,
      $Res Function(_$_AuthTokenResponseError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? tryCount = null,
  }) {
    return _then(_$_AuthTokenResponseError(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tryCount: null == tryCount
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
            (identical(other.message, message) || other.message == message) &&
            (identical(other.tryCount, tryCount) ||
                other.tryCount == tryCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, tryCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthTokenResponseErrorCopyWith<_$_AuthTokenResponseError> get copyWith =>
      __$$_AuthTokenResponseErrorCopyWithImpl<_$_AuthTokenResponseError>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthTokenResponseErrorToJson(
      this,
    );
  }
}

abstract class _AuthTokenResponseError implements AuthTokenResponseError {
  const factory _AuthTokenResponseError(
      {required final String message,
      required final int tryCount}) = _$_AuthTokenResponseError;

  factory _AuthTokenResponseError.fromJson(Map<String, dynamic> json) =
      _$_AuthTokenResponseError.fromJson;

  @override
  String get message;
  @override
  int get tryCount;
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
      _$RefreshTokenResponseModelCopyWithImpl<$Res, RefreshTokenResponseModel>;
  @useResult
  $Res call({String token, String refreshToken});
}

/// @nodoc
class _$RefreshTokenResponseModelCopyWithImpl<$Res,
        $Val extends RefreshTokenResponseModel>
    implements $RefreshTokenResponseModelCopyWith<$Res> {
  _$RefreshTokenResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
  @useResult
  $Res call({String token, String refreshToken});
}

/// @nodoc
class __$$_RefreshTokenResponseModelCopyWithImpl<$Res>
    extends _$RefreshTokenResponseModelCopyWithImpl<$Res,
        _$_RefreshTokenResponseModel>
    implements _$$_RefreshTokenResponseModelCopyWith<$Res> {
  __$$_RefreshTokenResponseModelCopyWithImpl(
      _$_RefreshTokenResponseModel _value,
      $Res Function(_$_RefreshTokenResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? refreshToken = null,
  }) {
    return _then(_$_RefreshTokenResponseModel(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
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
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RefreshTokenResponseModelCopyWith<_$_RefreshTokenResponseModel>
      get copyWith => __$$_RefreshTokenResponseModelCopyWithImpl<
          _$_RefreshTokenResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RefreshTokenResponseModelToJson(
      this,
    );
  }
}

abstract class _RefreshTokenResponseModel implements RefreshTokenResponseModel {
  const factory _RefreshTokenResponseModel(
      {required final String token,
      required final String refreshToken}) = _$_RefreshTokenResponseModel;

  factory _RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =
      _$_RefreshTokenResponseModel.fromJson;

  @override
  String get token;
  @override
  String get refreshToken;
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
      _$UserProfileClinicBuildingCopyWithImpl<$Res, UserProfileClinicBuilding>;
  @useResult
  $Res call({String id, List<String> category, bool? telemed});
}

/// @nodoc
class _$UserProfileClinicBuildingCopyWithImpl<$Res,
        $Val extends UserProfileClinicBuilding>
    implements $UserProfileClinicBuildingCopyWith<$Res> {
  _$UserProfileClinicBuildingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? telemed = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
      telemed: freezed == telemed
          ? _value.telemed
          : telemed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
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
  @useResult
  $Res call({String id, List<String> category, bool? telemed});
}

/// @nodoc
class __$$_UserProfileClinicBuildingCopyWithImpl<$Res>
    extends _$UserProfileClinicBuildingCopyWithImpl<$Res,
        _$_UserProfileClinicBuilding>
    implements _$$_UserProfileClinicBuildingCopyWith<$Res> {
  __$$_UserProfileClinicBuildingCopyWithImpl(
      _$_UserProfileClinicBuilding _value,
      $Res Function(_$_UserProfileClinicBuilding) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? telemed = freezed,
  }) {
    return _then(_$_UserProfileClinicBuilding(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
      telemed: freezed == telemed
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
    if (_category is EqualUnmodifiableListView) return _category;
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
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            (identical(other.telemed, telemed) || other.telemed == telemed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_category), telemed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileClinicBuildingCopyWith<_$_UserProfileClinicBuilding>
      get copyWith => __$$_UserProfileClinicBuildingCopyWithImpl<
          _$_UserProfileClinicBuilding>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileClinicBuildingToJson(
      this,
    );
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
  String get id;
  @override
  List<String> get category;
  @override
  bool? get telemed;
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
      _$UserProfileClinicCopyWithImpl<$Res, UserProfileClinic>;
  @useResult
  $Res call(
      {String? id,
      int? timeZoneOffset,
      List<UserProfileClinicBuilding>? buildings});
}

/// @nodoc
class _$UserProfileClinicCopyWithImpl<$Res, $Val extends UserProfileClinic>
    implements $UserProfileClinicCopyWith<$Res> {
  _$UserProfileClinicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? timeZoneOffset = freezed,
    Object? buildings = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      timeZoneOffset: freezed == timeZoneOffset
          ? _value.timeZoneOffset
          : timeZoneOffset // ignore: cast_nullable_to_non_nullable
              as int?,
      buildings: freezed == buildings
          ? _value.buildings
          : buildings // ignore: cast_nullable_to_non_nullable
              as List<UserProfileClinicBuilding>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProfileClinicCopyWith<$Res>
    implements $UserProfileClinicCopyWith<$Res> {
  factory _$$_UserProfileClinicCopyWith(_$_UserProfileClinic value,
          $Res Function(_$_UserProfileClinic) then) =
      __$$_UserProfileClinicCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int? timeZoneOffset,
      List<UserProfileClinicBuilding>? buildings});
}

/// @nodoc
class __$$_UserProfileClinicCopyWithImpl<$Res>
    extends _$UserProfileClinicCopyWithImpl<$Res, _$_UserProfileClinic>
    implements _$$_UserProfileClinicCopyWith<$Res> {
  __$$_UserProfileClinicCopyWithImpl(
      _$_UserProfileClinic _value, $Res Function(_$_UserProfileClinic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? timeZoneOffset = freezed,
    Object? buildings = freezed,
  }) {
    return _then(_$_UserProfileClinic(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      timeZoneOffset: freezed == timeZoneOffset
          ? _value.timeZoneOffset
          : timeZoneOffset // ignore: cast_nullable_to_non_nullable
              as int?,
      buildings: freezed == buildings
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
    if (_buildings is EqualUnmodifiableListView) return _buildings;
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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timeZoneOffset, timeZoneOffset) ||
                other.timeZoneOffset == timeZoneOffset) &&
            const DeepCollectionEquality()
                .equals(other._buildings, _buildings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, timeZoneOffset,
      const DeepCollectionEquality().hash(_buildings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileClinicCopyWith<_$_UserProfileClinic> get copyWith =>
      __$$_UserProfileClinicCopyWithImpl<_$_UserProfileClinic>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileClinicToJson(
      this,
    );
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
  String? get id;
  @override
  int? get timeZoneOffset;
  @override
  List<UserProfileClinicBuilding>? get buildings;
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
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
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
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? barCode = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? birthday = freezed,
    Object? avatar = freezed,
    Object? clinics = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      barCode: freezed == barCode
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      clinics: null == clinics
          ? _value.clinics
          : clinics // ignore: cast_nullable_to_non_nullable
              as List<UserProfileClinic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$_UserProfileCopyWith(
          _$_UserProfile value, $Res Function(_$_UserProfile) then) =
      __$$_UserProfileCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_UserProfileCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$_UserProfile>
    implements _$$_UserProfileCopyWith<$Res> {
  __$$_UserProfileCopyWithImpl(
      _$_UserProfile _value, $Res Function(_$_UserProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? barCode = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? birthday = freezed,
    Object? avatar = freezed,
    Object? clinics = null,
  }) {
    return _then(_$_UserProfile(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      barCode: freezed == barCode
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      clinics: null == clinics
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
    if (_clinics is EqualUnmodifiableListView) return _clinics;
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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.barCode, barCode) || other.barCode == barCode) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality().equals(other._clinics, _clinics));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      barCode,
      firstName,
      middleName,
      lastName,
      birthday,
      avatar,
      const DeepCollectionEquality().hash(_clinics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileCopyWith<_$_UserProfile> get copyWith =>
      __$$_UserProfileCopyWithImpl<_$_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileToJson(
      this,
    );
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
  String get id;
  @override
  String? get barCode;
  @override
  String? get firstName;
  @override
  String? get middleName;
  @override
  String? get lastName;
  @override
  DateTime? get birthday;
  @override
  String? get avatar;
  @override
  List<UserProfileClinic> get clinics;
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
      _$UserProfilesListCopyWithImpl<$Res, UserProfilesList>;
  @useResult
  $Res call({List<UserProfile> userProfilesList});
}

/// @nodoc
class _$UserProfilesListCopyWithImpl<$Res, $Val extends UserProfilesList>
    implements $UserProfilesListCopyWith<$Res> {
  _$UserProfilesListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfilesList = null,
  }) {
    return _then(_value.copyWith(
      userProfilesList: null == userProfilesList
          ? _value.userProfilesList
          : userProfilesList // ignore: cast_nullable_to_non_nullable
              as List<UserProfile>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProfilesListCopyWith<$Res>
    implements $UserProfilesListCopyWith<$Res> {
  factory _$$_UserProfilesListCopyWith(
          _$_UserProfilesList value, $Res Function(_$_UserProfilesList) then) =
      __$$_UserProfilesListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserProfile> userProfilesList});
}

/// @nodoc
class __$$_UserProfilesListCopyWithImpl<$Res>
    extends _$UserProfilesListCopyWithImpl<$Res, _$_UserProfilesList>
    implements _$$_UserProfilesListCopyWith<$Res> {
  __$$_UserProfilesListCopyWithImpl(
      _$_UserProfilesList _value, $Res Function(_$_UserProfilesList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfilesList = null,
  }) {
    return _then(_$_UserProfilesList(
      userProfilesList: null == userProfilesList
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
    if (_userProfilesList is EqualUnmodifiableListView)
      return _userProfilesList;
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
  @pragma('vm:prefer-inline')
  _$$_UserProfilesListCopyWith<_$_UserProfilesList> get copyWith =>
      __$$_UserProfilesListCopyWithImpl<_$_UserProfilesList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfilesListToJson(
      this,
    );
  }
}

abstract class _UserProfilesList implements UserProfilesList {
  const factory _UserProfilesList(
          {required final List<UserProfile> userProfilesList}) =
      _$_UserProfilesList;

  factory _UserProfilesList.fromJson(Map<String, dynamic> json) =
      _$_UserProfilesList.fromJson;

  @override
  List<UserProfile> get userProfilesList;
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
      _$CheckUserAccountResponseCopyWithImpl<$Res, CheckUserAccountResponse>;
  @useResult
  $Res call({bool? found, String? message});
}

/// @nodoc
class _$CheckUserAccountResponseCopyWithImpl<$Res,
        $Val extends CheckUserAccountResponse>
    implements $CheckUserAccountResponseCopyWith<$Res> {
  _$CheckUserAccountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? found = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      found: freezed == found
          ? _value.found
          : found // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
  @useResult
  $Res call({bool? found, String? message});
}

/// @nodoc
class __$$_CheckUserAccountResponseCopyWithImpl<$Res>
    extends _$CheckUserAccountResponseCopyWithImpl<$Res,
        _$_CheckUserAccountResponse>
    implements _$$_CheckUserAccountResponseCopyWith<$Res> {
  __$$_CheckUserAccountResponseCopyWithImpl(_$_CheckUserAccountResponse _value,
      $Res Function(_$_CheckUserAccountResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? found = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_CheckUserAccountResponse(
      found: freezed == found
          ? _value.found
          : found // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
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
            (identical(other.found, found) || other.found == found) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, found, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckUserAccountResponseCopyWith<_$_CheckUserAccountResponse>
      get copyWith => __$$_CheckUserAccountResponseCopyWithImpl<
          _$_CheckUserAccountResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckUserAccountResponseToJson(
      this,
    );
  }
}

abstract class _CheckUserAccountResponse implements CheckUserAccountResponse {
  const factory _CheckUserAccountResponse(
      {required final bool? found,
      required final String? message}) = _$_CheckUserAccountResponse;

  factory _CheckUserAccountResponse.fromJson(Map<String, dynamic> json) =
      _$_CheckUserAccountResponse.fromJson;

  @override
  bool? get found;
  @override
  String? get message;
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
      _$UserAgreementsModelCopyWithImpl<$Res, UserAgreementsModel>;
  @useResult
  $Res call({int id, String type, int version, bool accepted});
}

/// @nodoc
class _$UserAgreementsModelCopyWithImpl<$Res, $Val extends UserAgreementsModel>
    implements $UserAgreementsModelCopyWith<$Res> {
  _$UserAgreementsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? version = null,
    Object? accepted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      accepted: null == accepted
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserAgreementsModelCopyWith<$Res>
    implements $UserAgreementsModelCopyWith<$Res> {
  factory _$$_UserAgreementsModelCopyWith(_$_UserAgreementsModel value,
          $Res Function(_$_UserAgreementsModel) then) =
      __$$_UserAgreementsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String type, int version, bool accepted});
}

/// @nodoc
class __$$_UserAgreementsModelCopyWithImpl<$Res>
    extends _$UserAgreementsModelCopyWithImpl<$Res, _$_UserAgreementsModel>
    implements _$$_UserAgreementsModelCopyWith<$Res> {
  __$$_UserAgreementsModelCopyWithImpl(_$_UserAgreementsModel _value,
      $Res Function(_$_UserAgreementsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? version = null,
    Object? accepted = null,
  }) {
    return _then(_$_UserAgreementsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      accepted: null == accepted
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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.accepted, accepted) ||
                other.accepted == accepted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, version, accepted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserAgreementsModelCopyWith<_$_UserAgreementsModel> get copyWith =>
      __$$_UserAgreementsModelCopyWithImpl<_$_UserAgreementsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAgreementsModelToJson(
      this,
    );
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
  int get id;
  @override
  String get type;
  @override
  int get version;
  @override
  bool get accepted;
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
      _$UserAgreementDocumentModelCopyWithImpl<$Res,
          UserAgreementDocumentModel>;
  @useResult
  $Res call({String body});
}

/// @nodoc
class _$UserAgreementDocumentModelCopyWithImpl<$Res,
        $Val extends UserAgreementDocumentModel>
    implements $UserAgreementDocumentModelCopyWith<$Res> {
  _$UserAgreementDocumentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_value.copyWith(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
  @useResult
  $Res call({String body});
}

/// @nodoc
class __$$_UserAgreementDocumentModelCopyWithImpl<$Res>
    extends _$UserAgreementDocumentModelCopyWithImpl<$Res,
        _$_UserAgreementDocumentModel>
    implements _$$_UserAgreementDocumentModelCopyWith<$Res> {
  __$$_UserAgreementDocumentModelCopyWithImpl(
      _$_UserAgreementDocumentModel _value,
      $Res Function(_$_UserAgreementDocumentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$_UserAgreementDocumentModel(
      body: null == body
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
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserAgreementDocumentModelCopyWith<_$_UserAgreementDocumentModel>
      get copyWith => __$$_UserAgreementDocumentModelCopyWithImpl<
          _$_UserAgreementDocumentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAgreementDocumentModelToJson(
      this,
    );
  }
}

abstract class _UserAgreementDocumentModel
    implements UserAgreementDocumentModel {
  const factory _UserAgreementDocumentModel({required final String body}) =
      _$_UserAgreementDocumentModel;

  factory _UserAgreementDocumentModel.fromJson(Map<String, dynamic> json) =
      _$_UserAgreementDocumentModel.fromJson;

  @override
  String get body;
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
      _$UserUploadAvatarResponseModelCopyWithImpl<$Res,
          UserUploadAvatarResponseModel>;
  @useResult
  $Res call({String result, String? information});
}

/// @nodoc
class _$UserUploadAvatarResponseModelCopyWithImpl<$Res,
        $Val extends UserUploadAvatarResponseModel>
    implements $UserUploadAvatarResponseModelCopyWith<$Res> {
  _$UserUploadAvatarResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? information = freezed,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      information: freezed == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
  @useResult
  $Res call({String result, String? information});
}

/// @nodoc
class __$$_UserUploadAvatarResponseModelCopyWithImpl<$Res>
    extends _$UserUploadAvatarResponseModelCopyWithImpl<$Res,
        _$_UserUploadAvatarResponseModel>
    implements _$$_UserUploadAvatarResponseModelCopyWith<$Res> {
  __$$_UserUploadAvatarResponseModelCopyWithImpl(
      _$_UserUploadAvatarResponseModel _value,
      $Res Function(_$_UserUploadAvatarResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? information = freezed,
  }) {
    return _then(_$_UserUploadAvatarResponseModel(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      information: freezed == information
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
            (identical(other.result, result) || other.result == result) &&
            (identical(other.information, information) ||
                other.information == information));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result, information);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserUploadAvatarResponseModelCopyWith<_$_UserUploadAvatarResponseModel>
      get copyWith => __$$_UserUploadAvatarResponseModelCopyWithImpl<
          _$_UserUploadAvatarResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserUploadAvatarResponseModelToJson(
      this,
    );
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
  String get result;
  @override
  String? get information;
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
      _$UserAgreementItemModelCopyWithImpl<$Res, UserAgreementItemModel>;
  @useResult
  $Res call({int id, String type, int version, bool accepted});
}

/// @nodoc
class _$UserAgreementItemModelCopyWithImpl<$Res,
        $Val extends UserAgreementItemModel>
    implements $UserAgreementItemModelCopyWith<$Res> {
  _$UserAgreementItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? version = null,
    Object? accepted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      accepted: null == accepted
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserAgreementItemModelCopyWith<$Res>
    implements $UserAgreementItemModelCopyWith<$Res> {
  factory _$$_UserAgreementItemModelCopyWith(_$_UserAgreementItemModel value,
          $Res Function(_$_UserAgreementItemModel) then) =
      __$$_UserAgreementItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String type, int version, bool accepted});
}

/// @nodoc
class __$$_UserAgreementItemModelCopyWithImpl<$Res>
    extends _$UserAgreementItemModelCopyWithImpl<$Res,
        _$_UserAgreementItemModel>
    implements _$$_UserAgreementItemModelCopyWith<$Res> {
  __$$_UserAgreementItemModelCopyWithImpl(_$_UserAgreementItemModel _value,
      $Res Function(_$_UserAgreementItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? version = null,
    Object? accepted = null,
  }) {
    return _then(_$_UserAgreementItemModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      accepted: null == accepted
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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.accepted, accepted) ||
                other.accepted == accepted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, version, accepted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserAgreementItemModelCopyWith<_$_UserAgreementItemModel> get copyWith =>
      __$$_UserAgreementItemModelCopyWithImpl<_$_UserAgreementItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAgreementItemModelToJson(
      this,
    );
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
  int get id;
  @override
  String get type;
  @override
  int get version;
  @override
  bool get accepted;
  @override
  @JsonKey(ignore: true)
  _$$_UserAgreementItemModelCopyWith<_$_UserAgreementItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
