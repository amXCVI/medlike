import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/modules/health/filters_page/filters_skeleton.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/widgets/filters/filters_list.dart';

class DiaryFiltersWidget extends StatefulWidget {
  const DiaryFiltersWidget({Key? key}) : super(key: key);

  @override
  State<DiaryFiltersWidget> createState() => _DiaryFiltersWidgetState();
}

class _DiaryFiltersWidgetState extends State<DiaryFiltersWidget> {
  List<String> selected = [];

  @override
  void initState() {
    selected = List.from(context.read<DiaryCubit>().state.filteredSyns);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCubit, DiaryState>(builder: (context, state) {
      void handleCheckItem(int i, bool? isChecked) {
        setState(() {
          final syn = state.diariesCategoriesList![i].synonim;
          if (selected.contains(syn)) {
            selected.remove(syn);
          } else {
            selected.add(syn);
          }
        });
        context.read<DiaryCubit>().setFiltered(selected);
      }

      if (state.getDiaryCategoriesStatuses ==
          GetDiaryCategoriesStatuses.failed) {
        return const Text('');
      } else if (state.getDiaryCategoriesStatuses ==
          GetDiaryCategoriesStatuses.success) {
        return FiltersList(
            filterTitles:
                state.diariesCategoriesList!.map((e) => e.name).toList(),
            values: state.diariesCategoriesList!
                .map((e) => !selected.contains(e.synonim))
                .toList(),
            images: state.diariesCategoriesList!
                .map(
                  (e) => Image.network(
                    '${ApiConstants.baseUrl}${e.filterImg}',
                    width: 20,
                    height: 20,
                  ),
                )
                .toList(),
            onChecked: (i, isChecked) {
              handleCheckItem(i, isChecked);
            });
      } else {
        return const FiltersSkeleton();
      }
    });
  }
}
