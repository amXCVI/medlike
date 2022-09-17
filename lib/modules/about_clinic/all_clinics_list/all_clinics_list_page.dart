import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:medlike/modules/about_clinic/all_clinics_list/all_clinics_list.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

import 'all_clinics_list_skeleton.dart';

class AllClinicsListPage extends StatelessWidget {
  const AllClinicsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onLoadDada({bool isRefresh = false}) {
      context.read<ClinicsCubit>().getAllClinicsList(isRefresh);
    }

    _onLoadDada();


    return WillPopScope(
      onWillPop: () async {
        context.router.navigateNamed(AppRoutes.main);
        return false;
      },
      child: DefaultScaffold(
        appBarTitle: 'Клиника',
        child: BlocBuilder<ClinicsCubit, ClinicsState>(
          builder: (context, state) {
            if (state.getAllClinicsListStatus ==
                GetAllClinicsListStatuses.failed) {
              return const Text('');
            } else if (state.getAllClinicsListStatus ==
                GetAllClinicsListStatuses.success) {
              return AllClinicsList(
                  clinicsList: state.clinicsList as List<ClinicModel>,
                  onRefreshData: _onLoadDada);
            } else {
              return const AllClinicsListSkeleton();
            }
          },
        ),
      ),
    );
  }
}
