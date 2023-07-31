import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/calendar_models/calendar_models.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/schedule/appointments_list_widget.dart';
import 'package:medlike/modules/subscribe/schedule/time_cells_list.dart';
import 'package:medlike/modules/subscribe/schedule/time_cells_list_skeleton.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/calendar/calendar.dart';
import 'package:medlike/widgets/not_found_data/not_found_data.dart';

class ScheduleSubpage extends StatefulWidget {
  const ScheduleSubpage({
    Key? key,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
    this.doctorId,
    this.specialisationId,
    this.researchIds,
    required this.categoryTypeId,
    this.cabinet,
    required this.isAny,
    required this.getCalendarList,
    required this.getCellsList,
    required this.setSelectedDate,
  }) : super(key: key);

  final String userId;
  final String buildingId;
  final String clinicId;
  final String? doctorId;
  final String? specialisationId;
  final List<String>? researchIds;
  final int categoryTypeId;
  final String? cabinet;
  final bool isAny;
  final Function({bool? isRefresh}) getCalendarList;
  final Function({bool? isRefresh}) getCellsList;
  final Function(CalendarModel) setSelectedDate;

  @override
  State<ScheduleSubpage> createState() => _ScheduleSubpageState();
}

class _ScheduleSubpageState extends State<ScheduleSubpage> {
  ClinicModel? clinic;
  List<ClinicModel>? clinicsList;

  @override
  void initState() {
    super.initState();

    clinicsList = context.read<ClinicsCubit>().state.clinicsList;
    clinic = clinicsList?.firstWhere(((el) => el.id == widget.clinicId));
  }

  void _setStartDate(DateTime date) {
    context.read<SubscribeCubit>().setStartDate(date);
    widget.getCalendarList();
  }

  void _setEndDate(DateTime date) {
    context.read<SubscribeCubit>().setEndDate(date);
    widget.getCalendarList();
  }

  void _handleTapOnCell(
    TimetableCellModel selectedCell, {
    bool isDoctorSelected = false,
  }) {
    context.read<SubscribeCubit>().setSelectedTimetableCell(selectedCell);
    context.read<SubscribeCubit>().getAppointmentInfoData(
          scheduleId: selectedCell.scheduleId,
          userId: widget.userId,
          researchIds: widget.researchIds != null
              ? widget.researchIds as List<String>
              : [],
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
          widget.getCellsList(isRefresh: true);
        }

        return Column(
          children: [
            state.getCalendarStatus == GetCalendarStatuses.failed
                ? const Text('')
                : Calendar(
                    isLoading:
                        state.getCalendarStatus == GetCalendarStatuses.loading
                            ? true
                            : false,
                    startDate: state.startDate,
                    endDate: state.endDate,
                    selectedDate: state.selectedDate,
                    calendarList:
                        state.getCalendarStatus == GetCalendarStatuses.success
                            ? state.calendarList as List<CalendarModel>
                            : [],
                    onChangeSelectedDate: widget.setSelectedDate,
                    onChangeStartDate: _setStartDate,
                    onChangeEndDate: _setEndDate,
                    firstDay: DateTime.now(),
                  ),
            state.getTimetableCellsStatus ==
                        GetTimetableCellsStatuses.success &&
                    state.timetableCellsList!.isEmpty
                ? const NotFoundData(text: 'Нет свободного времени')
                : const SizedBox(),
            state.getTimetableCellsStatus == GetTimetableCellsStatuses.success
                ? TimeCellsList(
                    timetableCellsList:
                        state.timetableCellsList as List<TimetableCellModel>,
                    selectedTimetableCellId: state.selectedTimetableCell != null
                        ? state.selectedTimetableCell!.scheduleId
                        : '',
                    timezoneHours: clinic?.timeZoneOffset,
                    handleTapOnCell: (model) => _handleTapOnCell(model,
                        isDoctorSelected: state.selectedDoctor != null),
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
              userId: widget.userId,
            ),
          ],
        );
      },
    );
  }
}
