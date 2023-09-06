import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/themes/colors.dart';

class ResearchRecommendations extends StatelessWidget {
  const ResearchRecommendations({
    Key? key,
    this.recommendationsList,
  }) : super(key: key);

  final List<RecommendationItemModel>? recommendationsList;

  @override
  Widget build(BuildContext context) {
    if (recommendationsList != null && recommendationsList!.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: GestureDetector(
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
                      recommendationsList: recommendationsList!,
                    ));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 14),
              Center(
                  child:
                      SvgPicture.asset('assets/icons/appointments/info.svg')),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  recommendationsList!.map((e) => e.recommendation).toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  softWrap: true,
                ),
              ),
              SvgPicture.asset('assets/icons/subscribe/right_arrow_icon.svg')
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}

class RecommendationBottomSheet extends StatelessWidget {
  const RecommendationBottomSheet({
    Key? key,
    required this.recommendationsList,
  }) : super(key: key);

  final List<RecommendationItemModel> recommendationsList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 12, right: 16, bottom: 16, left: 16),
        child: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 12.0, bottom: 16.0),
                    height: 5,
                    width: 30,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(3.0),
                      ),
                      color: AppColors.mainSeparatorAlpha,
                    ),
                  ),
                ),
                Text(
                  'Рекомендации к приему',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 28),
                ...recommendationsList.map((e) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.serviceName,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 6),
                      Text(e.recommendation),
                      const SizedBox(height: 16),
                    ],
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
