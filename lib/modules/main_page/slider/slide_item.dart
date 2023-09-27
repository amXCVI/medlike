import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/api/api_constants.dart';

class SlideItem extends StatelessWidget {
  const SlideItem({Key? key, required this.promotionItem}) : super(key: key);

  final MainscreenPromotionModel promotionItem;

  @override
  Widget build(BuildContext context) {
    void handleTapOnBanner() {
      context.router.push(SalesRoute(clinicId: promotionItem.clinicId));
    }

    return GestureDetector(
      onTap: handleTapOnBanner,
      child: Container(
        width: MediaQuery.of(context).size.width - 32 - 4,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColors.homeSliderGradientColor1,
                AppColors.homeSliderGradientColor2,
              ],
              stops: [
                0,
                1
              ]),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    '${ApiConstants.baseUrl}/api/v1.0/promotions/${promotionItem.id}/banner',
                    headers: {
                      'Authorization': 'Bearer ${state.token}',
                    },
                    height: MediaQuery.of(context).size.width / 16 * 9,
                    width: MediaQuery.of(context).size.width - 32 - 4,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      context.read<UserCubit>().saveAccessToken();
                      return Container();
                    },
                  ),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      AppColors.homeSliderGradientColor1,
                      AppColors.homeSliderGradientColor2,
                    ],
                    stops: [
                      0,
                      1
                    ]),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    promotionItem.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 140,
                    child: Text(
                      promotionItem.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 8,
                      softWrap: true,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    promotionItem.defaultPrice != 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${(promotionItem.defaultPrice) % 100 > 0 ? promotionItem.defaultPrice / 100 : (promotionItem.defaultPrice / 100).round()}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Text(
                                ' ₽',
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    promotionItem.promoPrice != 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${(promotionItem.promoPrice) % 100 > 0 ? promotionItem.promoPrice / 100 : (promotionItem.promoPrice / 100).round()}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Text(
                                ' ₽',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Arial',
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
