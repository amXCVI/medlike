import 'package:json_annotation/json_annotation.dart';

part 'user_models.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthTokenRequest {
  AuthTokenRequest(this.phone, this.password);

  final String phone;
  final String password;

  Map<String, dynamic> toJson() => _$AuthTokenRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AuthTokenResponse {
  AuthTokenResponse(this.token, this.refreshToken);

  final String token;
  final String refreshToken;

  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserProfileClinicBuilding {
  UserProfileClinicBuilding(this.id, this.category, this.telemed);

  final String id;
  final List<String> category;
  final bool telemed;

  factory UserProfileClinicBuilding.fromJson(Map<String, dynamic> json) =>
      _$UserProfileClinicBuildingFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileClinicBuildingToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserProfileClinic {
  UserProfileClinic(this.id, this.timeZoneOffset, this.buildings);

  final String id;
  final int timeZoneOffset;
  final List<UserProfileClinicBuilding> buildings;

  factory UserProfileClinic.fromJson(Map<String, dynamic> json) =>
      _$UserProfileClinicFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileClinicToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserProfile {
  UserProfile(this.id, this.barCode, this.firstName, this.middleName,
      this.lastName, this.birthday, this.avatar, this.clinics);

  final String id;
  final String barCode;
  final String firstName;
  final String middleName;
  final String lastName;
  final DateTime birthday;
  final String avatar;
  final List<UserProfileClinic> clinics;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProfilesResponse {
  GetProfilesResponse(this.profiles);

  final List<UserProfile> profiles;

  factory GetProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfilesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetProfilesResponseToJson(this);
}
