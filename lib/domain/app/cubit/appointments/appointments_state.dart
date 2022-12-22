part of 'appointments_cubit.dart';

enum GetAppointmentsStatuses { initial, loading, success, failed }

enum GetLastAppointmentStatuses { initial, loading, success, failed }

enum PutAppointmentsStatuses { initial, loading, success, failed }

enum DeleteAppointmentStatuses { initial, loading, success, failed }

@immutable
class AppointmentsState {
  final GetAppointmentsStatuses? getAppointmentsStatus;
  final List<AppointmentModelWithTimeZoneOffset>? appointmentsList;
  final List<AppointmentModelWithTimeZoneOffset>? filteredAppointmentsList;
  final List<AppointmentModelWithTimeZoneOffset>? selectedDayAppointmentsList;
  final PutAppointmentsStatuses? putAppointmentStatus;
  final DeleteAppointmentStatuses? deleteAppointmentStatus;
  final GetLastAppointmentStatuses? getLastAppointmentStatus;
  final AppointmentModelWithTimeZoneOffset? lastAppointment;
  final int? confirmCounter;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime selectedDate;

  AppointmentsState({
    this.getAppointmentsStatus,
    this.appointmentsList,
    this.lastAppointment,
    this.filteredAppointmentsList,
    this.selectedDayAppointmentsList,
    this.putAppointmentStatus,
    this.deleteAppointmentStatus,
    this.getLastAppointmentStatus,
    this.confirmCounter,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? selectedDate,
  })  : endDate =
            endDate ?? date_utils.DateUtils.lastDayOfMonth(DateTime.now()),
        startDate =
            startDate ?? date_utils.DateUtils.firstDayOfMonth(DateTime.now()),
        selectedDate = selectedDate ?? DateTime.now();

  AppointmentsState copyWith({
    GetAppointmentsStatuses? getAppointmentsStatus,
    List<AppointmentModelWithTimeZoneOffset>? appointmentsList,
    List<AppointmentModelWithTimeZoneOffset>? filteredAppointmentsList,
    List<AppointmentModelWithTimeZoneOffset>? selectedDayAppointmentsList,
    PutAppointmentsStatuses? putAppointmentStatus,
    DeleteAppointmentStatuses? deleteAppointmentStatus,
    GetLastAppointmentStatuses? getLastAppointmentStatus,
    AppointmentModelWithTimeZoneOffset? lastAppointment,
    int? confirmCounter,
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
      selectedDayAppointmentsList:
          selectedDayAppointmentsList ?? this.selectedDayAppointmentsList,
      putAppointmentStatus: putAppointmentStatus ?? this.putAppointmentStatus,
      deleteAppointmentStatus:
          deleteAppointmentStatus ?? this.deleteAppointmentStatus,
      getLastAppointmentStatus:
          getLastAppointmentStatus ?? this.getLastAppointmentStatus,
      lastAppointment: lastAppointment ?? this.lastAppointment,
      confirmCounter: confirmCounter ?? this.confirmCounter,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }

  AppointmentsState clearAppointment() {
    return AppointmentsState(
      getAppointmentsStatus:
          getAppointmentsStatus,
      appointmentsList: appointmentsList,
      filteredAppointmentsList:
          filteredAppointmentsList,
      selectedDayAppointmentsList:
          selectedDayAppointmentsList,
      putAppointmentStatus: putAppointmentStatus,
      deleteAppointmentStatus:
          deleteAppointmentStatus,
      getLastAppointmentStatus:
          getLastAppointmentStatus,
      confirmCounter: 0,
      startDate: startDate,
      endDate: endDate,
      selectedDate: selectedDate,
    );
  }
}
