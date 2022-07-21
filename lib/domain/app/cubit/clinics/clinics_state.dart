part of 'clinics_cubit.dart';

enum GetAllClinicsListStatuses { initial, loading, success, failed }
enum GetPriceListStatuses { initial, loading, success, failed }
enum GetPromotionsListStatuses { initial, loading, success, failed }

@immutable
class ClinicsState {
  final GetAllClinicsListStatuses? getAllClinicsListStatus;
  final List<ClinicModel>? clinicsList;
  final List<PriceItemModel>? priceList;
  final GetPriceListStatuses? getPriceListStatus;
  final List<PriceItemModel>? filteredPriceList;
  final GetPromotionsListStatuses? getPromotionsListStatus;
  final List<ClinicPromotionModel>? promotionsList;

  const ClinicsState({
    this.getAllClinicsListStatus = GetAllClinicsListStatuses.initial,
    this.clinicsList,
    this.priceList,
    this.getPriceListStatus = GetPriceListStatuses.initial,
    this.filteredPriceList,
    this.getPromotionsListStatus,
    this.promotionsList,
  });

  ClinicsState copyWith({
    GetAllClinicsListStatuses? getAllClinicsListStatus,
    List<ClinicModel>? clinicsList,
    List<PriceItemModel>? priceList,
    GetPriceListStatuses? getPriceListStatus,
    List<PriceItemModel>? filteredPriceList,
    GetPromotionsListStatuses? getPromotionsListStatus,
    List<ClinicPromotionModel>? promotionsList,
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
    );
  }

  List<Object?> get props => [];
}
