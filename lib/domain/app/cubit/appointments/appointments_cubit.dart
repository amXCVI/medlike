import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'appointments_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsListState> {
  AppointmentsCubit() : super(const AppointmentsListState.initial());
}
