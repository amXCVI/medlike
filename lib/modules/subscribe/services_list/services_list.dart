import 'package:flutter/material.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/modules/subscribe/services_list/service_item.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({Key? key, required this.servicesList}) : super(key: key);

  final List<NavigationItem> servicesList;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children: servicesList
            .map((item) => MaterialButton(
                  onPressed: () {
                    // _handleTapOnService(item);
                  },
                  child: ServiceItem(
                    serviceItem: item,
                  ),
                ))
            .toList());
  }
}
