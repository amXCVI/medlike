import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/modules/appointments/appointment_item_recomendations.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/clinic_address_helper.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({Key? key, required this.appointmentItem})
      : super(key: key);

  final AppointmentModel appointmentItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appointmentItem.categoryType == 1 || appointmentItem.categoryType == 0
              ? Text(
                  '${CategoryTypes.getCategoryTypeByCategoryTypeId(appointmentItem.categoryType).russianCategoryTypeName}, ${appointmentItem.doctorInfo.specialization}',
                  style: Theme.of(context).textTheme.titleMedium)
              : Text.rich(TextSpan(children: [
                  WidgetSpan(
                      child: Text(
                          '${CategoryTypes.getCategoryTypeByCategoryTypeId(appointmentItem.categoryType).russianCategoryTypeName}, ',
                          style: Theme.of(context).textTheme.titleMedium)),
                  ...appointmentItem.researches.map((e) => WidgetSpan(
                      child: Text(e.name,
                          style: Theme.of(context).textTheme.titleMedium)))
                ])),
          appointmentItem.doctorInfo.id != null
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
            children: [
              SvgPicture.asset('assets/icons/appointments/solid.svg'),
              const SizedBox(width: 8.0),
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: Text(
                    ClinicAddressHelper.getShortAddress(
                        appointmentItem.clinicInfo.address!),
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodySmall),
              ),
            ],
          ),
          AppointmentItemRecommendations(
              recommendations: appointmentItem.recommendations ?? ''),
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
                        Text(DateFormat('HH:mm').format(dateTimeToUTC(
                            appointmentItem.appointmentDateTime,
                            int.parse(DateTime.now()
                                .timeZoneOffset
                                .inHours
                                .toString())))),
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
          )
        ],
      ),
    );
  }
}
