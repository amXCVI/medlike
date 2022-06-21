import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/calendar_models/calendar_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
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
    void _getCalendarList() async {
      context.read<SubscribeCubit>().getCalendarList(
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

    void _setSelectedDate(DateTime selectedDate) {
      context.read<SubscribeCubit>().setSelectedDate(selectedDate);
    }

    void _setStartDate(DateTime date) {
      context.read<SubscribeCubit>().setStartDate(date);
      _getCalendarList();
    }

    void _setEndDate(DateTime date) {
      context.read<SubscribeCubit>().setEndDate(date);
      _getCalendarList();
    }

    _getCalendarList();

    return DefaultScaffold(
      appBarTitle: pageTitle,
      appBarSubtitle: pageSubtitle,
      isChildrenPage: true,
      child: ListView(
        children: [
          BlocBuilder<SubscribeCubit, SubscribeState>(
            builder: (context, state) {
              if (state.getCalendarStatus == GetCalendarStatuses.failed) {
                return const Text('');
              } else {
                return Calendar(
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
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
