import 'package:flutter_test/flutter_test.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';
import 'package:medlike/utils/helpers/timestamp_converter.dart';
import 'package:medlike/utils/helpers/timestamp_helper.dart';

import 'data.dart';

void main() {
  test('How timestamp look in description', () {
    final appointmentsList =
        appointmentsJson.map((e) => AppointmentModel.fromJson(e)).toList();

    final fixedAppointmentsList = appointmentsList
        .map((e) => AppointmentModelWithTimeZoneOffset(
              status: e.status,
              needConfirmation: e.needConfirmation,
              comment: e.comment,
              researchPlace: e.researchPlace,
              id: e.id,
              appointmentDateTime:
                  const TimestampConverter().fromJson(e.appointmentDateTime),
              timeZoneOffset: getTimezoneOffset(e.appointmentDateTime),
              patientInfo: e.patientInfo,
              clinicInfo: e.clinicInfo,
              doctorInfo: e.doctorInfo,
              researches: e.researches,
              categoryType: e.categoryType,
              isVideo: e.isVideo,
              payType: e.payType,
              isDraft: e.isDraft,
              orderId: e.orderId,
              scheduleId: e.scheduleId,
              paymentStatus: e.paymentStatus,
              recommendations: e.recommendations,
              items: e.items,
              checkURI: e.checkURI,
            ))
        .toList();

    final appointmentItem = fixedAppointmentsList
        .where(
            (element) => element.id == '158598df-66c9-4b67-a9e8-47671dbcdbdb')
        .toList()[0];

    final dateString = getAppointmentTime(
      appointmentItem.appointmentDateTime,
      appointmentItem.timeZoneOffset,
      formatSting: 'dd.MM.yyyy, HH:mm',
    );

    expect(dateString, '25.03.2023, 14:45 (МСК +4)');
  });
}
