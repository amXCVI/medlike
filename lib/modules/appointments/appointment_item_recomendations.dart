import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppointmentItemRecommendations extends StatelessWidget {
  const AppointmentItemRecommendations({
    Key? key,
    required this.recommendations,
    required this.serviceName,
    this.maxLines = 1,
    this.onTap,
  }) : super(key: key);

  final String recommendations;
  final String serviceName;
  final int maxLines;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    if (recommendations.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/icons/appointments/info.svg'),
              const SizedBox(width: 8.0),
              Flexible(
                  child: Text(
                recommendations,
                overflow: TextOverflow.ellipsis,
                maxLines: maxLines,
                softWrap: true,
              )),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
