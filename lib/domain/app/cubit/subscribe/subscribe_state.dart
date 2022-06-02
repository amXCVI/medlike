part of 'subscribe_cubit.dart';

enum GetAvailableClinicsListStatuses { initial, loading, success, failed }
enum GetServicesListStatuses { initial, loading, success, failed }

@immutable
class SubscribeState {
  final UserProfile? selectedUser;
  final GetAvailableClinicsListStatuses getAvailableClinicsStatus;
  final List<AvailableClinic>? availableClinicsList;
  final AvailableClinic? selectedBuilding;
  final GetServicesListStatuses getServicesListStatus;
  final List<NavigationItem>? servicesList;

  const SubscribeState({
    this.selectedUser,
    this.getAvailableClinicsStatus = GetAvailableClinicsListStatuses.loading,
    this.availableClinicsList,
    this.selectedBuilding,
    this.getServicesListStatus = GetServicesListStatuses.loading,
    this.servicesList,
  });

  SubscribeState copyWith({
    UserProfile? selectedUser,
    GetAvailableClinicsListStatuses? getAvailableClinicsStatus,
    List<AvailableClinic>? availableClinicsList,
    AvailableClinic? selectedBuilding,
    GetServicesListStatuses? getServicesListStatus,
    List<NavigationItem>? servicesList,
  }) {
    return SubscribeState(
      selectedUser: selectedUser ?? this.selectedUser,
      getAvailableClinicsStatus:
          getAvailableClinicsStatus ?? this.getAvailableClinicsStatus,
      availableClinicsList: availableClinicsList ?? this.availableClinicsList,
      selectedBuilding: selectedBuilding ?? this.selectedBuilding,
      getServicesListStatus: getServicesListStatus ?? this.getServicesListStatus,
      servicesList: servicesList ?? this.servicesList,
    );
  }

  List<Object?> get props => [];
}
