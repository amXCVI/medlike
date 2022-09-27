part of 'appointments_cubit.dart';

enum GetAppointmentsStatuses { initial, loading, success, failed }

enum GetLastAppointmentStatuses { initial, loading, success, failed }

enum PutAppointmentsStatuses {initial, loading, success, failed }

enum DeleteAppointmentStatuses { initial, loading, success, failed }

@immutable
class AppointmentsState {
  final GetAppointmentsStatuses? getAppointmentsStatus;
  final List<AppointmentModel>? appointmentsList;
  final List<AppointmentModel>? filteredAppointmentsList;
  final PutAppointmentsStatuses? putAppointmentStatus;
  final DeleteAppointmentStatuses? deleteAppointmentStatus;
  final GetLastAppointmentStatuses? getLastAppointmentStatus;
  final AppointmentModel? lastAppointment;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime selectedDate;

  AppointmentsState({
    this.getAppointmentsStatus,
    this.appointmentsList,
    this.lastAppointment,
    this.filteredAppointmentsList,
    this.putAppointmentStatus,
    this.deleteAppointmentStatus,
    this.getLastAppointmentStatus,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? selectedDate,
  })  : endDate = endDate ?? date_utils.DateUtils.lastDayOfMonth(DateTime.now()),
        startDate = startDate ?? date_utils.DateUtils.firstDayOfMonth(DateTime.now()),
        selectedDate = selectedDate ?? DateTime.now();

  AppointmentsState copyWith({
    GetAppointmentsStatuses? getAppointmentsStatus,
    List<AppointmentModel>? appointmentsList,
    List<AppointmentModel>? filteredAppointmentsList,
    PutAppointmentsStatuses? putAppointmentStatus,
    DeleteAppointmentStatuses? deleteAppointmentStatus,
    GetLastAppointmentStatuses? getLastAppointmentStatus,
    AppointmentModel? lastAppointment,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? selectedDate,
  }) {
    return AppointmentsState(
      getAppointmentsStatus:
          getAppointmentsStatus ?? this.getAppointmentsStatus,
      appointmentsList: appointmentsList ?? this.appointmentsList,
      filteredAppointmentsList:
          filteredAppointmentsList ?? this.filteredAppointmentsList,
      putAppointmentStatus:
          putAppointmentStatus ?? this.putAppointmentStatus,
      deleteAppointmentStatus:
          deleteAppointmentStatus ?? this.deleteAppointmentStatus,
      getLastAppointmentStatus:
          getLastAppointmentStatus ?? this.getLastAppointmentStatus,
      lastAppointment: 
          lastAppointment ?? this.lastAppointment,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }
}
