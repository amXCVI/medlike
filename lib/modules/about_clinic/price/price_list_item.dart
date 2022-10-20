import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/modules/about_clinic/price/recommendations_bottom_sheet.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class PriceListItem extends StatelessWidget {
  const PriceListItem({Key? key, required this.priceItem}) : super(key: key);

  final PriceItemModel priceItem;

  @override
  Widget build(BuildContext context) {
    var rublesFormat =
        NumberFormat.currency(locale: "ru_RU", symbol: 'P', decimalDigits: 0);

    return SubscribeRowItem(
        title: priceItem.title,
        subtitle: rublesFormat.format(priceItem.price / 100),
        isRightArrow: priceItem.haveRecommendations,
        onTap: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
              ),
              context: context,
              builder: (context) =>
                  RecommendationBottomSheet(serviceId: priceItem.serviceId));
        });
  }
}
