import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppointmentItemRecommendations extends StatefulWidget {
  const AppointmentItemRecommendations(
      {Key? key, required this.recommendations})
      : super(key: key);

  final String recommendations;

  @override
  State<AppointmentItemRecommendations> createState() =>
      _AppointmentItemRecommendationsState();
}

class _AppointmentItemRecommendationsState
    extends State<AppointmentItemRecommendations> {
  bool isOpenRow = false;

  @override
  Widget build(BuildContext context) {
    if (widget.recommendations.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          onTap: () => setState(() {
            isOpenRow = !isOpenRow;
          }),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/icons/appointments/info.svg'),
              const SizedBox(width: 8.0),
              Flexible(
                  child: Text(
                widget.recommendations,
                overflow: TextOverflow.ellipsis,
                maxLines: isOpenRow ? 10 : 1,
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
