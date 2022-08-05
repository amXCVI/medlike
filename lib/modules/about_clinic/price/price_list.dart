import 'package:flutter/material.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/modules/about_clinic/price/price_list_item.dart';
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';

class PriceList extends StatelessWidget {
  const PriceList({Key? key, required this.priceList}) : super(key: key);

  final List<PriceItemModel> priceList;

  @override
  Widget build(BuildContext context) {
    return DefaultScrollbar(
      child: ListView(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          children: priceList
              .map((item) => PriceListItem(
                    priceItem: item,
                  ))
              .toList()),
    );
  }
}
