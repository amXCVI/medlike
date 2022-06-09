import 'package:flutter/material.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';

import 'clinic_item.dart';

class AllClinicsList extends StatelessWidget {
  const AllClinicsList({Key? key, required this.clinicsList, required this.onRefreshData}) : super(key: key);

  final List<ClinicModel> clinicsList;
  final dynamic onRefreshData;

  @override
  Widget build(BuildContext context) {
    void _handleTapOnClinic(ClinicModel clinic) {

    }

    return RefreshIndicator(
      onRefresh: () => onRefreshData(isRefresh: true),
      child: ListView(
          shrinkWrap: true,
          children: clinicsList
              .map((item) => ClinicItem(
            clinicItem: item,
            onTap: () {
              _handleTapOnClinic(item);
            },
          ))
              .toList()),
    );
  }
}
