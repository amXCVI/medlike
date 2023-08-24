import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/research_item.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/research_recommendations.dart';

class ResearchesInfo extends StatelessWidget {
  const ResearchesInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscribeCubit, SubscribeState>(
        builder: (context, state) {
      if (state.getAppointmentInfoStatus ==
              GetAppointmentInfoStatuses.success &&
          state.selectedResearchesIds != null &&
          state.selectedResearchesIds!.isNotEmpty) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Услуга',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            state.selectedResearchesIds != null
                ? Column(
                    children: [
                      ...state.selectedResearchesIds!.map((e) {
                        Research? research;
                        RecommendationItemModel? recommendation;
                        try {
                          research = state.researchesList!
                              .firstWhere((element) => element.id == e);
                          if (state.appointmentInfoData!.recommendations !=
                              null) {
                            recommendation = state
                                .appointmentInfoData?.recommendations
                                .firstWhere((element) =>
                                    element.serviceName == research?.name);
                          }
                        } catch (err) {
                          print(err);
                        }

                        if (research != null) {
                          return ResearchItem(
                            researchName: research.name,
                            researchRecommendations: recommendation,
                          );
                        } else {
                          return const SizedBox();
                        }
                      }),
                      ResearchRecommendations(
                        recommendationsList:
                            state.appointmentInfoData?.recommendations,
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
