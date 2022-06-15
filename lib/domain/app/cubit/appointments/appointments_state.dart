part of 'appointments_cubit.dart';

enum GetAppointmentsStatuses { initial, loading, success, failed }

@immutable
class AppointmentsState {
  final GetAppointmentsStatuses? getAppointmentsStatus;
  final List<AppointmentModel>? appointmentsList;

  const AppointmentsState({
    this.getAppointmentsStatus,
    this.appointmentsList,
  });

  AppointmentsState copyWith({
    GetAppointmentsStatuses? getAppointmentsStatus,
    List<AppointmentModel>? appointmentsList,
  }) {
    return AppointmentsState(
      getAppointmentsStatus:
          getAppointmentsStatus ?? this.getAppointmentsStatus,
      appointmentsList: appointmentsList ?? this.appointmentsList,
    );
  }
}
