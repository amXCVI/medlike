import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medlike/constants/appointment_statuses.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:medlike/modules/subscribe/schedule/day_appointments_skeleton.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';

class AppointmentsListWidget extends StatelessWidget {
  const AppointmentsListWidget({Key? key, required this.selectedDate})
      : super(key: key);

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    context.read<AppointmentsCubit>().getAppointmentsList(false);
    context.read<ClinicsCubit>().getAllClinicsList(false);

    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
      builder: (context, state) {
        if (state.appointmentsList == null ||
            state.appointmentsList!.isEmpty ||
            state.appointmentsList!
                .where((item) =>
                    AppointmentStatuses.cancellableStatusIds
                        .contains(item.status) &&
                    DateFormat('dd.MM.yyyy').format(item.appointmentDateTime) ==
                        DateFormat('dd.MM.yyyy').format(selectedDate))
                .isEmpty) {
          return const SizedBox();
        } else if (state.getAppointmentsStatus ==
            GetAppointmentsStatuses.success) {
          return ClinicsBuilder(
            appointmentsList: state.appointmentsList!
                    .where((item) =>
                        AppointmentStatuses.cancellableStatusIds
                            .contains(item.status) &&
                        DateFormat('dd.MM.yyyy')
                                .format(item.appointmentDateTime) ==
                            DateFormat('dd.MM.yyyy').format(selectedDate))
                    .toList(),
            selectedDate: selectedDate,
          );
        } else {
          return const DayAppointmentsSkeleton();
        }
      },
    );
  }
}

class ClinicsBuilder extends StatelessWidget {
  const ClinicsBuilder({
    Key? key, 
    required this.appointmentsList, 
    required this.selectedDate
  }) : super(key: key);

  final List<AppointmentModel> appointmentsList;
  final DateTime selectedDate;

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
            selectedDate: selectedDate,
          );
        } else {
          return const DayAppointmentsSkeleton();
        }
      },
    );
  }
}

class AppointmentsList extends StatelessWidget {
  const AppointmentsList({
    Key? key, 
    required this.appointmentsList,
    required this.clinicsList, 
    required this.selectedDate
  }) : super(key: key);

  final List<AppointmentModel> appointmentsList;
  final List<ClinicModel> clinicsList;
  final DateTime selectedDate;

  ClinicModel? getClinic(AppointmentModel item) {
    for(var clinic in clinicsList) {
      if(clinic.id == item.clinicInfo.id) {
        return clinic;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            'Приемы на ${DateFormat('dd.MM.yyyy').format(dateTimeToUTC(selectedDate, int.parse(DateTime.now().timeZoneOffset.inHours.toString())))}',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        ...appointmentsList
            .map(
              (appointmentItem) => Container(
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, top: 8, bottom: 8),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(0, 8),
                      ),
                    ],
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appointmentItem.categoryType == 1 ||
                              appointmentItem.categoryType == 0
                          ? Text(
                              '${CategoryTypes.getCategoryTypeByCategoryTypeId(appointmentItem.categoryType).russianCategoryTypeName}, ${appointmentItem.doctorInfo.specialization}'
                                  .characters
                                  .replaceAll(
                                      Characters(''), Characters('\u{200B}'))
                                  .toString(),
                              style: Theme.of(context).textTheme.titleMedium,
                              overflow: TextOverflow.ellipsis,
                            )
                          : Text.rich(
                              TextSpan(
                                children: [
                                  ...appointmentItem.researches
                                      .map((e) => WidgetSpan(
                                              child: Text(
                                            e.name!.characters
                                                .replaceAll(Characters(''),
                                                    Characters('\u{200B}'))
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                            overflow: TextOverflow.ellipsis,
                                          )))
                                ],
                              ),
                              maxLines: 1,
                            ),
                      const SizedBox(height: 6),
                      appointmentItem.doctorInfo.lastName != null
                          ? Row(
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  child: Text(
                                      '${appointmentItem.doctorInfo.lastName}'[
                                          0]),
                                  backgroundColor: AppColors.mainBrand[100],
                                ),
                                const SizedBox(width: 8.0),
                                Text(
                                  '${appointmentItem.doctorInfo.lastName}' +
                                      '${appointmentItem.doctorInfo.firstName}'[
                                          0] +
                                      '. ${appointmentItem.doctorInfo.middleName}'[
                                          0] +
                                      '.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: AppColors.lightText),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )
                          : const SizedBox(),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          RichText(
                            text: WidgetSpan(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.circleBgFirst,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/appointments/clock.svg'),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      getAppointmentTime(
                                        appointmentItem.appointmentDateTime, 
                                        getClinic(appointmentItem)!.timeZoneOffset ?? 3 // Стандарт МСК +3
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          RichText(
                            text: WidgetSpan(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.circleBgFirst,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/appointments/profile.svg'),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      appointmentItem.patientInfo.name
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            )
            .toList(),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
