part of 'subscribe_cubit.dart';

enum GetAvailableClinicsListStatuses { initial, loading, success, failed }

enum GetServicesListStatuses { initial, loading, success, failed }

enum GetResearchesListStatuses { initial, loading, success, failed }

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

  const SubscribeState({
    this.selectedUser,
    this.getAvailableClinicsStatus = GetAvailableClinicsListStatuses.loading,
    this.availableClinicsList,
    this.selectedBuilding,
    this.getServicesListStatus = GetServicesListStatuses.loading,
    this.servicesList,
    this.selectedService,
    this.getResearchesListStatus = GetResearchesListStatuses.initial,
    this.researchesList,
    this.selectedResearchesIds,
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
    );
  }

  List<Object?> get props => [];
}
