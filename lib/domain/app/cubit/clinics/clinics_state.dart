part of 'clinics_cubit.dart';

enum GetAllClinicsListStatuses { initial, loading, success, failed }

@immutable
class ClinicsState {
  final GetAllClinicsListStatuses? getAllClinicsListStatus;
  final List<ClinicModel>? clinicsList;

  const ClinicsState({
    this.getAllClinicsListStatus,
    this.clinicsList,
  });

  ClinicsState copyWith({
    GetAllClinicsListStatuses? getAllClinicsListStatus,
    List<ClinicModel>? clinicsList,
  }) {
    return ClinicsState(
      getAllClinicsListStatus:
          getAllClinicsListStatus ?? this.getAllClinicsListStatus,
      clinicsList: clinicsList ?? this.clinicsList,
    );
  }

  List<Object?> get props => [];
}
