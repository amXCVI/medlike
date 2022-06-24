import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/calendar_models/calendar_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/schedule/time_cells_list.dart';
import 'package:medlike/modules/subscribe/schedule/time_cells_list_skeleton.dart';
import 'package:medlike/widgets/calendar/calendar.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

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
      if (selectedDay.hasAvailableCells) {
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
      _getCalendarList(isRefresh: true);
      _getCellsList(isRefresh: true);
      return Future(() => null);
    }

    _onRefreshData();

    return DefaultScaffold(
      appBarTitle: pageTitle,
      appBarSubtitle: pageSubtitle,
      isChildrenPage: true,
      child: BlocBuilder<SubscribeCubit, SubscribeState>(
          builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () => _onRefreshData(),
          child: ListView(
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
                      onChangeSelectedDate: _setSelectedDate,
                      onChangeStartDate: _setStartDate,
                      onChangeEndDate: _setEndDate,
                    ),
              state.getTimetableCellsStatus == GetTimetableCellsStatuses.success
                  ? TimeCellsList(
                      timetableCellsList:
                          state.timetableCellsList as List<TimetableCellModel>,
                      selectedTimetableCellId:
                          state.selectedTimetableCell != null
                              ? state.selectedTimetableCell!.scheduleId
                              : '',
                    )
                  : state.getTimetableCellsStatus ==
                          GetTimetableCellsStatuses.failed
                      ? const Text('')
                      : const TimeCellsListSkeleton(),
            ],
          ),
        );
      }),
    );
  }
}
