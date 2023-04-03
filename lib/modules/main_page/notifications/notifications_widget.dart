import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/main_page/notifications/notifications_widget_view.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({Key? key}) : super(key: key);

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    try {
      context.read<UserCubit>().getLastNotReadNotification(true);
      setState(() {
        isLoaded = true;
      });
    } catch(err, stacktrace) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const NotificationsWidgetView();
  }
}
