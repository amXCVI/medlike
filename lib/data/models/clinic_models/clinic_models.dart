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

@freezed
class ClinicModel with _$ClinicModel {
  const factory ClinicModel({
    required String id,
    required String name,
    required int? timeZoneOffset,
    required List<BuildingModel> buildings,
  }) = _ClinicModel;

  factory ClinicModel.fromJson(Map<String, Object?> json) =>
      _$ClinicModelFromJson(json);
}

@freezed
class BuildingModel with _$BuildingModel {
  const factory BuildingModel({
    required String name,
    required String? departmentName,
    required String address,
    required String id,
    required String buildingId,
    required List<String> phone,
    required List<String> workTime,
  }) = _BuildingModel;

  factory BuildingModel.fromJson(Map<String, Object?> json) =>
      _$BuildingModelFromJson(json);
}

@freezed
class PriceItemModel with _$PriceItemModel {
  const factory PriceItemModel({
    required String title,
    required int price,
    required bool haveRecommendations,
    required String serviceId,
  }) = _PriceItemModel;

  factory PriceItemModel.fromJson(Map<String, Object?> json) =>
      _$PriceItemModelFromJson(json);
}