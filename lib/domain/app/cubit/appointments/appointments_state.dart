part of 'appointments_cubit.dart';

enum GetAppointmentsStatuses { initial, loading, success, failed }

@immutable
class AppointmentsState {
  final GetAppointmentsStatuses? getAppointmentsStatus;
  final List<AppointmentModel>? appointmentsList;
  final List<AppointmentModel>? filteredAppointmentsList;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime selectedDate;

  AppointmentsState({
    this.getAppointmentsStatus,
    this.appointmentsList,
    this.filteredAppointmentsList,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? selectedDate,
  })  : endDate = endDate ?? DateUtils.lastDayOfMonth(DateTime.now()),
        startDate = startDate ?? DateUtils.firstDayOfMonth(DateTime.now()),
        selectedDate = selectedDate ?? DateTime.now();

  AppointmentsState copyWith({
    GetAppointmentsStatuses? getAppointmentsStatus,
    List<AppointmentModel>? appointmentsList,
    List<AppointmentModel>? filteredAppointmentsList,
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
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }
}
