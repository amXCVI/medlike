import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/login/auth_skeletons/default_auth_skeleton.dart';
import 'package:medlike/modules/login/recover_passvord/recover_password_new_view.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class RecoverPasswordNewPage extends StatelessWidget {
  const RecoverPasswordNewPage({Key? key, required this.smsToken})
      : super(key: key);

  final String smsToken;

  @override
  Widget build(BuildContext context) {
    void _authenticateWithPhoneAndPassword({required String password}) {
      Future<bool> checkIsAcceptedUserAgreements() async {
        bool res = await context.read<UserCubit>().checkUserAgreements();
        return res;
      }

      context.read<UserCubit>().handleSubmitPassword(password).then((value) {
        checkIsAcceptedUserAgreements().then((res) {
          if (!res) {
            context.router.replaceAll([AuthUserAgreementsRoute()]);
          }
        });
      });
    }
    //! По-хорошему, нужно только один раз все обернуть в кубит.
    //! Сейчас сделано здесь, и глубже, поле ввода

    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (context.router.current.name == AppRoutes.loginRecoverPasswordNew) {
          context.read<UserCubit>().getPhoneNumber();
        }
      },
      builder: (context, state) {
        if (state.userPhoneNumber == null) {
          return const DefaultAuthSkeleton();
        }
        return DefaultScaffold(
          child: state.resetPasswordStatus == ResetPasswordStatuses.loading ||
              state.changePasswordStatus == ChangePasswordStatuses.loading
              ? const DefaultAuthSkeleton()
              : RecoverPasswordNewView(
                  smsToken: smsToken,
                  phoneNumberFromState: state.userPhoneNumber!,
                  onAuth: _authenticateWithPhoneAndPassword,
                ),
          appBarTitle: 'Пароль',
          isChildrenPage: true,
          bottomNavigationBar: const SizedBox(),
        );
      },
    );
  }
}
