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
  }) = _AuthTokenResponse;

  factory AuthTokenResponse.fromJson(Map<String, Object?> json) =>
      _$AuthTokenResponseFromJson(json);
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
