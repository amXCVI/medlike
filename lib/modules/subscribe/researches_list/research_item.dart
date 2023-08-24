import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class ResearchItem extends StatelessWidget {
  const ResearchItem({
    Key? key,
    required this.researchItem,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final Research researchItem;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    var rublesFormat =
        NumberFormat.currency(locale: "ru_RU", symbol: 'P', decimalDigits: 0);

    return SubscribeRowItem(
      title: researchItem.name.toString(),
      subtitle:
          'от ${researchItem.price != null ? rublesFormat.format(researchItem.price! / 100) : 0}',
      isRightArrow: false,
      isSelected: isSelected,
      onTap: onTap,
    );
  }
}
