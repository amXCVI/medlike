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
    required String id,
    int? timeZoneOffset,
    String? clinicName,
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
    String? phone,
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

@freezed
class EsiaTokenAuthRequest with _$EsiaTokenAuthRequest {
  const factory EsiaTokenAuthRequest({
    required bool isUserExists,
    required EsiaTokenAuthSigninModelRequest? signinModel,
    required EsiaTokenAuthRegistrationModelRequest? registrationModel,
  }) = _EsiaTokenAuthRequest;

  factory EsiaTokenAuthRequest.fromJson(Map<String, Object?> json) =>
      _$EsiaTokenAuthRequestFromJson(json);
}

@freezed
class EsiaTokenAuthRegistrationModelRequest
    with _$EsiaTokenAuthRegistrationModelRequest {
  const factory EsiaTokenAuthRegistrationModelRequest({
    required String firstName,
    required String lastName,
    required String middleName,
    required String phoneNumber,
    required String snils,
    required int sex,
    required String birthday,
    required String passportSerial,
    required String passportNumber,
    required String passportIssueDate,
    required String passportIssueId,
  }) = _EsiaTokenAuthRegistrationModelRequest;

  factory EsiaTokenAuthRegistrationModelRequest.fromJson(
          Map<String, Object?> json) =>
      _$EsiaTokenAuthRegistrationModelRequestFromJson(json);
}

@freezed
class EsiaTokenAuthSigninModelRequest with _$EsiaTokenAuthSigninModelRequest {
  const factory EsiaTokenAuthSigninModelRequest({
    required String token,
    required String refreshToken,
  }) = _EsiaTokenAuthSigninModelRequest;

  factory EsiaTokenAuthSigninModelRequest.fromJson(Map<String, Object?> json) =>
      _$EsiaTokenAuthSigninModelRequestFromJson(json);
}

@freezed
class CreateUserProfileAndMedicalCardRequestModel
    with _$CreateUserProfileAndMedicalCardRequestModel {
  const factory CreateUserProfileAndMedicalCardRequestModel({
    required bool result,
    required String profileId,
    required String error,
    required CreateUserProfileAndMedicalCardIntegrationResponseModel
        integrationResponse,
    required bool forceToSite,
  }) = _CreateUserProfileAndMedicalCardRequestModel;

  factory CreateUserProfileAndMedicalCardRequestModel.fromJson(
          Map<String, Object?> json) =>
      _$CreateUserProfileAndMedicalCardRequestModelFromJson(json);
}

@freezed
class CreateUserProfileAndMedicalCardIntegrationResponseModel
    with _$CreateUserProfileAndMedicalCardIntegrationResponseModel {
  const factory CreateUserProfileAndMedicalCardIntegrationResponseModel({
    required bool result,
    required String profileId,
    required String errorCode,
    required String errorText,
    required String accountId,
    required bool forceErrorToSite,
  }) = _CreateUserProfileAndMedicalCardIntegrationResponseModel;

  factory CreateUserProfileAndMedicalCardIntegrationResponseModel.fromJson(
          Map<String, Object?> json) =>
      _$CreateUserProfileAndMedicalCardIntegrationResponseModelFromJson(json);
}
