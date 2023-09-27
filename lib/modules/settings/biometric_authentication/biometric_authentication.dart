import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/modules/login/biometric_authentication/local_auth_service.dart';
import 'package:medlike/modules/settings/settings_list_item.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:app_settings/app_settings.dart';

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
  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    initBiometricValue();
    super.initState();
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

  Future<bool> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: isFaceId
            ? "Посмотрите в камеру"
            : 'Прикоснитесь к сенсору устройства',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          sensitiveTransaction: true,
          biometricOnly: true,
        ),
        authMessages: <AuthMessages>[
          const AndroidAuthMessages(
            biometricRequiredTitle: 'Прикоснитесь к сенсору устройства',
            cancelButton: 'Отмена',
            signInTitle: 'Авторизация',
            biometricHint: '',
          ),
          const IOSAuthMessages(
            cancelButton: 'Отмена',
          ),
        ],
      );
    } on PlatformException catch (e) {
      print(e);
      return false;
    }

    if (authenticated) {
      return true;
    } else {
      return false;
    }
  }

  void _onChanged(bool value) {
    if (!isBiometricAuthenticate) {
      AppSettings.openAppSettings(type: AppSettingsType.device);
    }

    if (value) {
      _authenticate().then((authRes) => {
            if (!authRes)
              setState(() {
                isEnabled = false;
              })
            else
              setState(() {
                isEnabled = true;
              })
          });
    } else {
      setState(() {
        isEnabled = false;
      });
    }
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
  }

  @override
  Widget build(BuildContext context) {
    return SettingsListItem(
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
        value: isEnabled && isBiometricAuthenticate,
        onChanged: _onChanged,
        activeColor: Theme.of(context).primaryColor,
        trackColor: AppColors.secondBackground,
      ),
    );
  }
}
