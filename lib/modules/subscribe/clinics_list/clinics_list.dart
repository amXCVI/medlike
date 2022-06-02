import 'package:flutter/material.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/modules/subscribe/clinics_list/clinic_item.dart';

class ClinicsList extends StatelessWidget {
  const ClinicsList({Key? key, required this.availableClinicsList})
      : super(key: key);

  final List<AvailableClinic> availableClinicsList;

  void _handleTapOnClinic(clinicId) {

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children: availableClinicsList
            .map((item) => MaterialButton(
                  onPressed: () {
                    _handleTapOnClinic(item.id);
                  },
                  child: ClinicItem(
                    clinicItem: item,
                  ),
                ))
            .toList());
  }
}
