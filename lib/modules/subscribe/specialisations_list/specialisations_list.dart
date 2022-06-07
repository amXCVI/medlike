import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/specialisations_list/specialisation_item.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class SpecialisationsList extends StatefulWidget {
  const SpecialisationsList({
    Key? key,
    required this.specialisationsList,
    required this.onRefreshData,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
    required this.categoryTypeId,
  }) : super(key: key);

  final List<NavigationItem> specialisationsList;
  final String userId;
  final String buildingId;
  final String clinicId;
  final int categoryTypeId;
  final dynamic onRefreshData;

  @override
  State<SpecialisationsList> createState() => _SpecialisationsListState();
}

class _SpecialisationsListState extends State<SpecialisationsList> {
  void _handleTapOnSpecialisation(NavigationItem specialisation) {
    context.read<SubscribeCubit>().setSelectedSpecialisation(specialisation);
    context.router.push(DoctorsListRoute(
      userId: widget.userId,
      categoryTypeId: widget.categoryTypeId,
      clinicId: widget.clinicId,
      buildingId: widget.buildingId,
      specialisationId: specialisation.id,
      specialisationName: specialisation.name as String,
    ));
  }

  @override
  Widget build(BuildContext context) {
    int totalCountDoctors = 0;
    for (var item in widget.specialisationsList) {
      totalCountDoctors += item.count!;
    }

    NavigationItem navigationItemForAllDoctors = NavigationItem(
      id: '0',
      name: 'Все',
      count: totalCountDoctors,
      categoryType: 1,
      personalSchedule: false,
      cabinets: [],
    );

    return RefreshIndicator(
      onRefresh: () async => widget.onRefreshData(),
      child: ListView(shrinkWrap: true, children: [
        SubscribeRowItem(
          title: navigationItemForAllDoctors.name.toString(),
          subtitle: getCountDoctors(navigationItemForAllDoctors.count as int),
          onTap: () {
            _handleTapOnSpecialisation(navigationItemForAllDoctors);
          },
          customIcon: CircleAvatar(
            backgroundColor: Colors.white,
            child: SvgPicture.asset('assets/icons/subscribe/all_doctors.svg'),
          ),
          isFirstSymbolForIcon: false,
        ),
        ...widget.specialisationsList
            .map((item) => SpecialisationItem(
                  specialisationItem: item,
                  onTap: () {
                    _handleTapOnSpecialisation(item);
                  },
                ))
            .toList()
      ]),
    );
  }
}
