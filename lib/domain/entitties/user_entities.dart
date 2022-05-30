class UserProfileEntity {
  final String id;
  final String? barCode;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final DateTime? birthday;
  final String? avatar;
  final List<UserProfileClinicEntity>? clinics;

  UserProfileEntity({
    required this.id,
    this.barCode,
    this.firstName,
    this.middleName,
    this.lastName,
    this.birthday,
    this.avatar,
    this.clinics,
  });
}

class UserProfileClinicEntity {
  final String id;
  final int? timeZoneOffset;
  final List<UserProfileClinicBuildingEntity> buildings;

  UserProfileClinicEntity({
    required this.id,
    this.timeZoneOffset,
    required this.buildings,
  });
}

class UserProfileClinicBuildingEntity {
  final String id;
  final List<String> category;
  final bool? telemed;

  UserProfileClinicBuildingEntity({
    required this.id,
    required this.category,
    this.telemed,
  });
}
