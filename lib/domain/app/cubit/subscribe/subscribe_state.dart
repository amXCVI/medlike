part of 'subscribe_cubit.dart';

enum GetAvailableClinicsListStatuses { initial, loading, success, failed }

@immutable
class SubscribeState {
  final UserProfile? selectedUser;
  final GetAvailableClinicsListStatuses getAvailableClinicsStatus;
  final List<AvailableClinic>? availableClinicsList;

  const SubscribeState({
    this.selectedUser,
    this.getAvailableClinicsStatus = GetAvailableClinicsListStatuses.loading,
    this.availableClinicsList,
  });

  SubscribeState copyWith({
    UserProfile? selectedUser,
    GetAvailableClinicsListStatuses? getAvailableClinicsStatus,
    List<AvailableClinic>? availableClinicsList,
  }) {
    return SubscribeState(
      selectedUser: selectedUser ?? this.selectedUser,
      getAvailableClinicsStatus: getAvailableClinicsStatus ?? this.getAvailableClinicsStatus,
      availableClinicsList: availableClinicsList ?? this.availableClinicsList,
    );
  }

  List<Object?> get props => [];
}
