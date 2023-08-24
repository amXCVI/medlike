part of 'appointments_cubit.dart';

enum GetAppointmentsStatuses { initial, loading, success, failed }

enum GetLastAppointmentStatuses { initial, loading, success, failed }

enum PutAppointmentsStatuses { initial, loading, success, failed }

enum DeleteAppointmentStatuses { initial, loading, success, failed }

enum GetAppointmentStatuses { initial, loading, success, failed }

enum SendAppointmentReviewStatuses { initial, loading, success, failed }

@immutable
class AppointmentsState {
  final GetAppointmentsStatuses? getAppointmentsStatus;
  final List<AppointmentModelWithTimeZoneOffset>? appointmentsList;
  List<AppointmentModelWithTimeZoneOffset>?
      globalFilteredAppointmentsList; // приемы в календарь, отфильтрованные по пользователю
  final List<AppointmentModelWithTimeZoneOffset>? filteredAppointmentsList;
  final List<AppointmentModelWithTimeZoneOffset>? selectedDayAppointmentsList;
  final PutAppointmentsStatuses? putAppointmentStatus;
  final DeleteAppointmentStatuses? deleteAppointmentStatus;
  final GetLastAppointmentStatuses? getLastAppointmentStatus;
  final AppointmentModelWithTimeZoneOffset? lastAppointment;
  final int? confirmCounter;
  final String? appointmentLoadingId;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime selectedDate;
  final GetAppointmentStatuses? getAppointmentStatus;
  final AppointmentModel? selectedAppointment;
  final SendAppointmentReviewStatuses? sendAppointmentReviewStatus;
  final String? selectedAppointmentFilterId;

  AppointmentsState({
    this.getAppointmentsStatus,
    this.appointmentsList,
    this.lastAppointment,
    this.globalFilteredAppointmentsList,
    this.filteredAppointmentsList,
    this.selectedDayAppointmentsList,
    this.putAppointmentStatus,
    this.deleteAppointmentStatus,
    this.getLastAppointmentStatus,
    this.confirmCounter,
    this.appointmentLoadingId,
    this.getAppointmentStatus,
    this.selectedAppointment,
    this.sendAppointmentReviewStatus,
    this.selectedAppointmentFilterId = '',
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
    List<AppointmentModelWithTimeZoneOffset>?
        globalFilteredAppointmentsList, // приемы в календарь, отфильтрованные по пользователю
    List<AppointmentModelWithTimeZoneOffset>? filteredAppointmentsList,
    List<AppointmentModelWithTimeZoneOffset>? selectedDayAppointmentsList,
    PutAppointmentsStatuses? putAppointmentStatus,
    DeleteAppointmentStatuses? deleteAppointmentStatus,
    GetLastAppointmentStatuses? getLastAppointmentStatus,
    AppointmentModelWithTimeZoneOffset? lastAppointment,
    int? confirmCounter,
    String? appointmentLoadingId,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? selectedDate,
    GetAppointmentStatuses? getAppointmentStatus,
    AppointmentModel? selectedAppointment,
    SendAppointmentReviewStatuses? sendAppointmentReviewStatus,
    String? selectedAppointmentFilterId,
  }) {
    return AppointmentsState(
      getAppointmentsStatus:
          getAppointmentsStatus ?? this.getAppointmentsStatus,
      appointmentsList: appointmentsList ?? this.appointmentsList,
      globalFilteredAppointmentsList:
          globalFilteredAppointmentsList ?? this.globalFilteredAppointmentsList,
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
      appointmentLoadingId: appointmentLoadingId ?? this.appointmentLoadingId,
      getAppointmentStatus: getAppointmentStatus ?? this.getAppointmentStatus,
      selectedAppointment: selectedAppointment ?? this.selectedAppointment,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      selectedDate: selectedDate ?? this.selectedDate,
      sendAppointmentReviewStatus:
          sendAppointmentReviewStatus ?? this.sendAppointmentReviewStatus,
      selectedAppointmentFilterId:
          selectedAppointmentFilterId ?? this.selectedAppointmentFilterId,
    );
  }

  AppointmentsState clearAppointment() {
    return AppointmentsState(
      getAppointmentsStatus: getAppointmentsStatus,
      appointmentsList: appointmentsList,
      globalFilteredAppointmentsList: globalFilteredAppointmentsList,
      filteredAppointmentsList: filteredAppointmentsList,
      selectedDayAppointmentsList: selectedDayAppointmentsList,
      putAppointmentStatus: putAppointmentStatus,
      deleteAppointmentStatus: deleteAppointmentStatus,
      getLastAppointmentStatus: getLastAppointmentStatus,
      lastAppointment: null,
      confirmCounter: null,
      appointmentLoadingId: null,
      startDate: startDate,
      endDate: endDate,
      selectedDate: selectedDate,
      sendAppointmentReviewStatus: sendAppointmentReviewStatus,
      selectedAppointmentFilterId: '',
    );
  }
}
