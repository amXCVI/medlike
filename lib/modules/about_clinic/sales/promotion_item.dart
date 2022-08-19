import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/themes/colors.dart';

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
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, bottom: 4, left: 16),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/clinics/ic_stok_star_red.svg'),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(promotionItem.name,
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 5),
                  Text(
                    promotionItem.description,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.lightText),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset(
                          'assets/icons/clinics/ic_time_outline.svg'),
                      const SizedBox(width: 18),
                      Text(
                          '${DateFormat('dd.MM.yyyy').format(promotionItem.dateFrom)} - ${DateFormat('dd.MM.yyyy').format(promotionItem.dateTo)}'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  promotionItem.defaultPrice != 0 &&
                          promotionItem.promoPrice != 0
                      ? Row(children: [
                          SvgPicture.asset('assets/icons/clinics/ic_ruble.svg'),
                          const SizedBox(width: 18),
                          Text(
                            '${promotionItem.defaultPrice / 100} ₽',
                            style: const TextStyle(
                              color: AppColors.lightText,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            '${promotionItem.promoPrice / 100} ₽',
                            style: const TextStyle(
                              color: AppColors.mainBrandColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ])
                      : const SizedBox(),
                  const SizedBox(height: 18),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
