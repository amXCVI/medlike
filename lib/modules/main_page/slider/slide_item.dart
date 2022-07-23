import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/api/api_constants.dart';

class SlideItem extends StatelessWidget {
  const SlideItem({Key? key, required this.promotionItem})
      : super(key: key);

  final MainscreenPromotionModel promotionItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
                //! Не совсем правильно.
                //! Токен беру из стейта, по-хорошему, нужно брать из sessionStorage
                child: Image.network(
                  '${ApiConstants.baseUrl}/api/v1.0/promotions/${promotionItem.id}/banner',
                  headers: {
                    'Authorization': 'Bearer ${state.token}',
                  },
                  height: MediaQuery.of(context).size.width / 16 * 9,
                  fit: BoxFit.cover,
                  // height: MediaQuery.of(context).size.width / 16 * 9 - 32,
                  // width: MediaQuery.of(context).size.width,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            promotionItem.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        promotionItem.defaultPrice != 0
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${promotionItem.defaultPrice / 100}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    '${promotionItem.promoPrice / 100}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
