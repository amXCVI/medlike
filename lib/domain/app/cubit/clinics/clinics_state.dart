part of 'clinics_cubit.dart';

enum GetAllClinicsListStatuses { initial, loading, success, failed }

enum GetPriceListStatuses { initial, loading, success, failed }

enum GetPromotionsListStatuses { initial, loading, success, failed }

enum GetMainscreenPromotionsListStatuses { initial, loading, success, failed }

enum GetRecommendationsListStatuses { initial, loading, success, failed }

@immutable
class ClinicsState {
  final GetAllClinicsListStatuses? getAllClinicsListStatus;
  final List<ClinicModel>? clinicsList;
  final List<PriceItemModel>? priceList;
  final GetPriceListStatuses? getPriceListStatus;
  final List<PriceItemModel>? filteredPriceList;
  final GetPromotionsListStatuses? getPromotionsListStatus;
  final List<ClinicPromotionModel>? promotionsList;
  final GetMainscreenPromotionsListStatuses? getMainscreenPromotionsListStatus;
  final List<MainscreenPromotionModel>? mainscreenPromotionsList;
  final List<BuildingLatLngModel>? allDownloadedBuildings;
  final GetRecommendationsListStatuses? getRecommendationsListStatus;
  final List<RecommendationByServiceModel>? recommendationsList;

  const ClinicsState({
    this.getAllClinicsListStatus = GetAllClinicsListStatuses.initial,
    this.clinicsList,
    this.priceList,
    this.getPriceListStatus = GetPriceListStatuses.initial,
    this.filteredPriceList,
    this.getPromotionsListStatus,
    this.promotionsList,
    this.getMainscreenPromotionsListStatus,
    this.mainscreenPromotionsList,
    this.allDownloadedBuildings,
    this.getRecommendationsListStatus,
    this.recommendationsList,
  });

  ClinicsState copyWith({
    GetAllClinicsListStatuses? getAllClinicsListStatus,
    List<ClinicModel>? clinicsList,
    List<PriceItemModel>? priceList,
    GetPriceListStatuses? getPriceListStatus,
    List<PriceItemModel>? filteredPriceList,
    GetPromotionsListStatuses? getPromotionsListStatus,
    List<ClinicPromotionModel>? promotionsList,
    GetMainscreenPromotionsListStatuses? getMainscreenPromotionsListStatus,
    List<MainscreenPromotionModel>? mainscreenPromotionsList,
    List<BuildingLatLngModel>? allDownloadedBuildings,
    GetRecommendationsListStatuses? getRecommendationsListStatus,
    List<RecommendationByServiceModel>? recommendationsList,
  }) {
    return ClinicsState(
      getAllClinicsListStatus:
          getAllClinicsListStatus ?? this.getAllClinicsListStatus,
      clinicsList: clinicsList ?? this.clinicsList,
      priceList: priceList ?? this.priceList,
      getPriceListStatus: getPriceListStatus ?? this.getPriceListStatus,
      filteredPriceList: filteredPriceList ?? this.filteredPriceList,
      getPromotionsListStatus:
          getPromotionsListStatus ?? this.getPromotionsListStatus,
      promotionsList: promotionsList ?? this.promotionsList,
      getMainscreenPromotionsListStatus: getMainscreenPromotionsListStatus ??
          this.getMainscreenPromotionsListStatus,
      mainscreenPromotionsList:
          mainscreenPromotionsList ?? this.mainscreenPromotionsList,
      allDownloadedBuildings:
          allDownloadedBuildings ?? this.allDownloadedBuildings,
      getRecommendationsListStatus:
          getRecommendationsListStatus ?? this.getRecommendationsListStatus,
      recommendationsList: recommendationsList ?? this.recommendationsList,
    );
  }

  List<Object?> get props => [];
}
