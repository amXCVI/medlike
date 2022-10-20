import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:medlike/modules/about_clinic/price/recommendations_bottom_sheet_skeleton.dart';
import 'package:medlike/themes/colors.dart';

class RecommendationBottomSheet extends StatelessWidget {
  const RecommendationBottomSheet(
      {Key? key, required this.serviceId, required this.serviceName})
      : super(key: key);

  final String serviceId;
  final String serviceName;

  @override
  Widget build(BuildContext context) {
    context
        .read<ClinicsCubit>()
        .getRecommendationsLstByServiceIds(serviceIds: [serviceId]);

    return SafeArea(child: BlocBuilder<ClinicsCubit, ClinicsState>(
      builder: (context, state) {
        return Padding(
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
                    'Рекомендации',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    serviceName,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.lightText),
                  ),
                  const SizedBox(height: 28),
                  state.getRecommendationsListStatus ==
                          GetRecommendationsListStatuses.success
                      ? Column(
                          children: [
                            ...state.recommendationsList!
                                .where(
                                    (element) => element.serviceId == serviceId)
                                .map((e) => Text(e.recommendation))
                          ],
                        )
                      : const RecommendationsBottomSheetSkeleton(),
                ],
              )
            ],
          ),
        );
      },
    ));
  }
}
