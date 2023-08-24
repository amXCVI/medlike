import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorRating extends StatelessWidget {
  const DoctorRating({Key? key, this.rating}) : super(key: key);

  final num? rating;

  @override
  Widget build(BuildContext context) {
    return rating != null && rating! > 0
        ? Row(
            children: [
              SvgPicture.asset(
                  'assets/icons/appointments/raiting_gold_star.svg'),
              const SizedBox(width: 6),
              Text(rating!.toStringAsFixed(1)),
              const SizedBox(width: 4),
            ],
          )
        : const SizedBox();
  }
}
