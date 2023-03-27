import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/modules/main_page/notifications/appontment_confirm_view.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AppointmentsConfirmWidget extends StatefulWidget {
  const AppointmentsConfirmWidget({Key? key}) : super(key: key);

  @override
  State<AppointmentsConfirmWidget> createState() => _AppointmentsConfirmWidgetState();
}

class _AppointmentsConfirmWidgetState extends State<AppointmentsConfirmWidget> {

  @override
  void initState() {
    super.initState();
    try {
      context.read<AppointmentsCubit>().getLastAppointment(true);
    } catch(err, stacktrace) {
      Sentry.captureException(err, stackTrace: stacktrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
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


