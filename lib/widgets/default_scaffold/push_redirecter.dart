import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:medlike/constants/push_constants.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/utils/notifications/push_notifications_service.dart';

class PushRedirecter extends StatefulWidget {
  const PushRedirecter({Key? key}) : super(key: key);

  @override
  State<PushRedirecter> createState() => _PushRedirecterState();
}

class _PushRedirecterState extends State<PushRedirecter> {

  @override
  void initState() {
    FCMService.initializeSelect(((notificationResponse) {
      final data = jsonDecode(notificationResponse.payload ?? '{}');
      print('payload ${notificationResponse.payload} ${AppRoutes.health}');

      print('payload ${context.router}');
      print(context.router);

      onPayload(data);
    }));
    super.initState();
  }

  void onPayload(dynamic data) {
    final userId = data['UserId'] as String?;

    switch(data['EntityType']) {
      case PushConstants.newMedcardEvent:
        if(userId != null) {
          context.router.push(
            MedcardRoute(
              userId: userId,
              isChildrenPage: true
            )
          );
        }
        break;
      case PushConstants.appointmentCanceled:
      case PushConstants.appointmentScheduled:
      case PushConstants.appointmentReminder24h:
        context.router.push(
          AppointmentsRoute()
        );
        break;
      case PushConstants.memberAttached:
        context.router.push(const MainRoute());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  const SizedBox();
  }
}
