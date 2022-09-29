import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';

class AppointmentItemCard extends StatelessWidget {
  const AppointmentItemCard(
      {Key? key,
      required this.appointmentItem,
      required this.handleTapOnAppointment})
      : super(key: key);

  final AppointmentModel appointmentItem;
  final void Function(DateTime) handleTapOnAppointment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        handleTapOnAppointment(appointmentItem.appointmentDateTime);
      },
      child: Container(
          width: MediaQuery.of(context).size.width - 32,
          margin: const EdgeInsets.only(left: 4, right: 4, top: 16, bottom: 32),
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
                          .replaceAll(Characters(''), Characters('\u{200B}'))
                          .toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    )
                  : Text.rich(
                      TextSpan(
                        children: [
                          ...appointmentItem.researches.map((e) => WidgetSpan(
                                  child: Text(
                                e.name.characters
                                    .replaceAll(
                                        Characters(''), Characters('\u{200B}'))
                                    .toString(),
                                style: Theme.of(context).textTheme.titleMedium,
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
                          child: Text('appointmentItem.doctorInfo.lastName'[0]),
                          backgroundColor: AppColors.mainBrand[100],
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          '${appointmentItem.doctorInfo.lastName} ' +
                              '${appointmentItem.doctorInfo.firstName}'[0] +
                              '. ${appointmentItem.doctorInfo.middleName![0]}' +
                              '.',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.lightText),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  : const SizedBox(height: 26),
              const SizedBox(height: 8),
              SizedBox(
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
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
                              Text(DateFormat('dd.MM.yy, HH:mm').format(
                                  dateTimeToUTC(
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
                              Text(
                                '${appointmentItem.patientInfo.name}'
                                    .characters
                                    .replaceAll(
                                        Characters(''), Characters('\u{200B}'))
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
              ),
            ],
          )),
    );
  }
}
