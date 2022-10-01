import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/favorite_doctors_list/favorite_doctors_list.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/not_found_data/not_found_data.dart';

import 'favorites_doctors_list_skeleton.dart';

class FavoriteDoctorsListPage extends StatelessWidget {
  const FavoriteDoctorsListPage({
    Key? key,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
  }) : super(key: key);

  final String userId;
  final String buildingId;
  final String clinicId;

  @override
  Widget build(BuildContext context) {
    void _onRefreshData() async {
      context.read<SubscribeCubit>().getFavoritesDoctorsList(
            userId,
            buildingId,
          );
    }

    void _onFilterList(String filterStr) {
      context.read<SubscribeCubit>().filterFavoritesDoctorsList(filterStr);
    }

    _onRefreshData();

    return DefaultScaffold(
      appBarTitle: 'Избранные',
      isChildrenPage: true,
      isSearch: true,
      filteringFunction: _onFilterList,
      child: BlocBuilder<SubscribeCubit, SubscribeState>(
        builder: (context, state) {
          if (state.getFavoriteDoctorsListStatus ==
              GetFavoriteDoctorsListStatuses.failed) {
            return const Text('fail');
          } else if (state.getFavoriteDoctorsListStatus ==
              GetFavoriteDoctorsListStatuses.success) {
            return state.filteredFavoriteDoctorsList!.isEmpty &&
                    state.favoriteDoctorsList!.isNotEmpty
                ? const NotFoundData()
                : FavoriteDoctorsList(
                    doctorsList: state.filteredFavoriteDoctorsList
                        as List<FavoriteDoctor>,
                    onRefreshData: _onRefreshData,
                    userId: userId,
                    buildingId: buildingId,
                    clinicId: clinicId,
                  );
          } else {
            return const FavoritesDoctorsListSkeleton();
          }
        },
      ),
    );
  }
}
