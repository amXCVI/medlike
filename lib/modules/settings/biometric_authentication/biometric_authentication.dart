import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
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
  late bool isFaceId = false;

  @override
  void initState() {
    super.initState();
    initBiometricValue();
  }

  void initBiometricValue() async {
    String authMethod =
        '${await UserSecureStorage.getField(AppConstants.useBiometricMethodAuthentication)}';
    bool isSupportedBiometric = await AuthService.canCheckBiometrics();
    List<BiometricType> supportedBiometricTypesList =
        await AuthService.getAvailableBiometrics();

    if (!isSupportedBiometric) {
      isBiometricAuthenticate = false;
    } else {
      isBiometricAuthenticate = true;
      if (supportedBiometricTypesList.contains(BiometricType.face)) {
        setState(() {
          isFaceId = true;
        });
      }
    }

    if (authMethod == SelectedAuthMethods.faceId.toString() ||
        authMethod == SelectedAuthMethods.touchId.toString()) {
      setState(() {
        isEnabled = true;
      });
    }
  }

  void _onChanged(bool value) {
    if (value && isFaceId) {
      UserSecureStorage.setField(AppConstants.useBiometricMethodAuthentication,
          SelectedAuthMethods.faceId.toString());
    } else if (value && !isFaceId) {
      UserSecureStorage.setField(AppConstants.useBiometricMethodAuthentication,
          SelectedAuthMethods.touchId.toString());
    } else {
      UserSecureStorage.setField(AppConstants.useBiometricMethodAuthentication,
          SelectedAuthMethods.pinCode.toString());
    }
    setState(() {
      isEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isBiometricAuthenticate
        ? SettingsListItem(
            title: isFaceId ? 'Вход по Face ID' : 'Вход по Touch ID',
            iconSrc: isFaceId
                ? 'assets/icons/settings/ic_faceid_setting_outline.svg'
                : 'assets/icons/settings/ic_fingerprint_setting_outline.svg',
            subtitle: isFaceId
                ? 'Авторизация в приложении с помощью распознавания лица'
                : 'Авторизация в приложении по отпечатку пальца',
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
