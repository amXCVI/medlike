import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/research_cabinets_list/research_cabinets_list.dart';
import 'package:medlike/modules/subscribe/research_cabinets_list/research_cabinets_list_skeleton.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class ResearchCabinetsListPage extends StatelessWidget {
  const ResearchCabinetsListPage({
    Key? key,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
    required this.categoryTypeId,
    required this.researchIds,
  }) : super(key: key);

  final String userId;
  final String buildingId;
  final String clinicId;
  final int categoryTypeId;
  final List<String> researchIds;

  @override
  Widget build(BuildContext context) {
    void _onRefreshData() async {
      context.read<SubscribeCubit>().getResearchCabinetsList(
            userId,
            clinicId,
            buildingId,
            CategoryTypes.getCategoryTypeByCategoryTypeId(categoryTypeId)
                .categoryType,
            researchIds,
          );
    }

    void _onFilterList(String filterStr) {
      context.read<SubscribeCubit>().filterCabinetsList(filterStr);
    }

    _onRefreshData();

    return DefaultScaffold(
      appBarTitle: CategoryTypes.getCategoryTypeByCategoryTypeId(categoryTypeId)
          .russianCategoryTypeName,
      appBarSubtitle: getCountResearches(researchIds.length),
      isChildrenPage: true,
      isSearch: true,
      filteringFunction: _onFilterList,
      child: BlocBuilder<SubscribeCubit, SubscribeState>(
        builder: (context, state) {
          if (state.getCabinetsListStatus == GetCabinetsListStatuses.failed) {
            return const Text('');
          } else if (state.getCabinetsListStatus ==
              GetCabinetsListStatuses.success) {
            return ResearchCabinetsList(
              doctorsList: state.filteredDoctorsList as List<Doctor>,
              onRefreshData: _onRefreshData,
              cabinetsList: state.filteredCabinetsList as List<Cabinet>,
            );
          } else {
            return const ResearchCabinetsListSkeleton();
          }
        },
      ),
    );
  }
}

String getCountResearches(int count) {
  int n = count;

  n %= 100;
  if (n >= 5 && n <= 20) {
    return '$count услуг';
  }
  n %= 10;
  if (n == 1) {
    return '$count услуга';
  }
  if (n >= 2 && n <= 4) {
    return '$count услуги';
  }
  return '$count услуг';
}
