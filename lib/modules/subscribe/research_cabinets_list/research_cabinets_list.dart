import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/modules/subscribe/research_cabinets_list/cabinet_item.dart';
import 'package:medlike/modules/subscribe/research_cabinets_list/doctor_item.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class ResearchCabinetsList extends StatefulWidget {
  const ResearchCabinetsList({
    Key? key,
    required this.doctorsList,
    required this.cabinetsList,
    required this.onRefreshData,
  }) : super(key: key);

  final List<Doctor> doctorsList;
  final List<Cabinet> cabinetsList;
  final void Function() onRefreshData;

  @override
  State<ResearchCabinetsList> createState() => _ResearchCabinetsListState();
}

class _ResearchCabinetsListState extends State<ResearchCabinetsList> {
  void _handleTapOnDoctor(Doctor doctor) {}

  void _handleTapOnCabinet(Cabinet cabinet) {}

  @override
  Widget build(BuildContext context) {
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
      ]),
    );
  }
}
