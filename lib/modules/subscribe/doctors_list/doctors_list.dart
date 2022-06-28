import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/doctors_list/doctor_item.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class DoctorsList extends StatefulWidget {
  const DoctorsList({
    Key? key,
    required this.doctorsList,
    this.onRefreshData,
    required this.specialisationId,
    required this.userId,
    required this.clinicId,
    required this.buildingId,
    required this.specialisation,
    required this.categoryTypeId,
  }) : super(key: key);

  final List<Doctor> doctorsList;
  final String specialisationId;
  final String specialisation;
  final dynamic onRefreshData;
  final String userId;
  final String clinicId;
  final String buildingId;
  final int categoryTypeId;

  @override
  State<DoctorsList> createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  void _handleTapOnDoctor({Doctor? doctor}) {
    if (doctor != null) {
      context.read<SubscribeCubit>().setSelectedDoctor(doctor);
      context.router.push(ScheduleRoute(
        pageTitle:
            '${doctor.lastName} ${doctor.firstName} ${doctor.middleName}',
        pageSubtitle: doctor.specialization,
        clinicId: widget.clinicId,
        userId: widget.userId,
        buildingId: widget.buildingId,
        categoryTypeId: doctor.categoryType,
        specialisationId: widget.specialisationId,
        doctorId: doctor.id,
        isAny: false,
      ));
    } else {
      context.router.push(ScheduleRoute(
        pageTitle: 'Любой',
        pageSubtitle: widget.specialisation,
        clinicId: widget.clinicId,
        userId: widget.userId,
        buildingId: widget.buildingId,
        categoryTypeId: widget.categoryTypeId,
        specialisationId: widget.specialisationId,
        isAny: true,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => widget.onRefreshData(),
      child: ListView(shrinkWrap: true, children: [
        // Не показывать вариант "Любой", если всего один врач или если уже отображаются "Все" врачи
        widget.doctorsList.length > 1 && widget.specialisationId != '0'
            ? SubscribeRowItem(
                title: 'Любой',
                onTap: () {
                  _handleTapOnDoctor();
                },
                customIcon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child:
                      SvgPicture.asset('assets/icons/subscribe/any_doctor.svg'),
                ),
                isFirstSymbolForIcon: false,
              )
            : const SizedBox(),
        ...widget.doctorsList
            .map((item) => DoctorItem(
                  doctorItem: item,
                  onTap: () {
                    _handleTapOnDoctor(doctor: item);
                  },
                ))
            .toList()
      ]),
    );
  }
}
