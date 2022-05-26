part of 'appointments_cubit.dart';

@immutable
abstract class AppointmentsState {}

enum ListLoadAppointmentsStatus { initial, loadingAppointments, successLoadedAppointments, failureLoadedAppoinments }

class AppointmentsListState extends Equatable {
  const AppointmentsListState._({
    this.status = ListLoadAppointmentsStatus.initial,
    this.appointmentsList,
    this.error,
  });

  const AppointmentsListState.initial() : this._();

  final ListLoadAppointmentsStatus status;
  final List<Object>? appointmentsList;
  final String? error;

  @override
  List<Object?> get props => [status, appointmentsList, error];
}
