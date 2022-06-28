import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/modules/appointments/appointments_list.dart';
import 'package:medlike/modules/appointments/appointments_list_skeleton.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onLoadDada({bool isRefresh = true}) {
      context.read<AppointmentsCubit>().getAppointmentsList(isRefresh);
    }

    _onLoadDada();

    return WillPopScope(
      onWillPop: () async {
        context.router.navigateNamed(AppRoutes.main);
        return false;
      },
      child: DefaultScaffold(
        appBarTitle: 'Мои приемы',
        child: BlocBuilder<AppointmentsCubit, AppointmentsState>(
          builder: (context, state) {
            if (state.getAppointmentsStatus ==
                GetAppointmentsStatuses.failed) {
              return const Text('');
            } else if (state.getAppointmentsStatus ==
                GetAppointmentsStatuses.success) {
              return AppointmentsList(
                appointmentsList: state.appointmentsList as List<AppointmentModel>,
                onRefreshData: _onLoadDada,
              );
            } else {
              return const AppointmentsListSkeleton();
            }
          },
        ),
      ),
    );
  }
}
