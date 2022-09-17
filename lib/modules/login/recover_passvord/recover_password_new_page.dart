import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/login/auth_skeletons/default_auth_skeleton.dart';
import 'package:medlike/modules/login/recover_passvord/recover_password_new_view.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class RecoverPasswordNewPage extends StatelessWidget {
  const RecoverPasswordNewPage({Key? key, required this.smsToken})
      : super(key: key);

  final String smsToken;

  @override
  Widget build(BuildContext context) {
    //! По-хорошему, нужно только один раз все обернуть в кубит.
    //! Сейчас сделано здесь, и глубже, поле ввода
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return DefaultScaffold(
          child: state.resetPasswordStatus == ResetPasswordStatuses.loading ||
              state.changePasswordStatus == ChangePasswordStatuses.loading
              ? const DefaultAuthSkeleton()
              : RecoverPasswordNewView(smsToken: smsToken),
          appBarTitle: 'Пароль',
          isChildrenPage: true,
          bottomNavigationBar: const SizedBox(),
        );
      },
    );
  }
}
