import 'package:freezed_annotation'
    '/freezed_annotation.dart';

part 'clinic_models.freezed.dart';
part 'clinic_models.g.dart';

@freezed
class AvailableClinic with _$AvailableClinic {
  const factory AvailableClinic({
    required String name,
    required String? departmentName,
    required String address,
    required String id,
    required String buildingId,
    required List<String> phone,
    required List<String> workTime,
    required int timeZoneOffset,
  }) = _AvailableClinic;

  factory AvailableClinic.fromJson(Map<String, Object?> json) =>
      _$AvailableClinicFromJson(json);
}

@freezed
class AvailableClinicsList with _$AvailableClinicsList {
  const factory AvailableClinicsList({
    required List<AvailableClinic> availableClinicsList,
  }) = _AvailableClinicsList;

  factory AvailableClinicsList.fromJson(Map<String, Object?> json) =>
      _$AvailableClinicsListFromJson(json);
}