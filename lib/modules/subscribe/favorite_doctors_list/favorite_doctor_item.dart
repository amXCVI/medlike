import 'package:flutter/material.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class FavoriteDoctorItem extends StatelessWidget {
  const FavoriteDoctorItem({Key? key, required this.doctorItem, required this.onTap})
      : super(key: key);

  final FavoriteDoctor doctorItem;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SubscribeRowItem(
      title: '${doctorItem.lastName.toString()} ${doctorItem.firstName[0]}. ${doctorItem.middleName[0]}.',
      subtitle: doctorItem.specialization,
      onTap: onTap,
    );
  }
}
