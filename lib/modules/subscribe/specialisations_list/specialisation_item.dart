import 'package:flutter/material.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class SpecialisationItem extends StatelessWidget {
  const SpecialisationItem(
      {Key? key, required this.specialisationItem, required this.onTap})
      : super(key: key);

  final NavigationItem specialisationItem;
  final void Function() onTap;

  String _getCountDoctors(int count) {
    int n = count;

    n %= 100;
    if (n >= 5 && n <= 20) {
      return '$count специалистов';
    }
    n %= 10;
    if (n == 1) {
      return '$count специалист';
    }
    if (n >= 2 && n <= 4) {
      return '$count специалиста';
    }
    return '$count специалистов';
  }

  @override
  Widget build(BuildContext context) {
    return SubscribeRowItem(
      title: specialisationItem.name.toString(),
      subtitle: _getCountDoctors(specialisationItem.count as int),
      onTap: onTap,
    );
  }
}
