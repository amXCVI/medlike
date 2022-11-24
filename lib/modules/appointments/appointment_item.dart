import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/models.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/modules/appointments/appointment_item_recomendations.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/clinic_address_helper.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';
import 'package:medlike/widgets/buttons/simple_button.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem(
      {Key? key, required this.appointmentItem, required this.clinic})
      : super(key: key);

  final AppointmentModel appointmentItem;
  final ClinicModel clinic;

  @override
  Widget build(BuildContext context) {
    final title = appointmentItem.doctorInfo.specialization != null ? 
      '${CategoryTypes.getCategoryTypeByCategoryTypeId(appointmentItem.categoryType).russianCategoryTypeName}, ${appointmentItem.doctorInfo.specialization}'
      : CategoryTypes.getCategoryTypeByCategoryTypeId(appointmentItem.categoryType).russianCategoryTypeName;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appointmentItem.categoryType == 1 || appointmentItem.categoryType == 0
              ? Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium)
              : Text.rich(TextSpan(children: [
                  WidgetSpan(
                      child: Text(
                          '${CategoryTypes.getCategoryTypeByCategoryTypeId(appointmentItem.categoryType).russianCategoryTypeName}, ',
                          style: Theme.of(context).textTheme.titleMedium)),
                  ...appointmentItem.researches.map((e) => WidgetSpan(
                      child: Text(e.name as String,
                          style: Theme.of(context).textTheme.titleMedium)))
                ])),
          appointmentItem.doctorInfo.id != null &&
                  appointmentItem.doctorInfo.id!.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 15.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        child: Text(
                          appointmentItem.doctorInfo.lastName![0],
                          style: const TextStyle(fontFamily: 'AquawaxPro'),
                        ),
                        backgroundColor: AppColors.mainBrand[100],
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                          '${appointmentItem.doctorInfo.lastName} ${appointmentItem.doctorInfo.firstName![0]}. ${appointmentItem.doctorInfo.middleName![0]}.',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.lightText)),
                    ],
                  ),
                )
              : const SizedBox(height: 15.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/icons/appointments/solid.svg'),
              const SizedBox(width: 8.0),
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: Text(
                    ClinicAddressHelper.getShortAddress(
                            appointmentItem.clinicInfo.address!) +
                        ', ' +
                        appointmentItem.researchPlace,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodySmall),
              ),
            ],
          ),
          AppointmentItemRecommendations(
            recommendations: appointmentItem.recommendations ?? '',
            serviceName: appointmentItem.categoryType == 1 ||
                    appointmentItem.categoryType == 0
                ? '${CategoryTypes.getCategoryTypeByCategoryTypeId(appointmentItem.categoryType).russianCategoryTypeName}, ${appointmentItem.doctorInfo.specialization}'
                : '${CategoryTypes.getCategoryTypeByCategoryTypeId(appointmentItem.categoryType).russianCategoryTypeName}, ${appointmentItem.researches.map(
                      (e) => e.name as String,
                    ).join(', ')}',
          ),
          const SizedBox(height: 8.0),
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
                        SvgPicture.asset('assets/icons/appointments/clock.svg'),
                        const SizedBox(width: 8.0),
                        Text(getAppointmentTime(
                          appointmentItem.appointmentDateTime,
                          clinic.timeZoneOffset ?? 3, // Стандарт МСК
                          isMSK: true
                        )),
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
                        Text(appointmentItem.patientInfo.name.toString()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (appointmentItem.status == 4)
            const SizedBox(height: 14.0),
          if (appointmentItem.status == 4)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SimpleButton(
                    isPrimary: true,
                    labelText: 'Подтвердить',
                    onTap: () {
                      context.read<AppointmentsCubit>().confirmAppointment(
                        appointmentId: appointmentItem.id,
                        userId: appointmentItem.patientInfo.id as String);
                    },
                  )
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: SimpleButton(
                    labelText: 'Отменить',
                    onTap: () {
                      context.read<AppointmentsCubit>().deleteAppointment(
                          appointmentId: appointmentItem.id,
                          userId: appointmentItem.patientInfo.id as String);
                    }
                  )
                )
              ],
            )
        ],
      ),
    );
  }
}
