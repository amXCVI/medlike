import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({Key? key, required this.doctorItem, required this.onTap})
      : super(key: key);

  final Doctor doctorItem;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    var rublesFormat =
        NumberFormat.currency(locale: "ru_RU", symbol: 'P', decimalDigits: 0);

    return SubscribeRowItem(
      title:
          '${doctorItem.lastName.toString()} ${doctorItem.firstName[0]}. ${doctorItem.middleName[0]}.',
      subtitle: doctorItem.price != null && doctorItem.price! > 0
          ? 'от ${rublesFormat.format(doctorItem.price! / 100)}'
          : '',
      onTap: onTap,
      rating: doctorItem.rateAsUser,
    );
  }
}
