import 'package:flutter/material.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class CabinetItem extends StatelessWidget {
  const CabinetItem({Key? key, required this.cabinetItem, required this.onTap})
      : super(key: key);

  final Cabinet cabinetItem;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SubscribeRowItem(
      title: cabinetItem.cabinetName.toString(),
      onTap: onTap,
    );
  }
}
