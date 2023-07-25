import 'dart:convert';
import 'package:medlike/constants/entity_types.dart';
import 'package:get_it/get_it.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';
import 'package:medlike/utils/notifications/push_navigation_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final getIt = GetIt.instance;

void pushHandler(String? payload, {
  bool onAppOpen = false
}) {
  Sentry.captureMessage("JSON Decode: $payload");
  final data = jsonDecode(payload ?? '{}');

  final _router = getIt<AppRouter>();
  final pushNavigationService = getIt<PushNavigationService>();

  final userId = data['UserId'] as String?;
  String? notificationId;

  Sentry.captureMessage("On push tap Data: ${data['EntityType']}");

  switch(data['EntityType']) {
    case EntityType.newMedcardEvent:
      if(userId != null) {
        final route = MedcardRoute(
          userId: userId,
          isChildrenPage: false,
          eventId: data['EventId']
        );

        if(!onAppOpen) {
          pushNavigationService.nextPage = route;
        }
        _router.push(route);
      }
      break;
    case EntityType.appointmentCanceled:
    case EntityType.appointmentScheduled:
      notificationId = data['EventId'];
      continue appointment;
    appointment:
    case EntityType.appointmentReminder24h:
      final date = getFromAppointment(data['message']);

      final _route = AppointmentsRoute(
        initDay: date,
        notificationId: notificationId
      );

      if(!onAppOpen) {
        pushNavigationService.nextPage = _route;
      }
      _router.push(_route);
    break;
  case EntityType.memberAttached:
    _router.push(const MainRoute());
    break;
  }
}
