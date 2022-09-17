import 'package:flutter/material.dart';

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
        child: Text(
          widget.recommendations.substring(1, widget.recommendations.length - 2),
          overflow: TextOverflow.ellipsis,
          maxLines: isOpenRow ? 100 : 2,
          softWrap: true,
        ),
      );
    } else {
      return const Text('-');
    }
  }
}
