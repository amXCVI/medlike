import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/settings/about_app/about_app_dialog.dart';
import 'package:medlike/modules/settings/biometric_authentication/biometric_authentication.dart';
import 'package:medlike/modules/settings/delete_profile/delete_profile_dialog.dart';
import 'package:medlike/modules/settings/exit_app/exit_app_dialog.dart';
import 'package:medlike/modules/settings/settings_list_item.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/scrollbar/default_scrollbar.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleChangePinCode() {
      context.router.pushNamed(AppRoutes.loginPinCodeCreate);
    }

    void handleTapAgreements() {
      context.router.push(const AgreementsRoute());
    }

    void handleTapOnChangePassword() {
      context.router.push(RecoverPasswordNewRoute(smsToken: ''));
    }

    return DefaultScrollbar(
      child: ListView(
        shrinkWrap: true,
        children: [
          const BiometricAuthentication(),
          SettingsListItem(
            title: 'Сменить пароль',
            iconSrc: 'assets/icons/settings/ic_password_outline.svg',
            onTap: handleTapOnChangePassword,
            rightActionWidget:
                SvgPicture.asset('assets/icons/subscribe/right_arrow_icon.svg'),
          ),
          SettingsListItem(
            title: 'Сменить пин-код',
            iconSrc: 'assets/icons/settings/ic_pin_outline.svg',
            onTap: handleChangePinCode,
            rightActionWidget:
                SvgPicture.asset('assets/icons/subscribe/right_arrow_icon.svg'),
          ),
          SettingsListItem(
            title: 'Тех. поддержка',
            subtitle: 'Обратная связь',
            iconSrc: 'assets/icons/settings/ic_feedback_outline.svg',
            onTap: () {
              context.router.push(const SupportRoute());
            },
            rightActionWidget:
                SvgPicture.asset('assets/icons/subscribe/right_arrow_icon.svg'),
          ),
          SettingsListItem(
            title: 'Документы',
            iconSrc: 'assets/icons/settings/ic_agreement_outline.svg',
            onTap: handleTapAgreements,
            rightActionWidget:
                SvgPicture.asset('assets/icons/subscribe/right_arrow_icon.svg'),
          ),
          SettingsListItem(
            title: 'О приложении',
            iconSrc: 'assets/icons/settings/ic_about_outline.svg',
            onTap: () {
              showDialog<void>(
                  context: context,
                  builder: (context) => const AboutAppDialog());
            },
          ),
          SettingsListItem(
            title: 'logout',
            iconSrc: 'assets/icons/settings/ic_exit_outline.svg',
            onTap: () {
              context.read<UserCubit>().signOut();
              context.router.replaceAll([const CheckPinCodeRoute()]);
            },
          ),
          SettingsListItem(
            title: 'Выйти из приложения',
            iconSrc: 'assets/icons/settings/ic_exit_outline.svg',
            onTap: () {
              showDialog<void>(
                  context: context,
                  builder: (context) => const ExitAppDialog());
            },
          ),
          SettingsListItem(
            title: 'Очистить все и выйти',
            iconSrc: 'assets/icons/settings/ic_exit_outline.svg',
            onTap: () {
              context.read<UserCubit>().signOut();
              UserSecureStorage.cleanStorage();
              context.router.replaceAll([StartPhoneNumberRoute()]);
            },
          ),
          SettingsListItem(
            title: 'Удалить учетную запись',
            iconSrc: 'assets/icons/settings/ic_delete_profile.svg',
            onTap: () {
              showDialog<void>(
                  context: context,
                  builder: (context) => const DeleteProfileDialog());
            },
            color: Theme.of(context).errorColor,
          )
        ],
      ),
    );
  }
}
