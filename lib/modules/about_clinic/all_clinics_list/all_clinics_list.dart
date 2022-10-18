import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';

import 'clinic_item.dart';

class AllClinicsList extends StatelessWidget {
  const AllClinicsList({
    Key? key,
    required this.clinicsList,
    required this.onRefreshData,
    required this.isFromMainPage,
  }) : super(key: key);

  final List<ClinicModel> clinicsList;
  final dynamic onRefreshData;
  final bool isFromMainPage;

  @override
  Widget build(BuildContext context) {
    void _handleTapOnClinic(ClinicModel clinic) {
      if (isFromMainPage) {
        context.router.push(PriceRoute(clinicId: clinic.id));
      } else {
        context.router
            .push(ClinicDetailWithBottomSheetsRoute(selectedClinic: clinic));
      }
    }

    if (clinicsList.length == 1) {
      _handleTapOnClinic(clinicsList[0]);
    }

    return RefreshIndicator(
      onRefresh: () => onRefreshData(isRefresh: true),
      child: DefaultScrollbar(
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
      ),
    );
  }
}
