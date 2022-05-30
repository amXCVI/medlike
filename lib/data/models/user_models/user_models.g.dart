// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthTokenRequest _$$_AuthTokenRequestFromJson(Map<String, dynamic> json) =>
    _$_AuthTokenRequest(
      phone: json['phone'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$_AuthTokenRequestToJson(_$_AuthTokenRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
    };

_$_AuthTokenResponse _$$_AuthTokenResponseFromJson(Map<String, dynamic> json) =>
    _$_AuthTokenResponse(
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$_AuthTokenResponseToJson(
        _$_AuthTokenResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };

_$_UserProfileClinicBuilding _$$_UserProfileClinicBuildingFromJson(
        Map<String, dynamic> json) =>
    _$_UserProfileClinicBuilding(
      id: json['id'] as String,
      category:
          (json['category'] as List<dynamic>).map((e) => e as String).toList(),
      telemed: json['telemed'] as bool?,
    );

Map<String, dynamic> _$$_UserProfileClinicBuildingToJson(
        _$_UserProfileClinicBuilding instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'telemed': instance.telemed,
    };

_$_UserProfileClinic _$$_UserProfileClinicFromJson(Map<String, dynamic> json) =>
    _$_UserProfileClinic(
      id: json['id'] as String?,
      timeZoneOffset: json['timeZoneOffset'] as int?,
      buildings: (json['buildings'] as List<dynamic>?)
          ?.map((e) =>
              UserProfileClinicBuilding.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserProfileClinicToJson(
        _$_UserProfileClinic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timeZoneOffset': instance.timeZoneOffset,
      'buildings': instance.buildings,
    };

_$_UserProfile _$$_UserProfileFromJson(Map<String, dynamic> json) =>
    _$_UserProfile(
      id: json['id'] as String,
      barCode: json['barCode'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      avatar: json['avatar'] as String?,
      clinics: (json['clinics'] as List<dynamic>)
          .map((e) => UserProfileClinic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'barCode': instance.barCode,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'birthday': instance.birthday?.toIso8601String(),
      'avatar': instance.avatar,
      'clinics': instance.clinics,
    };

_$_UserProfilesList _$$_UserProfilesListFromJson(Map<String, dynamic> json) =>
    _$_UserProfilesList(
      userProfilesList: (json['userProfilesList'] as List<dynamic>)
          .map((e) => UserProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserProfilesListToJson(_$_UserProfilesList instance) =>
    <String, dynamic>{
      'userProfilesList': instance.userProfilesList,
    };
