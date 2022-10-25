import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/widgets/recommendation_bottom_sheet/recommendations_bottom_sheet.dart';

class AppointmentRecommendations extends StatelessWidget {
  const AppointmentRecommendations(
      {Key? key, required this.recommendations, required this.serviceName})
      : super(key: key);

  final String recommendations;
  final String serviceName;

  @override
  Widget build(BuildContext context) {
    if (recommendations.length > 2) {
      return GestureDetector(
        onTap: () {
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
                    recommendationsText: recommendations.substring(
                        1, recommendations.length - 1),
                  ));
        },
        child: Row(
          children: [
            Expanded(
              child: Text(
                recommendations.substring(1, recommendations.length - 1),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
              ),
            ),
            SvgPicture.asset('assets/icons/subscribe/right_arrow_icon.svg')
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
