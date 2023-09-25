import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/login/recover_passvord/recover_password_sms_view.dart';
import 'package:medlike/modules/login/recover_passvord/web_recover_password_sms_page.dart';
import 'package:medlike/utils/helpers/project_determiner.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/unauth_support_button/unauth_support_button.dart';

@RoutePage()
class RecoverPasswordSmsPage extends StatelessWidget {
  const RecoverPasswordSmsPage({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (ProjectDeterminer.getProjectType() == Projects.WEB) {
        return WebRecoverPasswordSmsPage(
          phoneNumber: phoneNumber,
          timerEnd: state.timerEnd,
        );
      } else {
        return DefaultScaffold(
          isAuth: false,
          appBarTitle: 'SMS-код',
          actions: const [UnauthSupportButton()],
          isChildrenPage: true,
          bottomNavigationBar: const SizedBox(),
          child: RecoverPasswordSmsView(
            phoneNumber: phoneNumber,
            timerEnd: state.timerEnd,
          ),
        );
      }
    });
  }
}
