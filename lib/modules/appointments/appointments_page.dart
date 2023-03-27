import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/modules/appointments/appointments_calendar.dart';
import 'package:medlike/modules/appointments/appointments_list.dart';
import 'package:medlike/modules/appointments/appointments_list_skeleton.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/utils/helpers/date_helpers.dart' as date_utils;
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({
    Key? key, 
    this.isRefresh = false,
    this.initDay
  }) : super(key: key);

  /// Используется для принудительной подгрузки данных.
  /// При переходе в мои приемы со страницы записи, например
  final bool? isRefresh;

  /// Принудительно открываем нужную дату при необходимости
  final DateTime? initDay;

  @override
  Widget build(BuildContext context) {
    Future<void> _onLoadDada({
      bool isRefresh = true, 
      DateTime? initDay
    }) async {
      if(initDay != null) {
        DateTime dateFrom = date_utils.DateUtils.firstDayOfWeek(initDay);
        DateTime dateTo = date_utils.DateUtils.lastDayOfWeekWithHours(initDay);

        context.read<AppointmentsCubit>().setStartDate(dateFrom);
        context.read<AppointmentsCubit>().setEndDate(dateTo);

        context.read<AppointmentsCubit>().setSelectedDate(initDay);
      } 
      context.read<AppointmentsCubit>().getAppointmentsList(isRefresh);
    }

    _onLoadDada(isRefresh: isRefresh as bool, initDay: initDay);

    return WillPopScope(
      onWillPop: () async {
        context.router.navigateNamed(AppRoutes.main);
        return false;
      },
      child: DefaultScaffold(
        appBarTitle: 'Мои приемы',
        child: RefreshIndicator(
          onRefresh: () {
            return _onLoadDada(isRefresh: true);
          },
          child: DefaultScrollbar(
            child: ListView(
              shrinkWrap: true,
              children: [
                const AppointmentsCalendar(),
                const SizedBox(height: 16),
                BlocBuilder<AppointmentsCubit, AppointmentsState>(
                  builder: (context, state) {
                    if (state.getAppointmentsStatus ==
                        GetAppointmentsStatuses.failed) {
                      return const Text('');
                    } else if (state.getAppointmentsStatus ==
                        GetAppointmentsStatuses.success) {
                      return AppointmentsList(
                        appointmentsList: state.filteredAppointmentsList
                            as List<AppointmentModelWithTimeZoneOffset>,
                        onRefreshData: _onLoadDada,
                      );
                    } else {
                      return const AppointmentsListSkeleton();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
