import 'package:flutter/material.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class ClinicItem extends StatelessWidget {
  const ClinicItem({Key? key, required this.clinicItem}) : super(key: key);

  final AvailableClinic clinicItem;

  @override
  Widget build(BuildContext context) {
    return SubscribeRowItem(
      title: clinicItem.name,
      subtitle: clinicItem.address,
      isRightArrow: true,
    );
  }
}
