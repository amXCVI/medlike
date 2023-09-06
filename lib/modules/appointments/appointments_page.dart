import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/appointments/appointments_calendar.dart';
import 'package:medlike/modules/appointments/appointments_filters_widget.dart';
import 'package:medlike/modules/appointments/appointments_list.dart';
import 'package:medlike/modules/appointments/appointments_list_skeleton.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/app_bar/medcard_app_bar/medcard_app_bar.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/utils/helpers/date_helpers.dart' as date_utils;
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';

@RoutePage()
class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage(
      {Key? key, this.isRefresh = false, this.initDay, this.notificationId})
      : super(key: key);

  /// Используется для принудительной подгрузки данных.
  /// При переходе в мои приемы со страницы записи, например
  final bool? isRefresh;

  /// Принудительно открываем нужную дату при необходимости
  final DateTime? initDay;

  /// Закрываем уведомление при необходимости
  final String? notificationId;

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  late bool isFilteringMode = false;
  late bool isShowingFilters = false;
  GlobalKey widgetOverBodyGlobalKey = GlobalKey();

  @override
  void initState() {
    handleResetFilters();
    _onLoadDada(isRefresh: widget.isRefresh as bool, initDay: widget.initDay);
    super.initState();
  }

  void handleTapOnFiltersButton() {
    if (isFilteringMode) {
      setState(() {
        isShowingFilters = true;
        isFilteringMode = false;
      });
    } else {
      setState(() {
        isFilteringMode = true;
      });
    }
  }

  void handleResetFilters() {
    setState(() {
      isShowingFilters = false;
      isFilteringMode = false;
    });
    context.read<AppointmentsCubit>().setSelectedFilterId('');
  }

  void _filteringAppointments(String str) {
    context.read<AppointmentsCubit>().setSelectedFilterId(str);
  }

  bool getUserProfilesCount(BuildContext context) {
    return context.read<UserCubit>().getUserProfilesCount() > 1;
  }

  Future<void> _onLoadDada({bool isRefresh = true, DateTime? initDay}) async {
    if (initDay != null) {
      DateTime dateFrom = date_utils.DateUtils.firstDayOfWeek(initDay);
      DateTime dateTo = date_utils.DateUtils.lastDayOfWeekWithHours(initDay);

      context.read<AppointmentsCubit>().setStartDate(dateFrom);
      context.read<AppointmentsCubit>().setEndDate(dateTo);

      context.read<AppointmentsCubit>().setSelectedDate(initDay);
    }

    if (widget.notificationId != null) {
      context
          .read<UserCubit>()
          .updateNotificationStatus(widget.notificationId!);
    }
    context.read<AppointmentsCubit>().getAppointmentsList(isRefresh);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.router.navigateNamed(AppRoutes.main);
        return false;
      },
      child: DefaultScaffold(
        appBarTitle: 'Мои приемы',
        filteringFunction: _filteringAppointments,
        appBar: MedcardAppBar(
          title: 'Мои приемы',
          filteringFunction: _filteringAppointments,
          isChildrenPage: true,
          handleTapOnFiltersButton: handleTapOnFiltersButton,
          handleResetFilters: handleResetFilters,
          isFilteringMode: isFilteringMode,
          isSearch: false,
          isFiltersAction: getUserProfilesCount(context),
        ),
        widgetOverBody: isFilteringMode
            ? AppointmentsFiltersWidget(key: widgetOverBodyGlobalKey)
            : Container(
                key: widgetOverBodyGlobalKey,
                height: 16,
              ),
        widgetOverBodyGlobalKey: isShowingFilters || isFilteringMode
            ? widgetOverBodyGlobalKey
            : null,
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
