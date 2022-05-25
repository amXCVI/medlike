// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokenRequest _$AuthTokenRequestFromJson(Map<String, dynamic> json) =>
    AuthTokenRequest(
      json['phone'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$AuthTokenRequestToJson(AuthTokenRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
    };

AuthTokenResponse _$AuthTokenResponseFromJson(Map<String, dynamic> json) =>
    AuthTokenResponse(
      json['token'] as String,
      json['refreshToken'] as String,
    );

Map<String, dynamic> _$AuthTokenResponseToJson(AuthTokenResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };

UserProfileClinicBuilding _$UserProfileClinicBuildingFromJson(
        Map<String, dynamic> json) =>
    UserProfileClinicBuilding(
      json['id'] as String,
      (json['category'] as List<dynamic>).map((e) => e as String).toList(),
      json['telemed'] as bool,
    );

Map<String, dynamic> _$UserProfileClinicBuildingToJson(
        UserProfileClinicBuilding instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'telemed': instance.telemed,
    };

UserProfileClinic _$UserProfileClinicFromJson(Map<String, dynamic> json) =>
    UserProfileClinic(
      json['id'] as String,
      json['timeZoneOffset'] as int,
      (json['buildings'] as List<dynamic>)
          .map((e) =>
              UserProfileClinicBuilding.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserProfileClinicToJson(UserProfileClinic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timeZoneOffset': instance.timeZoneOffset,
      'buildings': instance.buildings.map((e) => e.toJson()).toList(),
    };

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      json['id'] as String,
      json['barCode'] as String,
      json['firstName'] as String,
      json['middleName'] as String,
      json['lastName'] as String,
      DateTime.parse(json['birthday'] as String),
      json['avatar'] as String,
      (json['clinics'] as List<dynamic>)
          .map((e) => UserProfileClinic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'barCode': instance.barCode,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'birthday': instance.birthday.toIso8601String(),
      'avatar': instance.avatar,
      'clinics': instance.clinics.map((e) => e.toJson()).toList(),
    };

GetProfilesResponse _$GetProfilesResponseFromJson(Map<String, dynamic> json) =>
    GetProfilesResponse(
      (json['profiles'] as List<dynamic>)
          .map((e) => UserProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetProfilesResponseToJson(
        GetProfilesResponse instance) =>
    <String, dynamic>{
      'profiles': instance.profiles.map((e) => e.toJson()).toList(),
    };
