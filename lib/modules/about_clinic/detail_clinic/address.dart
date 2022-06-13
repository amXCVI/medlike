import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/themes/colors.dart';

class ClinicAddress extends StatelessWidget {
  const ClinicAddress({Key? key, required this.address}) : super(key: key);

  final String address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 8),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/clinics/ic_adress_outline.svg'),
          const SizedBox(width: 18),
          Flexible(
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
          )
        ],
      ),
    );
  }
}
