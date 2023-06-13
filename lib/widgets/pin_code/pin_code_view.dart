import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/modules/login/create_pin_code_page/pin_code_keyboard.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/modules/login/biometric_authentication/local_auth_service.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class PinCodeView extends StatefulWidget {
  const PinCodeView({
    Key? key,
    required this.setPinCode,
    required this.handleBiometricMethod,
    this.isForcedShowingBiometricModal = false,
    this.height,
    this.signInTitle,
    required this.pinCodeTitle,
    this.isInit = false,
    this.noUsedBiometric,
  }) : super(key: key);
  final Future<bool> Function(List<int> pin) setPinCode;
  final void Function(bool) handleBiometricMethod;
  final bool isForcedShowingBiometricModal;
  final double? height;
  final String? signInTitle;
  final String pinCodeTitle;
  final bool isInit;
  final bool? noUsedBiometric;

  @override
  State<PinCodeView> createState() => _PinCodeViewState();
}

class _PinCodeViewState extends State<PinCodeView> {
  late List<int> pointsArray;
  final List<int> initPointsArray = [-1, -1, -1, -1, -1];
  late bool isSupportedAndEnabledBiometric = false;
  late bool isShowingBiometricModal = true;
  late bool isFaceId = false;
  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    pointsArray = initPointsArray;
    if (widget.noUsedBiometric != null && widget.noUsedBiometric == true) {
      isShowingBiometricModal = false;
      isSupportedAndEnabledBiometric = false;
      return;
    } else {
      initBiometricValue();
    }
    super.initState();
  }

  void initBiometricValue() async {
    String authMethod =
        '${await UserSecureStorage.getField(AppConstants.useBiometricMethodAuthentication)}';
    bool isSupportedBiometric = await AuthService.canCheckBiometrics();
    if (authMethod == SelectedAuthMethods.pinCode.toString() ||
        authMethod == 'null' ||
        !isSupportedBiometric) {
      setState(() {
        isSupportedAndEnabledBiometric = false;
      });
    } else if (!widget.isInit) {
      isSupportedAndEnabledBiometric = true;
    }

    List<BiometricType> supportedBiometricTypesList =
        await AuthService.getAvailableBiometrics();
    if (supportedBiometricTypesList.contains(BiometricType.face)) {
      setState(() {
        isFaceId = true;
      });
    }

    if (widget.isForcedShowingBiometricModal) {
      _authenticate();
    }
  }

  void onCancelBiometricAuthMethod() {
    setState(() {
      isShowingBiometricModal = false;
    });
    if (widget.isForcedShowingBiometricModal) {
      widget.handleBiometricMethod(false);
    }
  }

  void onSuccessAuthBiometric() {
    widget.handleBiometricMethod(true);
    setState(() {
      isShowingBiometricModal = false;
    });
  }

  void onChangePointsArray(PinCodeKeyboardItem e) async {
    SystemSound.play(SystemSoundType.click);
    HapticFeedback.lightImpact();
    int firstEmptyIndex = pointsArray.indexOf(-1);

    if (e.buttonType == PinCodeKeyboardTypes.number) {
      if (firstEmptyIndex != -1) {
        setState(() {
          pointsArray[firstEmptyIndex] = e.label;
        });
      }
    } else if (e.buttonType == PinCodeKeyboardTypes.biometric &&
        isSupportedAndEnabledBiometric) {
      setState(() {
        isShowingBiometricModal = true;
      });
      setState(() {
        pointsArray = initPointsArray;
      });

      _authenticate();
    } else {
      if (firstEmptyIndex != -1 && firstEmptyIndex != 0) {
        setState(() {
          pointsArray[firstEmptyIndex - 1] = -1;
        });
      } else {
        setState(() {
          pointsArray.last = -1;
        });
      }
    }

    if (firstEmptyIndex == pointsArray.length - 1) {
      // Сам знаю, что дичь, но мне плохо
      bool res = await widget.setPinCode(pointsArray);
      if (!res) {
        HapticFeedback.vibrate();
        for (int i = 0; i < pointsArray.length; i++) {
          setState(() {
            pointsArray[i] = -1;
          });
        }
        setState(() {
          firstEmptyIndex = 0;
        });
      }

      return;
    }
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Прикоснитесь к сенсору устройства',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          sensitiveTransaction: true,
          biometricOnly: true,
        ),
        authMessages: <AuthMessages>[
          AndroidAuthMessages(
            biometricRequiredTitle: 'Прикоснитесь к сенсору устройства',
            cancelButton: 'Отмена',
            signInTitle: widget.signInTitle ?? 'Авторизация',
            biometricHint: '',
          ),
          const IOSAuthMessages(
            cancelButton: 'Отмена',
          ),
        ],
      );
    } on PlatformException catch (e) {
      print(e);
      return;
    }

    if (authenticated) {
      onSuccessAuthBiometric();
    } else {
      onCancelBiometricAuthMethod();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen =
        MediaQuery.of(context).size.height <= AppConstants.mdScreenHeight;

    return SizedBox(
      width: 300,
      height: isSmallScreen
          ? widget.height
          : MediaQuery.of(context).size.height - 160,
      child: Column(
        mainAxisAlignment: isSmallScreen
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceBetween,
        children: [
          isSmallScreen
              ? const SizedBox(height: 12)
              : const Expanded(child: SizedBox()),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: isSmallScreen
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    widget.pinCodeTitle,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: AppColors.mainText),
                    textAlign: TextAlign.center,
                  )),
                  SizedBox(
                      height: MediaQuery.of(context).size.width <
                              AppConstants.smScreenWidth
                          ? 8
                          : 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...pointsArray
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: e == -1
                                        ? AppColors.circleBgFirst
                                        : AppColors.mainBrandColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ))
                          .toList(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Material(
            color: Theme.of(context).colorScheme.background,
            child: SizedBox(
              width: 300,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  ...keyboardList
                      .map((item) => InkWell(
                            onTap: () => {onChangePointsArray(item)},
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: item.buttonType ==
                                      PinCodeKeyboardTypes.svgPicture
                                  ? Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(
                                          item.imgSrc as String,
                                          width: 34),
                                    )
                                  : item.buttonType ==
                                          PinCodeKeyboardTypes.biometric
                                      ? isSupportedAndEnabledBiometric &&
                                              !widget.isInit
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: SvgPicture.asset(
                                                isFaceId
                                                    ? item.imgSrcFaceId
                                                        as String
                                                    : item.imgSrcTouchId
                                                        as String,
                                                width: 34,
                                              ),
                                            )
                                          : const SizedBox()
                                      : Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: AppColors.mainText),
                                          ),
                                          child: Center(
                                            child: Text(
                                              item.label.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge
                                                  ?.copyWith(
                                                      color: AppColors.mainText,
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                          ),
                                        ),
                            ),
                          ))
                      .toList(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
