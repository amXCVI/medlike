import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:medlike/modules/about_clinic/all_clinics_list/all_clinics_list.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

import 'all_clinics_list_skeleton.dart';

class AllClinicsListPage extends StatelessWidget {
  const AllClinicsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onLoadDada(bool isRefresh) {
      context.read<ClinicsCubit>().getAllClinicsList(false);
    }

    _onLoadDada(false);


    return DefaultScaffold(
      appBarTitle: 'Клиника',
      child: BlocBuilder<ClinicsCubit, ClinicsState>(
        builder: (context, state) {
          if (state.getAllClinicsListStatus ==
              GetAllClinicsListStatuses.failed) {
            return const Text('fail');
          } else if (state.getAllClinicsListStatus ==
              GetAllClinicsListStatuses.success) {
            return AllClinicsList(
              clinicsList:
              state.clinicsList as List<ClinicModel>,
              onRefreshData: () {
                _onLoadDada(true);
              },
            );
          } else {
            return const AllClinicsListSkeleton();
          }
        },
      ),
    );
  }
}
