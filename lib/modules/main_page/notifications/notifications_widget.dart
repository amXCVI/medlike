import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/main_page/notifications/notifications_widget_view.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getLastNotReadNotification();

    context.read<AppointmentsCubit>().getLastAppointment();

    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
      builder: (context, state) {
        if (state.lastAppointment == null ||
            state.getAppointmentsStatus !=
                GetAppointmentsStatuses.success) {
          return const SizedBox();
        }

        return NotificationsWidgetView(
          appointment: state.lastAppointment
        );
      },
    );
  }
}
