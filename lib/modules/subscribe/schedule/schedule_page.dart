import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/calendar_models/calendar_models.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
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

class SchedulePage extends StatefulWidget {
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
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  ClinicModel? clinic;
  List<ClinicModel>? clinicsList;

  @override
  void initState() {
    super.initState();
    _onRefreshData();

    clinicsList = context.read<ClinicsCubit>().state.clinicsList;
    clinic = clinicsList?.firstWhere(((el) => el.id == widget.clinicId));
  }

  void _getAppointments(DateTime selectedDate) async {
      await context.read<AppointmentsCubit>().getAppointmentsList(false).then(
        (value) => context
            .read<AppointmentsCubit>()
            .getAppointmentsListForSelectedDay(
                userId: widget.userId, selectedDate: selectedDate));
    }

    void _getCalendarList({bool? isRefresh}) async {
      context.read<SubscribeCubit>().getCalendarList(
            isRefresh: isRefresh ?? false,
            userId: widget.userId,
            buildingId: widget.buildingId,
            clinicId: widget.clinicId,
            categoryType:
                CategoryTypes.getCategoryTypeByCategoryTypeId(widget.categoryTypeId)
                    .categoryType,
            doctorId: widget.doctorId,
            specialisationId: widget.specialisationId,
            cabinet: widget.cabinet,
            researchIds: widget.researchIds,
            isAny: widget.isAny,
          );
    }

    void _getCellsList({bool? isRefresh}) async {
      context.read<SubscribeCubit>().getTimetableList(
            isRefresh: isRefresh ?? false,
            userId: widget.userId,
            buildingId: widget.buildingId,
            clinicId: widget.clinicId,
            categoryType:
                CategoryTypes.getCategoryTypeByCategoryTypeId(widget.categoryTypeId)
                    .categoryType,
            doctorId: widget.doctorId,
            specialisationId: widget.specialisationId,
            cabinet: widget.cabinet,
            researchIds: widget.researchIds,
            isAny: widget.isAny,
          );
    }

    void _setSelectedDate(CalendarModel selectedDay) {
       _getAppointments(selectedDay.date);
      context.read<SubscribeCubit>().setSelectedDate(selectedDay.date);
      context.read<SubscribeCubit>().setSelectedCalendarItem(selectedDay);
      context.read<AppointmentsCubit>().setSelectedDate(selectedDay.date);
      context.read<AppointmentsCubit>().getAppointmentsListForSelectedDay(
          userId: widget.userId, selectedDate: selectedDay.date);
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

    void _handleTapOnCell(TimetableCellModel selectedCell, {
      bool isDoctorSelected = false,
    }) {
      context.read<SubscribeCubit>().setSelectedTimetableCell(selectedCell);
      context.read<SubscribeCubit>().getAppointmentInfoData(
            scheduleId: selectedCell.scheduleId,
            userId: widget.userId,
            researchIds: widget.researchIds != null ? widget.researchIds as List<String> : [],
            appointmentDate: selectedCell.time,
          );
      context.read<SubscribeCubit>().checkAndLockAvailableCell(
            scheduleId: selectedCell.scheduleId,
            userId: widget.userId,
            clinicId: widget.clinicId,
            appointmentDate: selectedCell.time,
          );
      if (selectedCell.doctorAvailable && !isDoctorSelected) {
        context.read<SubscribeCubit>().getAvailableDoctor(
              scheduleId: selectedCell.scheduleId,
              clinicId: widget.clinicId,
            );
      }
      context.router.push(ConfirmationSubscribeRoute(
          userId: widget.userId, timeZoneHours: clinic?.timeZoneOffset ?? 0));
    }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscribeCubit, SubscribeState>(
      builder: (context, state) {
        /// при возврате со страницы подтверждения приема нужно заново подгрузить ячейки
        if (state.getTimetableCellsStatus ==
            GetTimetableCellsStatuses.refunded) {
          _getCellsList(isRefresh: true);
        }

        return WillPopScope(
          onWillPop: () async {
            context.read<SubscribeCubit>().clearSelectedDoctor();
            Navigator.pop(context);
            return false;
          },
          child: DefaultScaffold(
            appBarTitle: widget.pageTitle,
            appBarSubtitle: widget.pageSubtitle,
            isChildrenPage: true,
            actions: widget.doctorId != null
                ? [
                    FavoriteDoctorButton(
                      userId: widget.userId,
                      buildingId: widget.buildingId,
                      clinicId: widget.clinicId,
                      doctorId: widget.doctorId as String,
                      categoryTypeId: widget.categoryTypeId,
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
                            firstDay: DateTime.now(),
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
                            handleTapOnCell: (model) => _handleTapOnCell(
                              model,
                              isDoctorSelected: state.selectedDoctor != null 
                            ),
                          )
                        : (state.getTimetableCellsStatus == GetTimetableCellsStatuses.loading ||
                              state.getTimetableCellsStatus == GetTimetableCellsStatuses.refunded) &&
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
                      userId: widget.userId,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
