import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/services_list/service_item.dart';
import 'package:medlike/navigation/router.gr.dart';

class ServicesList extends StatefulWidget {
  const ServicesList({
    Key? key,
    required this.servicesList,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
  }) : super(key: key);

  final List<NavigationItem> servicesList;
  final String userId;
  final String buildingId;
  final String clinicId;

  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  void _handleTapOnService(NavigationItem service) {
    context.read<SubscribeCubit>().setSelectedService(service);
    context.router.push(ResearchesListRoute(
      userId: widget.userId,
      categoryTypeId: service.categoryType as int,
      clinicId: widget.clinicId,
      buildingId: widget.buildingId,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children: widget.servicesList
            .map((item) => MaterialButton(
                  onPressed: () {
                    _handleTapOnService(item);
                  },
                  child: ServiceItem(
                    serviceItem: item,
                  ),
                ))
            .toList());
  }
}