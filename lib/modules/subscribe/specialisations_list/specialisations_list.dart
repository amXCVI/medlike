import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/specialisations_list/specialisation_item.dart';

class SpecialisationsList extends StatefulWidget {
  const SpecialisationsList({Key? key, required this.specialisationsList})
      : super(key: key);

  final List<NavigationItem> specialisationsList;

  @override
  State<SpecialisationsList> createState() => _SpecialisationsListState();
}

class _SpecialisationsListState extends State<SpecialisationsList> {
  void _handleTapOnSpecialisation(NavigationItem specialisation) {
    context.read<SubscribeCubit>().setSelectedSpecialisation(specialisation);
  }

  @override
  Widget build(BuildContext context) {
    int totalCountDoctors = 0;
    for (var item in widget.specialisationsList) {
      totalCountDoctors += item.count!;
    }

    NavigationItem navigationItemForAllDoctors = NavigationItem(
      id: '',
      name: 'Все',
      count: totalCountDoctors,
      categoryType: -1,
      personalSchedule: false,
      cabinets: [],
    );

    return ListView(shrinkWrap: true, children: [
      MaterialButton(
        onPressed: () {
          _handleTapOnSpecialisation(navigationItemForAllDoctors);
        },
        child: SpecialisationItem(
            specialisationItem: navigationItemForAllDoctors),
      ),
      ...widget.specialisationsList
          .map((item) => MaterialButton(
                onPressed: () {
                  _handleTapOnSpecialisation(item);
                },
                child: SpecialisationItem(
                  specialisationItem: item,
                ),
              ))
          .toList()
    ]);
  }
}
