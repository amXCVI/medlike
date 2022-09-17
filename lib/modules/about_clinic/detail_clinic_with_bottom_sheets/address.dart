import 'package:flutter/material.dart';
import 'package:medlike/themes/colors.dart';

class BuildingAddress extends StatelessWidget {
  const BuildingAddress(
      {Key? key,
      required this.address,
      required this.lat,
      required this.lng,
      required this.clinicName})
      : super(key: key);

  final String address;
  final double lat;
  final double lng;
  final String clinicName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        address,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        softWrap: true,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: AppColors.lightText),
      ),
    );
  }
}
