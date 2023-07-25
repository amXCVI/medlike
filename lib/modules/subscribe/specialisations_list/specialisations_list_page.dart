import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/specialisations_list/specialisations_list.dart';
import 'package:medlike/modules/subscribe/specialisations_list/specialisations_list_skeleton.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/widgets/not_found_data/not_found_data.dart';

@RoutePage()
class SpecialisationsListPage extends StatelessWidget {
  const SpecialisationsListPage({
    Key? key,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
    required this.categoryTypeId,
  }) : super(key: key);

  final String userId;
  final String buildingId;
  final String clinicId;
  final int categoryTypeId;

  @override
  Widget build(BuildContext context) {
    void _onRefreshData() async {
      context.read<SubscribeCubit>().getSpecialisationsList(
            userId,
            clinicId,
            buildingId,
            CategoryTypes.getCategoryTypeByCategoryTypeId(categoryTypeId)
                .categoryType,
          );
    }

    void _onFilterList(String filterStr) {
      context.read<SubscribeCubit>().filterSpecialisationsList(filterStr);
    }

    _onRefreshData();

    return DefaultScaffold(
      appBarTitle: CategoryTypes.getCategoryTypeByCategoryTypeId(categoryTypeId)
          .russianCategoryTypeName,
      isSearch: true,
      filteringFunction: _onFilterList,
      isChildrenPage: true,
      child: BlocBuilder<SubscribeCubit, SubscribeState>(
        builder: (context, state) {
          if (state.getSpecialisationsListStatus ==
              GetSpecialisationsListStatuses.failed) {
            return const Text('');
          } else if (state.getSpecialisationsListStatus ==
              GetSpecialisationsListStatuses.success) {
            return state.specialisationsList!.isNotEmpty &&
                    state.filteredSpecialisationsList!.isEmpty
                ? const NotFoundData()
                : SpecialisationsList(
                    specialisationsList: state.filteredSpecialisationsList
                        as List<NavigationItem>,
                    onRefreshData: _onRefreshData,
                    userId: userId,
                    clinicId: clinicId,
                    buildingId: buildingId,
                    categoryTypeId: categoryTypeId,
                    isFilteredList: state.filteredSpecialisationsList?.length !=
                        state.specialisationsList?.length,
                  );
          } else {
            return const SpecialisationsListSkeleton();
          }
        },
      ),
    );
  }
}
