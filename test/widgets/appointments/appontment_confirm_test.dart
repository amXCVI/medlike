import 'package:flutter_test/flutter_test.dart';
import 'package:medlike/data/models/appointment_models/appointment_models.dart';
import 'package:medlike/data/repository/appointments_repository.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/modules/main_page/notifications/appointment_confirm_widget.dart';
import 'package:medlike/modules/main_page/notifications/appontment_confirm_view.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../test_init.dart';
import '../../utils/timestamp/data.dart';

void main() {
  testWidgets('Appointment confirm test', (WidgetTester tester) async {
      final appointmentsList = appointmentsJson
        .map((e) => AppointmentModel.fromJson(e))
      .toList();

      final appointmentItem = appointmentsList.where((element) => element.id == '158598df-66c9-4b67-a9e8-47671dbcdbdb')
        .toList()[0];

      final appointmentsRepository = MockAppointmentsRepository();
      // Stub a method before interacting with the mock.
      when(() => appointmentsRepository.getLastAppointment()).thenAnswer(
        ((invocation) => Future.sync(() => appointmentItem))
      );

      // Build our app and trigger a frame.
      await tester.pumpWidget(await withApp(
        const AppointmentsConfirmWidget(),
        appointmentsRepository
      ), const Duration(seconds: 30));

      await tester.pumpAndSettle();

      var appointmentConfirmFinder = find.byType(AppointmentsConfirmWidget);
      expect(appointmentConfirmFinder, findsOneWidget);

      final context = tester.element(appointmentConfirmFinder);
      context.read<AppointmentsCubit>().getLastAppointment(true);

      await tester.pumpAndSettle();

      var appointmentConfirmViewFinder = find.byType(AppointmentConfirmView);
      
      expect(appointmentConfirmViewFinder, findsOneWidget);
    });
}
