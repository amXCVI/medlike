import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';

import 'clinic_item.dart';

class AllClinicsList extends StatefulWidget {
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
  State<AllClinicsList> createState() => _AllClinicsListState();
}

class _AllClinicsListState extends State<AllClinicsList> {
  void _handleTapOnClinic(ClinicModel clinic) {
    //widget.handleTapOnClinic(clinic);
    if (widget.isFromMainPage) {
      context.router.push(PriceRoute(clinicId: clinic.id));
    } else {
      context.router
          .push(ClinicDetailWithBottomSheetsRoute(selectedClinic: clinic));
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.clinicsList.length == 1) {
      _handleTapOnClinic(widget.clinicsList[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => widget.onRefreshData(isRefresh: true),
      child: DefaultScrollbar(
        child: ListView(
            shrinkWrap: true,
            children: widget.clinicsList
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
