part of 'clinics_cubit.dart';

enum GetAllClinicsListStatuses { initial, loading, success, failed }
enum GetPriceListStatuses { initial, loading, success, failed }
enum GetPromotionsListStatuses { initial, loading, success, failed }
enum GetMainscreenPromotionsListStatuses { initial, loading, success, failed }

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
    );
  }

  List<Object?> get props => [];
}
