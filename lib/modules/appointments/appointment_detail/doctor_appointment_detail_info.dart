import 'package:flutter/material.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/widgets/doctor_info_card/doctor_info_card.dart';

class DoctorAppointmentDetailInfo extends StatelessWidget {
  const DoctorAppointmentDetailInfo({
    Key? key,
    required this.doctorInfo,
    this.appointmentReview,
  }) : super(key: key);

  final DoctorInfoModel doctorInfo;
  final AppointmentReviewModel? appointmentReview;

  @override
  Widget build(BuildContext context) {
    if (doctorInfo.id == null) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Врач',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: DoctorInfoCard(
              doctorInfo: doctorInfo,
              review: appointmentReview,
            )),
      ],
    );
  }
}
