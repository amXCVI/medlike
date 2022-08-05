import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/appointment_info.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/confirmation_action_button.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/user_info.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/dividers/dash_divider.dart';
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';

class ConfirmationSubscribePage extends StatelessWidget {
  const ConfirmationSubscribePage({Key? key, required this.userId})
      : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<SubscribeCubit>().unlockCell(userId: userId);
        Navigator.pop(context);
        return false;
      },
      child: DefaultScaffold(
        appBarTitle: 'Запись на прием',
        isChildrenPage: true,
        actionButton: FloatingActionButton.extended(
            onPressed: () {
              context.read<SubscribeCubit>().createNewAppointment(
                    userId: userId,
                    userName:
                        context.read<UserCubit>().getShortUserName(userId),
                  );
            },
            label: const ConfirmationActionButtonLabel()),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: DefaultScrollbar(
            child: ListView(
              shrinkWrap: true,
              children: [
                UserInfo(userId: userId),
                const SizedBox(height: 19),
                const DashDivider(),
                const SizedBox(height: 24),
                const AppointmentInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
