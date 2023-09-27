import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/modules/login/create_pin_code_page/pin_code_keyboard.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/modules/login/biometric_authentication/local_auth_service.dart';
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
  bool isAwainting = false; //TODO:Change on false after debug
  @override
  void initState() {
    pointsArray = List<int>.from(initPointsArray);
    if (widget.noUsedBiometric ?? false) {
      isShowingBiometricModal = false;
      isSupportedAndEnabledBiometric = false;
      return;
    } else {
      initBiometricValue();
    }
    super.initState();
  }

  void initBiometricValue() async {
    bool bioAuthAvalibaleAndActive = await AuthService.couldUseBio();

    setState(() {
      isSupportedAndEnabledBiometric = bioAuthAvalibaleAndActive;
    });

    if (await AuthService.canUseFaceId()) {
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

  void onItemInput(PinCodeKeyboardItem e) async {
    if (isAwainting) return;
    // Check if using biometric input
    if (e.buttonType == PinCodeKeyboardTypes.biometric &&
        isSupportedAndEnabledBiometric) {
      setState(() {
        isShowingBiometricModal = true;
        pointsArray.setAll(0, initPointsArray);
      });
      _authenticate();
    }

    int firstEpmtyIndex = pointsArray.indexOf(-1);

    // Just set value for tile
    if (firstEpmtyIndex != -1) {
      setState(() {
        pointsArray[firstEpmtyIndex] = e.label;
      });
    }

    // Handling delete icon(Button)
    if (e.label == -1 && firstEpmtyIndex > 0) {
      setState(() {
        pointsArray[firstEpmtyIndex - 1] = -1;
      });
    }

    //Check last time if we input the last value
    firstEpmtyIndex = pointsArray.indexOf(-1);
    if (firstEpmtyIndex == -1) {
      setState(() {
        isAwainting = true;
      });
      bool res = await widget.setPinCode(pointsArray);
      if (!res) {
        HapticFeedback.heavyImpact();
        setState(() {
          pointsArray.setAll(0, initPointsArray);
          isAwainting = false;
        });
      }
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
      setState(() {
        isAwainting = true;
      });
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
                                child: isAwainting
                                    ? Lottie.asset(
                                        "assets/animations/pulsing-dot-lottie.json",
                                        repeat: true,
                                        width: 20,
                                        height: 20,
                                      )
                                    : Container(
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
            child: Container(
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
                            onTap:
                                isAwainting ? null : () => {onItemInput(item)},
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
