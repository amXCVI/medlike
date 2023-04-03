import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/modules/main_page/notifications/appontment_confirm_view.dart';

class AppointmentsConfirmWidget extends StatefulWidget {
  const AppointmentsConfirmWidget({Key? key}) : super(key: key);

  @override
  State<AppointmentsConfirmWidget> createState() => _AppointmentsConfirmWidgetState();
}

class _AppointmentsConfirmWidgetState extends State<AppointmentsConfirmWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentsCubit, AppointmentsState>(
      listenWhen: (previous, current) {
        return previous.getAppointmentsStatus != current.getAppointmentsStatus;
      },
      listener: (context, state) {
        if(state.getAppointmentsStatus == GetAppointmentsStatuses.success) {
          try {
            context.read<AppointmentsCubit>().getLastAppointment(true);
          } catch(err, stacktrace) {
            rethrow;
          }
        }
      },
      builder: (context, state) {
        if (state.lastAppointment == null) {
          return const SizedBox();
        }
        return AppointmentConfirmView(
          appointment: state.lastAppointment!,
        );
      },
    );
  }
}
