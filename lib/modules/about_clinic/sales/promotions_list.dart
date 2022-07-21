import 'package:flutter/material.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/modules/about_clinic/sales/promotion_item.dart';

class PromotionsList extends StatelessWidget {
  const PromotionsList(
      {Key? key, required this.promotionsList, this.onRefreshData})
      : super(key: key);

  final List<ClinicPromotionModel> promotionsList;
  final dynamic onRefreshData;

  void _handleTapOnPromotion(ClinicPromotionModel promotion) {}

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefreshData(isRefresh: true),
      child: ListView(
          shrinkWrap: true,
          children: promotionsList
              .map((item) => PromotionItem(
                    promotionItem: item,
                    onTap: () {
                      _handleTapOnPromotion(item);
                    },
                  ))
              .toList()),
    );
  }
}
