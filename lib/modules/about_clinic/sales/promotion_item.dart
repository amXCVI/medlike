import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/api/api_constants.dart';

class PromotionItem extends StatelessWidget {
  const PromotionItem({
    Key? key,
    required this.promotionItem,
    required this.onTap,
  }) : super(key: key);

  final ClinicPromotionModel promotionItem;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
        color: Theme.of(context).colorScheme.background,
      ),
      child: Column(
        children: [
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12.0),
                    topLeft: Radius.circular(12.0)),
                child: Image.network(
                  '${ApiConstants.baseUrl}/api/v1.0/promotions/${promotionItem.id}/banner',
                  headers: {
                    'Authorization': 'Bearer ${state.token}',
                  },
                  height: MediaQuery.of(context).size.width / 16 * 9,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    context.read<UserCubit>().saveAccessToken();
                    return Container();
                  },
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  promotionItem.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8.0),
                Text(
                  promotionItem.description,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: AppColors.lightText),
                ),
                const SizedBox(height: 14.0),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/appointments/clock.svg'),
                    const SizedBox(width: 8.0),

                    /// Почему-то дата парсится без учета таймзоны. Что-то где-то сломано
                    /// Поэтому просто добавляю 12 часов, иначе вчерашний день
                    Text(
                        'c ${DateFormat('dd.MM.yyyy').format(promotionItem.dateFrom.add(const Duration(hours: 12)))} по ${DateFormat('dd.MM.yyyy').format(promotionItem.dateTo.add(const Duration(hours: 12)))}'),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    promotionItem.defaultPrice != 0
                        ? Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/icons/clinics/majesticons_rubel-circle.svg'),
                              const SizedBox(width: 8.0),
                              Text(
                                '${promotionItem.defaultPrice % 100 > 0 ? promotionItem.defaultPrice / 100 : (promotionItem.defaultPrice / 100).round()}',
                                style: const TextStyle(
                                  color: AppColors.lightText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              const Text(
                                ' ₽',
                                style: TextStyle(
                                    color: AppColors.lightText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough,
                                    fontFamily: 'Arial'),
                              ),
                              const SizedBox(width: 8.0),
                            ],
                          )
                        : const SizedBox(),
                    promotionItem.promoPrice != 0
                        ? Row(
                            children: [
                              Text(
                                '${promotionItem.promoPrice % 100 > 0 ? promotionItem.promoPrice / 100 : (promotionItem.promoPrice / 100).round()}',
                                style: const TextStyle(
                                  color: AppColors.mainBrandColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Text(
                                ' ₽',
                                style: TextStyle(
                                    color: AppColors.mainBrandColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial'),
                              ),
                            ],
                          )
                        : const SizedBox()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
