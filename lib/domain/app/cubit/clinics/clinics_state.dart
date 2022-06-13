part of 'clinics_cubit.dart';

enum GetAllClinicsListStatuses { initial, loading, success, failed }
enum GetPriceListStatuses { initial, loading, success, failed }

@immutable
class ClinicsState {
  final GetAllClinicsListStatuses? getAllClinicsListStatus;
  final List<ClinicModel>? clinicsList;
  final List<PriceItemModel>? priceList;
  final GetPriceListStatuses? getPriceListStatus;
  final List<PriceItemModel>? filteredPriceList;

  const ClinicsState({
    this.getAllClinicsListStatus = GetAllClinicsListStatuses.initial,
    this.clinicsList,
    this.priceList,
    this.getPriceListStatus = GetPriceListStatuses.initial,
    this.filteredPriceList,
  });

  ClinicsState copyWith({
    GetAllClinicsListStatuses? getAllClinicsListStatus,
    List<ClinicModel>? clinicsList,
    List<PriceItemModel>? priceList,
    GetPriceListStatuses? getPriceListStatus,
    List<PriceItemModel>? filteredPriceList
  }) {
    return ClinicsState(
      getAllClinicsListStatus:
          getAllClinicsListStatus ?? this.getAllClinicsListStatus,
      clinicsList: clinicsList ?? this.clinicsList,
      priceList: priceList ?? this.priceList,
      getPriceListStatus: getPriceListStatus ?? this.getPriceListStatus,
      filteredPriceList: filteredPriceList ?? this.filteredPriceList,
    );
  }

  List<Object?> get props => [];
}
