import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/modules/login/biometric_authentication/local_auth_service.dart';
import 'package:medlike/modules/settings/settings_list_item.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

class BiometricAuthentication extends StatefulWidget {
  const BiometricAuthentication({Key? key}) : super(key: key);

  @override
  State<BiometricAuthentication> createState() =>
      _BiometricAuthenticationState();
}

class _BiometricAuthenticationState extends State<BiometricAuthentication> {
  late bool isEnabled = false;
  late bool isBiometricAuthenticate = true;

  @override
  void initState() {
    super.initState();
    initBiometricValue();
  }

  void initBiometricValue() async {
    String authMethod =
        '${await UserSecureStorage.getField(AppConstants.useBiometricMethodAuthentication)}';
    bool isSupportedBiometric = await AuthService.canCheckBiometrics();
    if (authMethod == 'false' || !isSupportedBiometric) {
      isBiometricAuthenticate = false;
    } else {
      isBiometricAuthenticate = true;
    }
    if (authMethod == 'true') {
      setState(() {
        isEnabled = true;
      });
    }
  }

  void _onChanged(bool value) {
    if (value) {
      UserSecureStorage.setField(
          AppConstants.useBiometricMethodAuthentication, 'true');
    } else {
      UserSecureStorage.setField(
          AppConstants.useBiometricMethodAuthentication, 'false');
    }
    setState(() {
      isEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isBiometricAuthenticate
        ? SettingsListItem(
            title: 'Вход по Face ID',
            iconSrc: 'assets/icons/settings/ic_faceid_setting_outline.svg',
            subtitle: 'Авторизация в приложении с помощью распознавания лица',
            onTap: () {
              _onChanged(!isEnabled);
            },
            rightActionWidget: CupertinoSwitch(
              value: isEnabled,
              onChanged: _onChanged,
              activeColor: Theme.of(context).primaryColor,
              trackColor: AppColors.secondBackground,
            ),
          )
        : const SizedBox();
  }
}
