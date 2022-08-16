import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';
import 'package:medlike/modules/health/filters_page/filters_skeleton.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/widgets/filters/filters_list.dart';
import 'package:auto_route/auto_route.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({Key? key}) : super(key: key);

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  List<String> selected = [];

  @override
  void initState() {
    selected = List.from(context.read<DiaryCubit>().state.filteredSyns);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Фильтр',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                context.router.pop();
              },
              icon: SvgPicture.asset('assets/icons/app_bar/close_search.svg')),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<DiaryCubit>().setFiltered(selected);
                  context.router.pop();
                },
                icon: SvgPicture.asset(
                    'assets/icons/app_bar/ic_check_filters.svg')),
          ],
        ),
        body: BlocBuilder<DiaryCubit, DiaryState>(
          builder: (context, state) {
            if (state.getDiaryCategoriesStatuses == GetDiaryCategoriesStatuses.failed) {
              return const Text('');
            } else if (state.getDiaryCategoriesStatuses == GetDiaryCategoriesStatuses.success ) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: FiltersList(
                  filterTitles: state.diariesCategoriesList!.map(
                    (e) => e.name).toList(), 
                  values: state.diariesCategoriesList!.map(
                    (e) => !selected.contains(e.synonim)).toList(), 
                  images: state.diariesCategoriesList!.map(
                    (e) => Image.network(
                      '${ApiConstants.baseUrl}${e.filterImg}',
                        width: 20,
                        height: 20,
                      ),
                  ).toList(), 
                  onChecked: (i, isChecked) {
                    setState(() {
                      final syn = state.diariesCategoriesList![i].synonim;
                        if(selected.contains(syn)) {
                          selected.remove(syn);
                        } else {
                          selected.add(syn);
                        }
                    });
                  }
                ),
              );
            } else {
              return const FiltersSkeleton();
            }
          }
      )
    );
  }
}
