import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/tour_tooltip.dart';
import 'package:medlike/data/models/models.dart';
import 'package:auto_route/auto_route.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/tour/tour_cubit.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';
import 'package:medlike/widgets/buttons/simple_button.dart';
import 'package:medlike/widgets/tour_tooltip/tour_tooltip.dart';

class AppointmentConfirmView extends StatefulWidget {
  const AppointmentConfirmView({Key? key, required this.appointment})
      : super(key: key);

  final AppointmentModelWithTimeZoneOffset appointment;

  @override
  State<AppointmentConfirmView> createState() => _AppointmentConfirmViewState();
}

class _AppointmentConfirmViewState extends State<AppointmentConfirmView> {
  final _key = GlobalKey();

  @override
  void initState() {
    /// TODO: разбораться с таймером
    super.initState();
  }

  void _showTourTooltip(BuildContext context){
    final Map<TourChecked, bool>? tourState = context.read<TourCubit>().state.tourChecked;

    if(tourState?[TourChecked.event] ?? true) return;

    TourTooltip.of(context).create(TourTooltips.resultEvent, _key, onDismiss: (){
      context.read<TourCubit>().checkItem(TourChecked.event);
    });
  }

  @override
  Widget build(BuildContext context) {
    String getAppointmentsDesc(
        AppointmentModelWithTimeZoneOffset appointmentItem) {
      final date = getAppointmentTime(
        appointmentItem.appointmentDateTime,
        appointmentItem.timeZoneOffset,
        formatSting: 'dd.MM.yyyy, HH:mm',
      );

      if (appointmentItem.doctorInfo.lastName == null) {
        return '${appointmentItem.researches[0].name}, $date';
      }

      final lastName = appointmentItem.doctorInfo.lastName ?? ' ';
      final middleName = appointmentItem.doctorInfo.middleName ?? ' ';
      final firstName = appointmentItem.doctorInfo.firstName ?? ' ';
      final initials = '$lastName ${firstName[0]}. ${middleName[0]}.';

      return '$initials, ${appointmentItem.researches.isNotEmpty ? appointmentItem.researches[0].name : ''}, $date';
    }

    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
        builder: (context, state) {

          _showTourTooltip(context);


      final eventsCount = state.confirmCounter ?? 1;

      const title = 'Ожидает подтверждения';

      final description = getAppointmentsDesc(widget.appointment);

      final content = Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title.characters
                      .replaceAll(Characters(''), Characters('\u{200B}'))
                      .toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  key: _key,
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 12.0),
                  decoration: const BoxDecoration(
                      color: AppColors.mainError,
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: Text(
                    eventsCount.toString(),
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            const SizedBox(height: 6),
            Text(
              description.characters
                  .replaceAll(Characters(''), Characters('\u{200B}'))
                  .toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.lightText),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            const SizedBox(height: 14),
            NotificationBottom(appointment: widget.appointment)
          ],
        ),
      );

      return Container(
          margin: const EdgeInsets.only(
              top: 0, left: 16.0, bottom: 32.0, right: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
            color: Theme.of(context).colorScheme.background,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            child: Material(
                child: InkWell(
                    onTap: () {
                      context.router.push(AppointmentsRoute(
                          initDay: widget.appointment.appointmentDateTime));
                    },
                    child: content)),
          ));
    });
  }
}

class NotificationBottom extends StatelessWidget {
  const NotificationBottom({Key? key, required this.appointment})
      : super(key: key);

  final AppointmentModelWithTimeZoneOffset appointment;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
      builder: (context, state) {
        final isDisabled = state.putAppointmentStatus ==
                PutAppointmentsStatuses.loading ||
            state.deleteAppointmentStatus == DeleteAppointmentStatuses.loading;

        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: SimpleButton(
                isPrimary: true,
                isDisabled: isDisabled,
                isLoading: state.putAppointmentStatus ==
                    PutAppointmentsStatuses.loading,
                labelText: 'Подтвердить',
                onTap: () {
                  context.read<AppointmentsCubit>().confirmAppointment(
                      appointmentId: appointment.id,
                      userId: appointment.patientInfo.id ?? '');
                },
              )),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                  child: SimpleButton(
                      labelText: 'Отменить',
                      isLoading: state.deleteAppointmentStatus ==
                          DeleteAppointmentStatuses.loading,
                      isDisabled: isDisabled,
                      onTap: () {
                        context.read<AppointmentsCubit>().deleteAppointment(
                            appointmentId: appointment.id,
                            userId: appointment.patientInfo.id ?? '');
                      }))
            ],
          ),
        );
      },
    );
  }
}
