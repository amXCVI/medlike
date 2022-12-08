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

@freezed
class ClinicPromotionModel with _$ClinicPromotionModel {
  const factory ClinicPromotionModel({
    required String id,
    required String name,
    required String description,
    required DateTime dateFrom,
    required DateTime dateTo,
    required int defaultPrice,
    required int promoPrice,
  }) = _ClinicPromotionModel;

  factory ClinicPromotionModel.fromJson(Map<String, Object?> json) =>
      _$ClinicPromotionModelFromJson(json);
}

@freezed
class MainscreenPromotionModel with _$MainscreenPromotionModel {
  const factory MainscreenPromotionModel({
    required String id,
    required String clinicId,
    required String name,
    required String description,
    required int defaultPrice,
    required int promoPrice,
    required String? fileName,
  }) = _MainscreenPromotionModel;

  factory MainscreenPromotionModel.fromJson(Map<String, Object?> json) =>
      _$MainscreenPromotionModelFromJson(json);
}

@freezed
class BuildingLatLngModel with _$BuildingLatLngModel {
  const factory BuildingLatLngModel({
    required String name,
    required String? departmentName,
    required String address,
    required String id,
    required String buildingId,
    required List<String> phone,
    required List<String> workTime,
    required double latitude,
    required double longitude,
  }) = _BuildingLatLngModel;

  factory BuildingLatLngModel.fromJson(Map<String, Object?> json) =>
      _$BuildingLatLngModelFromJson(json);
}

@freezed
class RecommendationByServiceModel with _$RecommendationByServiceModel {
  const factory RecommendationByServiceModel({
    required String serviceId,
    required String serviceName,
    required String recommendation,
  }) = _RecommendationByServiceModel;

  factory RecommendationByServiceModel.fromJson(Map<String, Object?> json) =>
      _$RecommendationByServiceModelFromJson(json);
}
