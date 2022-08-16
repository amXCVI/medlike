import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/modules/login/create_pin_code_page/pin_code_keyboard.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/modules/login/biometric_authentication/local_auth_service.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

class PinCodeView extends StatefulWidget {
  const PinCodeView(
      {Key? key, required this.setPinCode, required this.handleBiometricMethod})
      : super(key: key);
  final void Function(List<int> pin) setPinCode;
  final void Function() handleBiometricMethod;

  @override
  State<PinCodeView> createState() => _PinCodeViewState();
}

class _PinCodeViewState extends State<PinCodeView> {
  late List<int> pointsArray;
  final List<int> initPointsArray = [-1, -1, -1, -1, -1];
  late bool isSupportedAndEnabledBiometric = false;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      String authMethod =
          '${await UserSecureStorage.getField(AppConstants.useBiometricMethodAuthentication)}';
      bool isSupportedBiometric = await AuthService.canCheckBiometrics();
      if (authMethod == 'false' || !isSupportedBiometric) {
        isSupportedAndEnabledBiometric = false;
      } else {
        isSupportedAndEnabledBiometric = true;
      }
    });
    pointsArray = initPointsArray;
    super.initState();
  }

  void onChangePointsArray(PinCodeKeyboardItem e) {
    HapticFeedback.vibrate();
    int firstEmptyIndex = pointsArray.indexOf(-1);

    if (e.buttonType == PinCodeKeyboardTypes.number) {
      if (firstEmptyIndex != -1) {
        setState(() {
          pointsArray[firstEmptyIndex] = e.label;
        });
      }
    } else if (e.buttonType == PinCodeKeyboardTypes.biometric) {
      widget.handleBiometricMethod();
      setState(() {
        pointsArray = initPointsArray;
      });
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
      widget.setPinCode(pointsArray);
      setState(() {
        pointsArray = initPointsArray;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: MediaQuery.of(context).size.height - 280,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...pointsArray
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
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
          ),
          Material(
            color: Theme.of(context).backgroundColor,
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
                                      ? isSupportedAndEnabledBiometric
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: SvgPicture.asset(
                                                item.imgSrc as String,
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
        ],
      ),
    );
  }
}
