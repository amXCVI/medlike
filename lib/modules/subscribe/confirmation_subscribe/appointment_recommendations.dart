import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppointmentRecommendations extends StatefulWidget {
  const AppointmentRecommendations(
      {Key? key, required this.recommendations})
      : super(key: key);

  final String recommendations;

  @override
  State<AppointmentRecommendations> createState() =>
      _AppointmentRecommendationsState();
}

class _AppointmentRecommendationsState
    extends State<AppointmentRecommendations> {
  bool isOpenRow = false;

  @override
  Widget build(BuildContext context) {
    if (widget.recommendations.length > 2) {
      return GestureDetector(
        onTap: () => setState(() {
          isOpenRow = !isOpenRow;
        }),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.recommendations.substring(1, widget.recommendations.length - 1),
                overflow: TextOverflow.ellipsis,
                maxLines: isOpenRow ? 100 : 2,
                softWrap: true,
              ),
            ), RotatedBox(
                quarterTurns: isOpenRow ? 135 : 0,
                child: SvgPicture.asset('assets/icons/subscribe/right_arrow_icon.svg'))
          ],
        ),
      );
    } else {
      return const Text('-');
    }
  }
}
