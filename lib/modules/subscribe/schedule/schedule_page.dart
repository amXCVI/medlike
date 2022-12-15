import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/calendar_models/calendar_models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/schedule/appointments_list_widget.dart';
import 'package:medlike/modules/subscribe/schedule/favorit_doctor_button.dart';
import 'package:medlike/modules/subscribe/schedule/time_cells_list.dart';
import 'package:medlike/modules/subscribe/schedule/time_cells_list_skeleton.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/calendar/calendar.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';
import 'package:medlike/widgets/not_found_data/not_found_data.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({
    Key? key,
    required this.pageTitle,
    this.pageSubtitle = '',
    required this.userId,
    required this.buildingId,
    required this.clinicId,
    this.doctorId,
    this.specialisationId,
    this.researchIds,
    required this.categoryTypeId,
    this.cabinet,
    required this.isAny,
    this.isFavorite = false,
  }) : super(key: key);

  final String pageTitle;
  final String pageSubtitle;

  final String userId;
  final String buildingId;
  final String clinicId;
  final String? doctorId;
  final String? specialisationId;
  final List<String>? researchIds;
  final int categoryTypeId;
  final String? cabinet;
  final bool isAny;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    void _getCalendarList({bool? isRefresh}) async {
      context.read<SubscribeCubit>().getCalendarList(
            isRefresh: isRefresh ?? false,
            userId: userId,
            buildingId: buildingId,
            clinicId: clinicId,
            categoryType:
                CategoryTypes.getCategoryTypeByCategoryTypeId(categoryTypeId)
                    .categoryType,
            doctorId: doctorId,
            specialisationId: specialisationId,
            cabinet: cabinet,
            researchIds: researchIds,
            isAny: isAny,
          );
    }

    void _getCellsList({bool? isRefresh}) async {
      context.read<SubscribeCubit>().getTimetableList(
            isRefresh: isRefresh ?? false,
            userId: userId,
            buildingId: buildingId,
            clinicId: clinicId,
            categoryType:
                CategoryTypes.getCategoryTypeByCategoryTypeId(categoryTypeId)
                    .categoryType,
            doctorId: doctorId,
            specialisationId: specialisationId,
            cabinet: cabinet,
            researchIds: researchIds,
            isAny: isAny,
          );
    }

    void _setSelectedDate(CalendarModel selectedDay) {
      context.read<SubscribeCubit>().setSelectedDate(selectedDay.date);
      context.read<SubscribeCubit>().setSelectedCalendarItem(selectedDay);
      context.read<AppointmentsCubit>().setSelectedDate(selectedDay.date);
      context.read<AppointmentsCubit>().getAppointmentsListForSelectedDay(
          userId: userId, selectedDate: selectedDay.date);
      if (selectedDay.hasLogs) {
        context
            .read<AppointmentsCubit>()
            .filterAppointmentsList(selectedDay.date);
      }
      if (selectedDay.hasAvailableCells || selectedDay.hasLogs) {
        _getCellsList();
      } else {
        context.read<SubscribeCubit>().setEmptyTimetableList();
      }
    }

    void _setStartDate(DateTime date) {
      context.read<SubscribeCubit>().setStartDate(date);
      _getCalendarList();
    }

    void _setEndDate(DateTime date) {
      context.read<SubscribeCubit>().setEndDate(date);
      _getCalendarList();
    }

    dynamic _onRefreshData() {
      _setSelectedDate(CalendarModel(
          date: DateTime.now(), hasAvailableCells: true, hasLogs: true));
      _getCalendarList(isRefresh: true);
      _getCellsList(isRefresh: true);
      return Future(() => null);
    }

    _onRefreshData();

    final clinicsList = context.read<ClinicsCubit>().state.clinicsList;
    final clinic = clinicsList?.firstWhere(((el) => el.id == clinicId));

    void _handleTapOnCell(TimetableCellModel selectedCell) {
      context.read<SubscribeCubit>().setSelectedTimetableCell(selectedCell);
      context.read<SubscribeCubit>().getAppointmentInfoData(
            scheduleId: selectedCell.scheduleId,
            userId: userId,
            researchIds: researchIds != null ? researchIds as List<String> : [],
            appointmentDate: selectedCell.time,
          );
      context.read<SubscribeCubit>().checkAndLockAvailableCell(
            scheduleId: selectedCell.scheduleId,
            userId: userId,
            clinicId: clinicId,
            appointmentDate: selectedCell.time,
          );
      if (selectedCell.doctorAvailable) {
        context.read<SubscribeCubit>().getAvailableDoctor(
              scheduleId: selectedCell.scheduleId,
              clinicId: clinicId,
            );
      }
      context.router.push(ConfirmationSubscribeRoute(
          userId: userId, timeZoneHours: clinic?.timeZoneOffset ?? 0));
    }

    return BlocBuilder<SubscribeCubit, SubscribeState>(
      builder: (context, state) {
        /// при возврате со страницы подтверждения приема нужно заново подгрузить ячейки
        if (state.getTimetableCellsStatus ==
            GetTimetableCellsStatuses.refunded) {
          _getCellsList(isRefresh: true);
        }

        return DefaultScaffold(
          appBarTitle: pageTitle,
          appBarSubtitle: pageSubtitle,
          isChildrenPage: true,
          actions: doctorId != null
              ? [
                  FavoriteDoctorButton(
                    userId: userId,
                    buildingId: buildingId,
                    clinicId: clinicId,
                    doctorId: doctorId as String,
                    categoryTypeId: categoryTypeId,
                    isFavorite: state.selectedDoctor != null
                        ? state.selectedDoctor!.isFavorite
                        : false,
                  )
                ]
              : [],
          child: RefreshIndicator(
            onRefresh: () => _onRefreshData(),
            child: DefaultScrollbar(
              child: ListView(
                children: [
                  state.getCalendarStatus == GetCalendarStatuses.failed
                      ? const Text('')
                      : Calendar(
                          isLoading: state.getCalendarStatus ==
                                  GetCalendarStatuses.loading
                              ? true
                              : false,
                          startDate: state.startDate,
                          endDate: state.endDate,
                          selectedDate: state.selectedDate,
                          calendarList: state.getCalendarStatus ==
                                  GetCalendarStatuses.success
                              ? state.calendarList as List<CalendarModel>
                              : [],
                          onChangeSelectedDate: _setSelectedDate,
                          onChangeStartDate: _setStartDate,
                          onChangeEndDate: _setEndDate,
                        ),
                  state.getTimetableCellsStatus ==
                              GetTimetableCellsStatuses.success &&
                          state.timetableCellsList!.isEmpty
                      ? const NotFoundData(text: 'Нет свободного времени')
                      : const SizedBox(),
                  state.getTimetableCellsStatus ==
                          GetTimetableCellsStatuses.success
                      ? TimeCellsList(
                          timetableCellsList: state.timetableCellsList
                              as List<TimetableCellModel>,
                          selectedTimetableCellId:
                              state.selectedTimetableCell != null
                                  ? state.selectedTimetableCell!.scheduleId
                                  : '',
                          timezoneHours: clinic?.timeZoneOffset,
                          handleTapOnCell: _handleTapOnCell,
                        )
                      : state.getTimetableCellsStatus ==
                                  GetTimetableCellsStatuses.loading &&
                              state.selectedCalendarItem != null &&
                              clinicsList != null &&
                              state.selectedCalendarItem!.hasAvailableCells
                          ? const TimeCellsListSkeleton()
                          : Padding(
                              padding: const EdgeInsets.symmetric(vertical: 50),
                              child: Center(
                                child: Text(
                                  'Нет свободного времени',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(color: AppColors.lightText),
                                ),
                              )),
                  AppointmentsListWidget(
                    selectedDate: state.selectedDate,
                    userId: userId,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
