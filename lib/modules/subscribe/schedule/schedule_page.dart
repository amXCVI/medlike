import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  )
                : const DoctorSubpage(),
          ],
        ),
      ),
    );
  }
}
