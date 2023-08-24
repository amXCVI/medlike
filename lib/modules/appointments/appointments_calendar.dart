import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/calendar_models/calendar_models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';
import 'package:medlike/widgets/calendar/calendar.dart';

class AppointmentsCalendar extends StatelessWidget {
  const AppointmentsCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _setSelectedDate(CalendarModel selectedDay) {
      context.read<AppointmentsCubit>().setSelectedDate(selectedDay.date);
      if (selectedDay.hasAvailableCells || selectedDay.hasLogs) {}
    }

    void _setStartDate(DateTime date) {
      context.read<AppointmentsCubit>().setStartDate(date);
    }

    void _setEndDate(DateTime date) {
      context.read<AppointmentsCubit>().setEndDate(date);
    }

    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
      builder: (context, state) {
        return Calendar(
          isLoading:
              state.getAppointmentsStatus == GetAppointmentsStatuses.loading
                  ? true
                  : false,
          startDate: state.startDate,
          endDate: state.endDate,
          selectedDate: state.selectedDate,
          calendarList:
              state.getAppointmentsStatus == GetAppointmentsStatuses.success
                  ? state.globalFilteredAppointmentsList!
                      .map((e) => CalendarModel(
                            date: getAppointmentTimeObject(
                                e.appointmentDateTime, e.timeZoneOffset),
                            hasAvailableCells: false,
                            hasLogs: true,
                          ))
                      .toList()
                  : [],
          onChangeSelectedDate: _setSelectedDate,
          onChangeStartDate: _setStartDate,
          onChangeEndDate: _setEndDate,
        );
      },
    );
  }
}
