import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/domain/app/cubit/medcard/medcard_cubit.dart';
import 'package:medlike/modules/medcard/medcard_docs_list/filters_lists.dart';
import 'package:medlike/themes/colors.dart';

class MedcardFiltersWidget extends StatelessWidget {
  const MedcardFiltersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleSelectFilter(
      MedcardFilterItemModel filter,
      String categoryValue,
    ) {
      context.read<MedcardCubit>().changeMedcardFilters(
          filterItem: filter, categoryValue: categoryValue);
    }

    return Container(
      color: AppColors.secondBackground,
      height: medcardFiltersList.length * 111 + 20,
      child: ListView(
        children: [
          ...medcardFiltersList.map((filter) =>
              BlocBuilder<MedcardCubit, MedcardState>(
                builder: (context, state) {
                  if (!state.medcardSelectedFilters!
                      .containsKey(filter.value)) {
                    context.read<MedcardCubit>().changeMedcardFilters(
                        filterItem: filter.filters.first,
                        categoryValue: filter.value);
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          filter.title,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      SizedBox(
                        height: 75,
                        child: ListView(
                          padding: const EdgeInsets.all(8.0),
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            ...filter.filters.map((e) {
                              bool isSelected =
                                  state.medcardSelectedFilters != null
                                      ? state.medcardSelectedFilters!
                                          .containsValue(e)
                                      : false;
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0,
                                    right: 8.0,
                                    bottom: 15.0,
                                    left: 8.0),
                                child: InkWell(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                  onTap: () {
                                    handleSelectFilter(e, filter.value);
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
                                      e.label,
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
                      const Divider(indent: 16, endIndent: 16),
                    ],
                  );
                },
              ))
        ],
      ),
    );
  }
}
