import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/modules/subscribe/doctors_list/doctor_item.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class DoctorsList extends StatefulWidget {
  const DoctorsList({
    Key? key,
    required this.doctorsList,
    this.onRefreshData,
    required this.specialisationId,
  }) : super(key: key);

  final List<Doctor> doctorsList;
  final String specialisationId;
  final dynamic onRefreshData;

  @override
  State<DoctorsList> createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  void _handleTapOnDoctor(Doctor doctor) {}

  @override
  Widget build(BuildContext context) {
    Doctor allDoctorsObject = const Doctor(
      id: '',
      lastName: 'Все',
      firstName: '',
      middleName: '',
      specializationId: '',
      specialization: '',
      price: 0,
      categoryType: -1,
      isFavorite: false,
      categories: <int>[],
    );

    return RefreshIndicator(
      onRefresh: () async => widget.onRefreshData(),
      child: ListView(shrinkWrap: true, children: [
        // Не показывать вариант "Любой", если всего один врач или если уже отображаются "Все" врачи
        widget.doctorsList.length > 1 && widget.specialisationId != '0'
            ? SubscribeRowItem(
                title: 'Любой',
                onTap: () {
                  _handleTapOnDoctor(allDoctorsObject);
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
            .toList()
      ]),
    );
  }
}
