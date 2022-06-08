part of 'subscribe_cubit.dart';

enum GetAvailableClinicsListStatuses { initial, loading, success, failed }

enum GetServicesListStatuses { initial, loading, success, failed }

enum GetResearchesListStatuses { initial, loading, success, failed }

enum GetSpecialisationsListStatuses { initial, loading, success, failed }

enum GetDoctorsListStatuses { initial, loading, success, failed }

enum GetCabinetsListStatuses { initial, loading, success, failed }

enum GetFavoriteDoctorsListStatuses { initial, loading, success, failed }

@immutable
class SubscribeState {
  final UserProfile? selectedUser;

  final GetAvailableClinicsListStatuses getAvailableClinicsStatus;
  final List<AvailableClinic>? availableClinicsList;
  final AvailableClinic? selectedBuilding;

  final GetServicesListStatuses getServicesListStatus;
  final List<NavigationItem>? servicesList;
  final NavigationItem? selectedService;

  final GetResearchesListStatuses getResearchesListStatus;
  final List<Research>? researchesList;
  final List<String>? selectedResearchesIds;

  final GetSpecialisationsListStatuses? getSpecialisationsListStatus;
  final List<NavigationItem>? specialisationsList;
  final NavigationItem? selectedSpecialisation;
  final List<NavigationItem>? filteredSpecialisationsList;

  final GetDoctorsListStatuses? getDoctorsListStatus;
  final List<Doctor>? doctorsList;
  final Doctor? selectedDoctor;

  final GetCabinetsListStatuses? getCabinetsListStatus;
  final List<Cabinet>? cabinetsList;
  final Cabinet? selectedCabinet;

  final GetFavoriteDoctorsListStatuses? getFavoriteDoctorsListStatus;
  final List<FavoriteDoctor>? favoriteDoctorsList;

  const SubscribeState({
    this.selectedUser,
    this.getAvailableClinicsStatus = GetAvailableClinicsListStatuses.initial,
    this.availableClinicsList,
    this.selectedBuilding,
    this.getServicesListStatus = GetServicesListStatuses.initial,
    this.servicesList,
    this.selectedService,
    this.getResearchesListStatus = GetResearchesListStatuses.initial,
    this.researchesList,
    this.selectedResearchesIds,
    this.getSpecialisationsListStatus = GetSpecialisationsListStatuses.initial,
    this.specialisationsList,
    this.selectedSpecialisation,
    this.filteredSpecialisationsList,
    this.getDoctorsListStatus = GetDoctorsListStatuses.initial,
    this.doctorsList,
    this.selectedDoctor,
    this.getCabinetsListStatus = GetCabinetsListStatuses.initial,
    this.cabinetsList,
    this.selectedCabinet,
    this.getFavoriteDoctorsListStatus,
    this.favoriteDoctorsList,
  });

  SubscribeState copyWith({
    UserProfile? selectedUser,
    GetAvailableClinicsListStatuses? getAvailableClinicsStatus,
    List<AvailableClinic>? availableClinicsList,
    AvailableClinic? selectedBuilding,
    GetServicesListStatuses? getServicesListStatus,
    List<NavigationItem>? servicesList,
    NavigationItem? selectedService,
    GetResearchesListStatuses? getResearchesListStatus,
    List<Research>? researchesList,
    List<String>? selectedResearchesIds,
    GetSpecialisationsListStatuses? getSpecialisationsListStatus,
    List<NavigationItem>? specialisationsList,
    NavigationItem? selectedSpecialisation,
    List<NavigationItem>? filteredSpecialisationsList,
    GetDoctorsListStatuses? getDoctorsListStatus,
    List<Doctor>? doctorsList,
    Doctor? selectedDoctor,
    GetCabinetsListStatuses? getCabinetsListStatus,
    List<Cabinet>? cabinetsList,
    Cabinet? selectedCabinet,
    GetFavoriteDoctorsListStatuses? getFavoriteDoctorsListStatus,
    List<FavoriteDoctor>? favoriteDoctorsList,
  }) {
    return SubscribeState(
      selectedUser: selectedUser ?? this.selectedUser,
      getAvailableClinicsStatus:
          getAvailableClinicsStatus ?? this.getAvailableClinicsStatus,
      availableClinicsList: availableClinicsList ?? this.availableClinicsList,
      selectedBuilding: selectedBuilding ?? this.selectedBuilding,
      getServicesListStatus:
          getServicesListStatus ?? this.getServicesListStatus,
      servicesList: servicesList ?? this.servicesList,
      selectedService: selectedService ?? this.selectedService,
      getResearchesListStatus:
          getResearchesListStatus ?? this.getResearchesListStatus,
      researchesList: researchesList ?? this.researchesList,
      selectedResearchesIds:
          selectedResearchesIds ?? this.selectedResearchesIds,
      getSpecialisationsListStatus:
          getSpecialisationsListStatus ?? this.getSpecialisationsListStatus,
      specialisationsList: specialisationsList ?? this.specialisationsList,
      selectedSpecialisation:
          selectedSpecialisation ?? this.selectedSpecialisation,
      filteredSpecialisationsList: filteredSpecialisationsList ?? this.filteredSpecialisationsList,
      getDoctorsListStatus: getDoctorsListStatus ?? this.getDoctorsListStatus,
      doctorsList: doctorsList ?? this.doctorsList,
      selectedDoctor: selectedDoctor ?? this.selectedDoctor,
      getCabinetsListStatus:
          getCabinetsListStatus ?? this.getCabinetsListStatus,
      cabinetsList: cabinetsList ?? this.cabinetsList,
      selectedCabinet: selectedCabinet ?? this.selectedCabinet,
      getFavoriteDoctorsListStatus: getFavoriteDoctorsListStatus ?? this.getFavoriteDoctorsListStatus,
      favoriteDoctorsList: favoriteDoctorsList ?? this.favoriteDoctorsList,
    );
  }

  List<Object?> get props => [];
}
