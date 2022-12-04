import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/main_page/notifications/appontment_confirm_view.dart';
import 'package:medlike/modules/main_page/notifications/notifications_widget_view.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({Key? key}) : super(key: key);

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100), () async {
      //await context.read<ClinicsCubit>().getAllClinicsList(true);
      await context.read<AppointmentsCubit>().getLastAppointment(true);
      await context.read<UserCubit>().getLastNotReadNotification(true);
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
      builder: (context, state) {
        return ClinicsBuilder(
          lastAppointment: state.lastAppointment,
          isLoaded: isLoaded,
        );
      },
    );
  }
}

class ClinicsBuilder extends StatelessWidget {
  const ClinicsBuilder(
      {Key? key, required this.isLoaded, required this.lastAppointment})
      : super(key: key);

  final AppointmentModelWithTimeZoneOffset? lastAppointment;
  final bool isLoaded;

  ClinicModel? getClinic(AppointmentModelWithTimeZoneOffset? item,
      List<ClinicModel>? clinicsList) {
    for (var clinic in clinicsList ?? []) {
      if (clinic.id == item?.clinicInfo.id) {
        return clinic;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClinicsCubit, ClinicsState>(
      builder: (context, state) {
        if (!isLoaded ||
            state.getAllClinicsListStatus !=
                GetAllClinicsListStatuses.success) {
          return const SizedBox();
        }
        if (lastAppointment != null) {
          return AppointmentConfirmView(
            clinic: getClinic(lastAppointment, state.clinicsList),
            appointment: lastAppointment!,
          );
        } else {
          return NotificationsWidgetView(
            clinic: getClinic(lastAppointment, state.clinicsList),
          );
        }
      },
    );
  }
}
