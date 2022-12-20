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

    Future.delayed(const Duration(milliseconds: 100), () async {
      await context.read<AppointmentsCubit>().getLastAppointment(true);
    });
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


