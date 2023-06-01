import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/widgets/recommendation_bottom_sheet/recommendations_bottom_sheet.dart';

class AppointmentItemRecommendations extends StatelessWidget {
  const AppointmentItemRecommendations(
      {Key? key, required this.recommendations, required this.serviceName})
      : super(key: key);

  final String recommendations;
  final String serviceName;

  @override
  Widget build(BuildContext context) {
    if (recommendations.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          onTap: () => {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                ),
                context: context,
                isScrollControlled: true,
                builder: (context) => RecommendationBottomSheet(
                      serviceName: serviceName,
                      recommendationsText: recommendations,
                    ))
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/icons/appointments/info.svg'),
              const SizedBox(width: 8.0),
              Flexible(
                  child: Text(
                recommendations,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
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
