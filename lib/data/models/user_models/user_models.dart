import 'dart:io';
import 'dart:typed_data';

import 'package:freezed_annotation'
    '/freezed_annotation.dart';

part 'user_models.freezed.dart';

part 'user_models.g.dart';

@freezed
class AuthTokenRequest with _$AuthTokenRequest {
  const factory AuthTokenRequest({
    required String phone,
    required String password,
  }) = _AuthTokenRequest;

  factory AuthTokenRequest.fromJson(Map<String, Object?> json) =>
      _$AuthTokenRequestFromJson(json);
}

@freezed
class AuthTokenResponse with _$AuthTokenResponse {
  const factory AuthTokenResponse({
    required String token,
    required String refreshToken,
    required int? tryCount,
  }) = _AuthTokenResponse;

  factory AuthTokenResponse.fromJson(Map<String, Object?> json) =>
      _$AuthTokenResponseFromJson(json);
}

@freezed
class AuthSmartappTokenResponse with _$AuthSmartappTokenResponse {
  const factory AuthSmartappTokenResponse({
    int? statusCode,
    required String token,
    required String refreshToken,
  }) = _AuthSmartappTokenResponse;

  factory AuthSmartappTokenResponse.fromJson(Map<String, Object?> json) =>
      _$AuthSmartappTokenResponseFromJson(json);
}

@freezed
class AuthTokenResponseError with _$AuthTokenResponseError {
  const factory AuthTokenResponseError({
    required String message,
    required int tryCount,
  }) = _AuthTokenResponseError;

  factory AuthTokenResponseError.fromJson(Map<String, Object?> json) =>
      _$AuthTokenResponseErrorFromJson(json);
}

@freezed
class RefreshTokenResponseModel with _$RefreshTokenResponseModel {
  const factory RefreshTokenResponseModel({
    required String token,
    required String refreshToken,
  }) = _RefreshTokenResponseModel;

  factory RefreshTokenResponseModel.fromJson(Map<String, Object?> json) =>
      _$RefreshTokenResponseModelFromJson(json);
}

@freezed
class UserProfileClinicBuilding with _$UserProfileClinicBuilding {
  const factory UserProfileClinicBuilding({
    required String id,
    required List<String> category,
    bool? telemed,
  }) = _UserProfileClinicBuilding;

  factory UserProfileClinicBuilding.fromJson(Map<String, Object?> json) =>
      _$UserProfileClinicBuildingFromJson(json);
}

@freezed
class UserProfileClinic with _$UserProfileClinic {
  const factory UserProfileClinic({
    String? id,
    int? timeZoneOffset,
    List<UserProfileClinicBuilding>? buildings,
  }) = _UserProfileClinic;

  factory UserProfileClinic.fromJson(Map<String, Object?> json) =>
      _$UserProfileClinicFromJson(json);
}

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    String? barCode,
    String? firstName,
    String? middleName,
    String? lastName,
    DateTime? birthday,
    String? avatar,
    required List<UserProfileClinic> clinics,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, Object?> json) =>
      _$UserProfileFromJson(json);
}

@freezed
class UserProfilesList with _$UserProfilesList {
  const factory UserProfilesList({
    required List<UserProfile> userProfilesList,
  }) = _UserProfilesList;

  factory UserProfilesList.fromJson(Map<String, Object?> json) =>
      _$UserProfilesListFromJson(json);
}

@freezed
class CheckUserAccountResponse with _$CheckUserAccountResponse {
  const factory CheckUserAccountResponse({
    required bool? found,
    required String? message,
  }) = _CheckUserAccountResponse;

  factory CheckUserAccountResponse.fromJson(Map<String, Object?> json) =>
      _$CheckUserAccountResponseFromJson(json);
}

@freezed
class UserAgreementsModel with _$UserAgreementsModel {
  const factory UserAgreementsModel({
    required int id,
    required String type,
    required int version,
    required bool accepted,
  }) = _UserAgreementsModel;

  factory UserAgreementsModel.fromJson(Map<String, Object?> json) =>
      _$UserAgreementsModelFromJson(json);
}

@freezed
class UserAgreementDocumentModel with _$UserAgreementDocumentModel {
  const factory UserAgreementDocumentModel({
    required String body,
  }) = _UserAgreementDocumentModel;

  factory UserAgreementDocumentModel.fromJson(Map<String, Object?> json) =>
      _$UserAgreementDocumentModelFromJson(json);
}

@freezed
class UserUploadAvatarResponseModel with _$UserUploadAvatarResponseModel {
  const factory UserUploadAvatarResponseModel({
    required String result,
    required String? information,
  }) = _UserUploadAvatarResponseModel;

  factory UserUploadAvatarResponseModel.fromJson(Map<String, Object?> json) =>
      _$UserUploadAvatarResponseModelFromJson(json);
}

@freezed
class UserAgreementItemModel with _$UserAgreementItemModel {
  const factory UserAgreementItemModel({
    required int id,
    required String type,
    required int version,
    required bool accepted,
  }) = _UserAgreementItemModel;

  factory UserAgreementItemModel.fromJson(Map<String, Object?> json) =>
      _$UserAgreementItemModelFromJson(json);
}

class SupportAttachedFileModel {
  final Uint8List fileBytes;
  final File? file;
  final String fileName;
  final int size;
  final String fileType;

  SupportAttachedFileModel({
    required this.fileBytes,
    this.file,
    required this.fileName,
    required this.size,
    required this.fileType,
  });
}
