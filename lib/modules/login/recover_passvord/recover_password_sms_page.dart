import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/login/recover_passvord/recover_password_sms_view.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/unauth_support_button/unauth_support_button.dart';

class RecoverPasswordSmsPage extends StatelessWidget {
  const RecoverPasswordSmsPage({
    Key? key, 
    required this.phoneNumber,
  }) : super(key: key);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return DefaultScaffold(
          child: RecoverPasswordSmsView(
            phoneNumber: phoneNumber,
            time: state.timer ?? 0,
          ),
          appBarTitle: 'SMS-код',
          actions: const [UnauthSupportButton()],
          isChildrenPage: true,
          bottomNavigationBar: const SizedBox(),
        );
      }
    );
  }
}
