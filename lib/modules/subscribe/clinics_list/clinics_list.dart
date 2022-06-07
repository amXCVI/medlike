import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/clinics_list/clinic_item.dart';
import 'package:medlike/navigation/router.gr.dart';

class ClinicsList extends StatefulWidget {
  const ClinicsList({
    Key? key,
    required this.availableClinicsList,
    required this.userId,
    this.onRefreshData,
  }) : super(key: key);

  final List<AvailableClinic> availableClinicsList;
  final String userId;
  final dynamic onRefreshData;

  @override
  State<ClinicsList> createState() => _ClinicsListState();
}

class _ClinicsListState extends State<ClinicsList> {
  void _handleTapOnClinic(AvailableClinic building) {
    context.read<SubscribeCubit>().setSelectedBuilding(building);
    context.router.push(ServicesListRoute(
      userId: widget.userId,
      clinicId: building.id,
      buildingId: building.buildingId,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => widget.onRefreshData(isRefresh: true),
      child: ListView(
          shrinkWrap: true,
          children: widget.availableClinicsList
              .map((item) => MaterialButton(
                    onPressed: () {
                      _handleTapOnClinic(item);
                    },
                    child: ClinicItem(
                      clinicItem: item,
                    ),
                  ))
              .toList()),
    );
  }
}
