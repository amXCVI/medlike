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
  $Res call({String token, String refreshToken});
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
abstract class _$$_AuthTokenResponseCopyWith<$Res>
    implements $AuthTokenResponseCopyWith<$Res> {
  factory _$$_AuthTokenResponseCopyWith(_$_AuthTokenResponse value,
          $Res Function(_$_AuthTokenResponse) then) =
      __$$_AuthTokenResponseCopyWithImpl<$Res>;
  @override
  $Res call({String token, String refreshToken});
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthTokenResponse implements _AuthTokenResponse {
  const _$_AuthTokenResponse({required this.token, required this.refreshToken});

  factory _$_AuthTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AuthTokenResponseFromJson(json);

  @override
  final String token;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'AuthTokenResponse(token: $token, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthTokenResponse &&
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
      required final String refreshToken}) = _$_AuthTokenResponse;

  factory _AuthTokenResponse.fromJson(Map<String, dynamic> json) =
      _$_AuthTokenResponse.fromJson;

  @override
  String get token => throw _privateConstructorUsedError;
  @override
  String get refreshToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthTokenResponseCopyWith<_$_AuthTokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
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
  bool get found => throw _privateConstructorUsedError;
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
  $Res call({bool found, String? message});
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
              as bool,
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
  $Res call({bool found, String? message});
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
              as bool,
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
  final bool found;
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
      {required final bool found,
      required final String? message}) = _$_CheckUserAccountResponse;

  factory _CheckUserAccountResponse.fromJson(Map<String, dynamic> json) =
      _$_CheckUserAccountResponse.fromJson;

  @override
  bool get found => throw _privateConstructorUsedError;
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
