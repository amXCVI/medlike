import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/medcard/medcard_cubit.dart';
import 'package:medlike/modules/medcard/medcard_docs_list/filters_lists.dart';
import 'package:medlike/themes/colors.dart';

class SelectedFiltersWidget extends StatelessWidget {
  const SelectedFiltersWidget({Key? key, required this.isShowingWidget})
      : super(key: key);
  final bool isShowingWidget;

  @override
  Widget build(BuildContext context) {
    if (!isShowingWidget) {
      return const SizedBox();
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColors.secondBackground,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 18, right: 18, bottom: 38, left: 18),
        child: BlocBuilder<MedcardCubit, MedcardState>(
          builder: (context, state) {
            if (state.medcardSelectedFilters == null ||
                state.medcardSelectedFilters!.isEmpty) {
              return const SizedBox();
            }
            return Text.rich(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    const TextSpan(text: 'Выбраны: '),
                    ...?state.medcardSelectedFilters?.entries.map((entry) {
                      return TextSpan(
                        text: medcardFiltersList
                            .firstWhere((e) => e.value == entry.key)
                            .title,
                        children: [
                          TextSpan(
                              text: ' ${entry.value.label}',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor)),
                          TextSpan(
                              text: entry.key != medcardFiltersList.first.value
                                  ? ''
                                  : ', '),
                        ],
                      );
                    }).toList()
                  ],
                ));
          },
        ),
      ),
    );
  }
}
