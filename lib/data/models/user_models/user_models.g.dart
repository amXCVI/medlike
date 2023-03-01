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
      tryCount: json['tryCount'] as int?,
    );

Map<String, dynamic> _$$_AuthTokenResponseToJson(
        _$_AuthTokenResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'tryCount': instance.tryCount,
    };

_$_AuthSmartappTokenResponse _$$_AuthSmartappTokenResponseFromJson(
        Map<String, dynamic> json) =>
    _$_AuthSmartappTokenResponse(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$_AuthSmartappTokenResponseToJson(
        _$_AuthSmartappTokenResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };

_$_AuthTokenResponseError _$$_AuthTokenResponseErrorFromJson(
        Map<String, dynamic> json) =>
    _$_AuthTokenResponseError(
      message: json['message'] as String,
      tryCount: json['tryCount'] as int,
    );

Map<String, dynamic> _$$_AuthTokenResponseErrorToJson(
        _$_AuthTokenResponseError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'tryCount': instance.tryCount,
    };

_$_RefreshTokenResponseModel _$$_RefreshTokenResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_RefreshTokenResponseModel(
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$_RefreshTokenResponseModelToJson(
        _$_RefreshTokenResponseModel instance) =>
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

_$_CheckUserAccountResponse _$$_CheckUserAccountResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CheckUserAccountResponse(
      found: json['found'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_CheckUserAccountResponseToJson(
        _$_CheckUserAccountResponse instance) =>
    <String, dynamic>{
      'found': instance.found,
      'message': instance.message,
    };

_$_UserAgreementsModel _$$_UserAgreementsModelFromJson(
        Map<String, dynamic> json) =>
    _$_UserAgreementsModel(
      id: json['id'] as int,
      type: json['type'] as String,
      version: json['version'] as int,
      accepted: json['accepted'] as bool,
    );

Map<String, dynamic> _$$_UserAgreementsModelToJson(
        _$_UserAgreementsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'version': instance.version,
      'accepted': instance.accepted,
    };

_$_UserAgreementDocumentModel _$$_UserAgreementDocumentModelFromJson(
        Map<String, dynamic> json) =>
    _$_UserAgreementDocumentModel(
      body: json['body'] as String,
    );

Map<String, dynamic> _$$_UserAgreementDocumentModelToJson(
        _$_UserAgreementDocumentModel instance) =>
    <String, dynamic>{
      'body': instance.body,
    };

_$_UserUploadAvatarResponseModel _$$_UserUploadAvatarResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_UserUploadAvatarResponseModel(
      result: json['result'] as String,
      information: json['information'] as String?,
    );

Map<String, dynamic> _$$_UserUploadAvatarResponseModelToJson(
        _$_UserUploadAvatarResponseModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'information': instance.information,
    };

_$_UserAgreementItemModel _$$_UserAgreementItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_UserAgreementItemModel(
      id: json['id'] as int,
      type: json['type'] as String,
      version: json['version'] as int,
      accepted: json['accepted'] as bool,
    );

Map<String, dynamic> _$$_UserAgreementItemModelToJson(
        _$_UserAgreementItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'version': instance.version,
      'accepted': instance.accepted,
    };
