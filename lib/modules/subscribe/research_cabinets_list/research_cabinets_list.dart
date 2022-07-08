import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/modules/subscribe/research_cabinets_list/cabinet_item.dart';
import 'package:medlike/modules/subscribe/research_cabinets_list/doctor_item.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/widgets/subscribe_not_found_data/subscribe_not_found_data.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class ResearchCabinetsList extends StatefulWidget {
  const ResearchCabinetsList({
    Key? key,
    required this.doctorsList,
    required this.cabinetsList,
    required this.onRefreshData,
    required this.nextPageTitle,
    required this.nextPageSubtitle,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
    required this.categoryTypeId,
    required this.researchIds,
  }) : super(key: key);

  final List<Doctor> doctorsList;
  final List<Cabinet> cabinetsList;
  final void Function() onRefreshData;
  final String nextPageTitle;
  final String nextPageSubtitle;
  final String userId;
  final String buildingId;
  final String clinicId;
  final int categoryTypeId;
  final List<String> researchIds;

  @override
  State<ResearchCabinetsList> createState() => _ResearchCabinetsListState();
}

class _ResearchCabinetsListState extends State<ResearchCabinetsList> {
  @override
  Widget build(BuildContext context) {
    void _handleTapOnDoctor(Doctor doctor) {
      context.router.push(ScheduleRoute(
        pageTitle: widget.nextPageTitle,
        pageSubtitle: widget.nextPageSubtitle,
        userId: widget.userId,
        buildingId: widget.buildingId,
        clinicId: widget.clinicId,
        categoryTypeId: widget.categoryTypeId,
        researchIds: widget.researchIds,
        doctorId: doctor.id,
        specialisationId: doctor.specializationId,
        isAny: false,
      ));
    }

    void _handleTapOnCabinet(Cabinet cabinet) {
      context.router.push(ScheduleRoute(
        pageTitle: widget.nextPageTitle,
        pageSubtitle: widget.nextPageSubtitle,
        userId: widget.userId,
        buildingId: widget.buildingId,
        clinicId: widget.clinicId,
        categoryTypeId: widget.categoryTypeId,
        researchIds: widget.researchIds,
        cabinet: cabinet.id,
        isAny: false,
      ));
    }

    return RefreshIndicator(
      onRefresh: () async => widget.onRefreshData(),
      child: ListView(shrinkWrap: true, children: [
        // Не показывать вариант "Любой", если меньше двух вариантов
        widget.doctorsList.length + widget.cabinetsList.length > 1
            ? SubscribeRowItem(
                title: 'Любой',
                onTap: () {
                  // _handleTapOnDoctor(allDoctorsObject);
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
                    _handleTapOnDoctor(item);
                  },
                ))
            .toList(),
        ...widget.cabinetsList
            .map((item) => CabinetItem(
                  cabinetItem: item,
                  onTap: () {
                    _handleTapOnCabinet(item);
                  },
                ))
            .toList(),
        widget.doctorsList.isEmpty && widget.cabinetsList.isEmpty
            ? const SubscribeNotFoundData(text: 'Нет свободного специалиста')
            : const SizedBox()
      ]),
    );
  }
}
