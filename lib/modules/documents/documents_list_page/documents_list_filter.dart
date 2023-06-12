import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/document_models/document_models.dart';
import 'package:medlike/domain/app/cubit/documents/documents_cubit.dart';
import 'package:medlike/themes/colors.dart';

import 'filters_list.dart';

class DocumentsFiltersWidget extends StatelessWidget {
  const DocumentsFiltersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleSelectFilter(
      DocumentFilterItemModel filter,
      String categoryValue,
    ) {
      context.read<DocumentsCubit>().changeDocumentsFilters(
          filterItem: filter, categoryValue: categoryValue);
    }

    return Container(
      color: AppColors.secondBackground,
      height: documentFiltersList.length * 111 + 20,
      child: ListView(
        children: [
          ...documentFiltersList.map((filter) =>
              BlocBuilder<DocumentsCubit, DocumentsState>(
                builder: (context, state) {
                  if (!state.documentsSelectedFilters!
                      .containsKey(filter.value)) {
                    context.read<DocumentsCubit>().changeDocumentsFilters(
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
                                  state.documentsSelectedFilters != null
                                      ? state.documentsSelectedFilters!
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
                    ],
                  );
                },
              ))
        ],
      ),
    );
  }
}
