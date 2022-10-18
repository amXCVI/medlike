import 'package:flutter/material.dart';
import 'package:medlike/modules/about_clinic/price/price_filters_list.dart';
import 'package:medlike/themes/colors.dart';

class PriceFiltersWidget extends StatelessWidget {
  const PriceFiltersWidget({
    Key? key,
    required this.handleTapOnFilterItem,
    required this.selectedFilters,
  }) : super(key: key);

  final void Function(String) handleTapOnFilterItem;
  final List<String> selectedFilters;

  @override
  Widget build(BuildContext context) {

    return Container(
      color: AppColors.secondBackground,
      height: 107 + 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text('Период',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.mainText,
                    )),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                ...priceFiltersList.map((item) {
                  bool isSelected = selectedFilters.contains(item.value);
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, right: 8.0, bottom: 15.0, left: 8.0),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      onTap: () {
                        handleTapOnFilterItem(item.value);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Text(
                          item.label,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: isSelected
                                      ? Colors.white
                                      : AppColors.mainText),
                        ),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
          const SizedBox(height: 13),
        ],
      ),
    );
  }
}
