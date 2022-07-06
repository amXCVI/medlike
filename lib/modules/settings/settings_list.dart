import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/settings/about_app_dialog.dart';
import 'package:medlike/modules/settings/settings_list_item.dart';
import 'package:medlike/navigation/routes_names_map.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleSignOut() {
      context.read<UserCubit>().signOut();
      context.router.pushNamed(AppRoutes.loginPinCodeCheck);
    }

    void handleChangePinCode() {
      context.router.pushNamed(AppRoutes.loginPinCodeCreate);
    }

    return ListView(
      shrinkWrap: true,
      children: [
        SettingsListItem(
          title: 'Сменить пароль',
          iconSrc: 'assets/icons/settings/ic_password_outline.svg',
          onTap: () {},
        ),
        SettingsListItem(
          title: 'Сменить пин-код',
          iconSrc: 'assets/icons/settings/ic_pin_outline.svg',
          onTap: handleChangePinCode,
        ),
        SettingsListItem(
          title: 'Тех. поддержка',
          subtitle: 'Обратная связь',
          iconSrc: 'assets/icons/settings/ic_feedback_outline.svg',
          onTap: () {},
        ),
        SettingsListItem(
          title: 'Пользовательское соглашение',
          iconSrc: 'assets/icons/settings/ic_agreement_outline.svg',
          onTap: () {},
        ),
        SettingsListItem(
          title: 'О приложении',
          iconSrc: 'assets/icons/settings/ic_about_outline.svg',
          onTap: () {
            showDialog<void>(context: context, builder: (context) => const AboutAppDialog());
          },
        ),
        SettingsListItem(
          title: 'Выйти из приложения',
          iconSrc: 'assets/icons/settings/ic_exit_outline.svg',
          onTap: handleSignOut,
        )
      ],
    );
  }
}
