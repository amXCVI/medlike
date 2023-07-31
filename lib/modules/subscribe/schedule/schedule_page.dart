import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/calendar_models/calendar_models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/schedule/doctor_info_header.dart';
import 'package:medlike/modules/subscribe/schedule/doctor_subpage.dart';
import 'package:medlike/modules/subscribe/schedule/favorit_doctor_button.dart';
import 'package:medlike/modules/subscribe/schedule/schedule_subpage.dart';
import 'package:medlike/modules/subscribe/schedule/toggle_page_values_list.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';
import 'package:medlike/widgets/toggle_button/toggle_button.dart';

@RoutePage()
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
  TogglePageValueItem togglePageValue = togglePageValuesList[0];

  @override
  void initState() {
    super.initState();
    _onRefreshData();
  }

  void setTogglePageValue(String value) {
    setState(() {
      togglePageValue =
          togglePageValuesList.firstWhere((element) => element.label == value);
    });
  }

  void getDoctorInfo(BuildContext context) {
    if (widget.doctorId != null) {
      context.read<SubscribeCubit>().getDoctorInfo(
          doctorId: widget.doctorId!, categoryTypeId: widget.categoryTypeId);
    }
  }

  dynamic _onRefreshData() {
    _setSelectedDate(CalendarModel(
        date: DateTime.now(), hasAvailableCells: true, hasLogs: true));
    _getCalendarList(isRefresh: true);
    _getCellsList(isRefresh: true);
    return Future(() => null);
  }

  void _getAppointments(DateTime selectedDate) async {
    await context.read<AppointmentsCubit>().getAppointmentsList(false).then(
        (value) => context
            .read<AppointmentsCubit>()
            .getAppointmentsListForSelectedDay(
                userId: widget.userId, selectedDate: selectedDate));
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

  void _getCalendarList({bool? isRefresh}) async {
    context.read<SubscribeCubit>().getCalendarList(
          isRefresh: isRefresh ?? false,
          userId: widget.userId,
          buildingId: widget.buildingId,
          clinicId: widget.clinicId,
          categoryType: CategoryTypes.getCategoryTypeByCategoryTypeId(
                  widget.categoryTypeId)
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
          categoryType: CategoryTypes.getCategoryTypeByCategoryTypeId(
                  widget.categoryTypeId)
              .categoryType,
          doctorId: widget.doctorId,
          specialisationId: widget.specialisationId,
          cabinet: widget.cabinet,
          researchIds: widget.researchIds,
          isAny: widget.isAny,
        );
  }

  @override
  Widget build(BuildContext context) {
    getDoctorInfo(context);

    return DefaultScaffold(
      appBarTitle: widget.pageTitle,
      appBarSubtitle: widget.pageSubtitle,
      isChildrenPage: true,
      actions: widget.doctorId != null
          ? [
              BlocBuilder<SubscribeCubit, SubscribeState>(
                builder: (context, state) {
                  return FavoriteDoctorButton(
                    userId: widget.userId,
                    buildingId: widget.buildingId,
                    clinicId: widget.clinicId,
                    doctorId: widget.doctorId as String,
                    categoryTypeId: widget.categoryTypeId,
                    isFavorite: state.selectedDoctor != null
                        ? state.selectedDoctor!.isFavorite
                        : false,
                  );
                },
              )
            ]
          : [],
      child: DefaultScrollbar(
        child: ListView(
          children: [
            widget.doctorId != null
                ? const DoctorInfoHeader()
                : const SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
              child: ToggleButton(
                itemsList: togglePageValuesList.map((e) => e.label).toList(),
                setValue: setTogglePageValue,
              ),
            ),
            togglePageValue.id == togglePageValuesList[0].id
                ? ScheduleSubpage(
                    userId: widget.userId,
                    buildingId: widget.buildingId,
                    clinicId: widget.clinicId,
                    categoryTypeId: widget.categoryTypeId,
                    isAny: widget.isAny,
                    doctorId: widget.doctorId,
                    specialisationId: widget.specialisationId,
                    researchIds: widget.researchIds,
                    cabinet: widget.cabinet,
                    getCalendarList: _getCalendarList,
                    getCellsList: _getCellsList,
                    setSelectedDate: _setSelectedDate,
                  )
                : const DoctorSubpage(),
          ],
        ),
      ),
    );
  }
}
