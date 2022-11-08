import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:medlike/modules/appointments/appointments_calendar.dart';
import 'package:medlike/modules/appointments/appointments_list.dart';
import 'package:medlike/modules/appointments/appointments_list_skeleton.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({Key? key, this.isRefresh = false}) : super(key: key);

  /// Используется для принудительной подгрузки данных.
  /// При переходе в мои приемы со страницы записи, например
  final bool? isRefresh;

  @override
  Widget build(BuildContext context) {
    Future<void> _onLoadDada({bool isRefresh = true}) async {
      context.read<AppointmentsCubit>().getAppointmentsList(isRefresh);
      //context.read<ClinicsCubit>().getAllClinicsList(isRefresh);
    }

    _onLoadDada(isRefresh: isRefresh as bool);

    return WillPopScope(
      onWillPop: () async {
        context.router.navigateNamed(AppRoutes.main);
        return false;
      },
      child: DefaultScaffold(
        appBarTitle: 'Мои приемы',
        child: RefreshIndicator(
          onRefresh: () {
            return _onLoadDada(isRefresh: true);
          },
          child: DefaultScrollbar(
            child: ListView(
              shrinkWrap: true,
              children: [
                const AppointmentsCalendar(),
                const SizedBox(height: 16),
                BlocBuilder<AppointmentsCubit, AppointmentsState>(
                  builder: (context, state) {
                    if (state.getAppointmentsStatus ==
                        GetAppointmentsStatuses.failed) {
                      return const Text('');
                    } else if (state.getAppointmentsStatus ==
                        GetAppointmentsStatuses.success) {
                      return ClinicsBuilder(
                        appointmentsList: state.filteredAppointmentsList
                            as List<AppointmentModel>,
                        onRefreshData: _onLoadDada,
                      );
                    } else {
                      return const AppointmentsListSkeleton();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClinicsBuilder extends StatelessWidget {
  const ClinicsBuilder({
    Key? key,
    required this.appointmentsList,
    required this.onRefreshData,
  }) : super(key: key);

  final List<AppointmentModel> appointmentsList;
  final Function onRefreshData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClinicsCubit, ClinicsState>(
      builder: (context, state) {
        if (state.getAllClinicsListStatus ==
          GetAllClinicsListStatuses.failed) {
          return const Text('');
        } else if (state.getAllClinicsListStatus ==
          GetAllClinicsListStatuses.success) {
          return AppointmentsList(
            appointmentsList: appointmentsList,
            clinicsList: state.clinicsList!,
            onRefreshData: onRefreshData,
          );
        } else {
          return const AppointmentsListSkeleton();
        }
      },
    );
  }
}
