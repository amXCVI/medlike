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
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/widgets/app_bar/schedule_app_bar/schedule_app_bar.dart';
import 'package:medlike/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
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
    this.cabinetId,
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
  final String? cabinetId;
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
          cabinet: widget.cabinetId,
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
          cabinet: widget.cabinetId,
          researchIds: widget.researchIds,
          isAny: widget.isAny,
        );
  }

  @override
  Widget build(BuildContext context) {
    getDoctorInfo(context);

    return WillPopScope(
      onWillPop: () async {
        context.read<SubscribeCubit>().clearSelectedDoctor();
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        bottomNavigationBar: const BottomBar(),
        body: BlocBuilder<SubscribeCubit, SubscribeState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: <Widget>[
                ScheduleAppBar(
                  title: widget.pageTitle,
                  isChildrenPage: true,
                  isDoctorAppBar: widget.doctorId != null,
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
                  backgroundImageUrl: state.selectedDoctor != null &&
                          state.selectedDoctor!.imageId != null
                      ? '${ApiConstants.baseUrl}/api/v1.0/doctors/image/${state.selectedDoctor?.imageId}?isThumbnail=false'
                      : null,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, int index) {
                      return Column(
                        children: [
                          widget.doctorId != null
                              ? const DoctorInfoHeader()
                              : const SizedBox(),
                          // Смотрим, если это не кабинет и на врача есть описание или отзывы
                          // Тогда рисуем переключатель
                          widget.doctorId != null &&
                                  state.selectedDoctorFullData != null &&
                                  (state.selectedDoctorFullData!.shortinfo !=
                                          null ||
                                      state.selectedDoctorFullData!.reviews
                                          .isNotEmpty)
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 24, horizontal: 18),
                                  child: ToggleButton(
                                    itemsList: togglePageValuesList
                                        .map((e) => e.label)
                                        .toList(),
                                    setValue: setTogglePageValue,
                                    value: togglePageValue.label,
                                  ),
                                )
                              : const SizedBox(),
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
                                  cabinet: widget.cabinetId,
                                  getCalendarList: _getCalendarList,
                                  getCellsList: _getCellsList,
                                  setSelectedDate: _setSelectedDate,
                                )
                              : const DoctorSubpage(),
                        ],
                      );
                    },
                    childCount: 1,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
