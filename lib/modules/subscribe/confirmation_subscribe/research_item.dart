import 'package:flutter/material.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/appointment_recommendations.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/dividers/dash_divider.dart';

class ResearchItem extends StatelessWidget {
  const ResearchItem(
      {Key? key, required this.researchName, this.researchRecommendations})
      : super(key: key);

  final String researchName;
  final RecommendationItemModel? researchRecommendations;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.mainBrand[100],
              child: Text((researchName ?? ' ')[0].toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      )),
            ),
            const SizedBox(width: 24),
            Flexible(
              child: Text(
                researchName,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                softWrap: true,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
        researchRecommendations != null
            ? AppointmentRecommendations(
                recommendations: researchRecommendations!.recommendation,
                serviceName: researchRecommendations!.serviceName,
              )
            : const SizedBox(),
        const SizedBox(height: 16),
        const DashDivider(),
      ],
    );
  }
}
